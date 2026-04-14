[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [Parameter()]
    [string]$Organization = 'REPLACE-WITH-ORGANIZATION',

    [Parameter()]
    [string]$ApplicationId = 'REPLACE-WITH-APPLICATION-ID',

    [Parameter()]
    [string]$CertificateThumbprint = 'REPLACE-WITH-CERTIFICATE-THUMBPRINT',

    [Parameter()]
    [switch]$ResetManagedObjects
)

$ErrorActionPreference = 'Stop'
$script:InvocationCmdlet = $PSCmdlet

$managedGroups = @(
    @{
        Name        = 'OS group'
        DisplayName = 'OFFICIAL Sensitive (group)'
        Tooltip     = 'OFFICIAL Sensitive Special Handling and Information Management Marker labels'
        Color       = '#EAA300'
    },
    @{
        Name        = 'P group'
        DisplayName = 'PROTECTED (group)'
        Tooltip     = 'PROTECTED Special Handling and Information Management Marker labels'
        Color       = '#3A96DD'
    },
    @{
        Name        = 'P C group'
        DisplayName = 'PROTECTED CABINET (group)'
        Tooltip     = 'PROTECTED CABINET and Information Management Marker labels'
        Color       = '#3A96DD'
    }
)

$managedLabels = @(
    'UNOFFICIAL',
    'OFFICIAL',
    'OFFICIAL Sensitive',
    'OS PP',
    'OS LP',
    'OS LS',
    'PROTECTED',
    'P PP',
    'P LP',
    'P LS',
    'P C',
    'P C PP',
    'P C LP',
    'P C LS'
)

$managedLabelPolicies = @(
    'Users up to OFFICIAL Sensitive',
    'Users up to PROTECTED'
)

$managedAutoPolicies = @(
    'Label incoming UNOFFICIAL email',
    'Label incoming OFFICIAL email',
    'Label incoming OFFICIAL: Sensitive email',
    'Label incoming OFFICIAL: Sensitive Personal Privacy email',
    'Label incoming OFFICIAL: Sensitive Legal Privilege email',
    'Label incoming OFFICIAL: Sensitive Legislative Secrecy email',
    'Label incoming PROTECTED email',
    'Label incoming PROTECTED Personal Privacy email',
    'Label incoming PROTECTED Legal Privilege email',
    'Label incoming PROTECTED Legislative Secrecy email',
    'Label incoming PROTECTED CABINET email',
    'Label incoming PROTECTED CABINET Personal Privacy email',
    'Label incoming PROTECTED CABINET Legal Privilege email',
    'Label incoming PROTECTED CABINET Legislative Secrecy email'
)

$managedRemovalOrder = @(
    'P C LS',
    'P C LP',
    'P C PP',
    'P C',
    'P C group',
    'P LS',
    'P LP',
    'P PP',
    'PROTECTED',
    'P group',
    'OS LS',
    'OS LP',
    'OS PP',
    'OFFICIAL Sensitive',
    'OS group',
    'OFFICIAL',
    'UNOFFICIAL'
)

function Connect-PurviewSession
{
    Import-Module ExchangeOnlineManagement -ErrorAction Stop
    Connect-IPPSSession `
        -AppId $ApplicationId `
        -CertificateThumbprint $CertificateThumbprint `
        -Organization $Organization `
        -ShowBanner:$false | Out-Null
}

function Invoke-ScriptShouldProcess
{
    param(
        [Parameter(Mandatory = $true)]
        [string]$Target,

        [Parameter(Mandatory = $true)]
        [string]$Action
    )

    if ($null -eq $script:InvocationCmdlet)
    {
        return $true
    }

    return $script:InvocationCmdlet.ShouldProcess($Target, $Action)
}

function Disconnect-PurviewSession
{
    Disconnect-ExchangeOnline -Confirm:$false -ErrorAction SilentlyContinue
}

function Get-CurrentLabels
{
    Get-Label -IncludeDetailedLabelActions
}

function Get-LabelByName
{
    param(
        [Parameter(Mandatory = $true)]
        [string]$Name,

        [Parameter(Mandatory = $true)]
        [object[]]$AllLabels
    )

    return $AllLabels | Where-Object { $_.Name -eq $Name } | Select-Object -First 1
}

function Get-SettingValue
{
    param(
        [Parameter(Mandatory = $true)]
        [object]$Label,

        [Parameter(Mandatory = $true)]
        [string]$Key
    )

    $setting = @($Label.Settings | Where-Object { $_.Key -eq $Key } | Select-Object -First 1)
    if ($setting.Count -eq 0)
    {
        return $null
    }

    if ($setting[0].Value -is [System.Array])
    {
        return $setting[0].Value[0]
    }

    return $setting[0].Value
}

function Test-IsPureModernLabelGroup
{
    param(
        [Parameter(Mandatory = $true)]
        [object]$Label
    )

    if ($null -eq $Label -or -not [string]::IsNullOrWhiteSpace($Label.ParentId))
    {
        return $false
    }

    $settingKeys = @(
        $Label.Settings |
            Where-Object { $null -ne $_ -and $null -ne $_.Key } |
            ForEach-Object { $_.Key.ToString().ToLowerInvariant() }
    )
    $allowedKeys = @('isparent', 'displayname', 'tooltip', 'color', 'labelschememigrationcategory')
    $unexpectedKeys = @($settingKeys | Where-Object { $_ -notin $allowedKeys })
    $isParent = Get-SettingValue -Label $Label -Key 'isparent'
    $hasLabelActions = ($null -ne $Label.LabelActions -and $Label.LabelActions.Count -gt 0)

    return ($isParent -eq 'True' -and -not $hasLabelActions -and $unexpectedKeys.Count -eq 0)
}

function Get-ChildLabels
{
    param(
        [Parameter(Mandatory = $true)]
        [object]$ParentLabel,

        [Parameter(Mandatory = $true)]
        [object[]]$AllLabels
    )

    $parentIds = @($ParentLabel.Name, $ParentLabel.ImmutableId) | Where-Object { -not [string]::IsNullOrWhiteSpace($_) }
    return @($AllLabels | Where-Object { $_.ParentId -in $parentIds })
}

function Remove-ManagedPolicies
{
    foreach ($policyName in $managedAutoPolicies)
    {
        $existingPolicy = Get-AutoSensitivityLabelPolicy | Where-Object { $_.Name -eq $policyName } | Select-Object -First 1
        if ($null -ne $existingPolicy -and (Invoke-ScriptShouldProcess -Target $policyName -Action 'Remove auto sensitivity label policy'))
        {
            Remove-AutoSensitivityLabelPolicy -Identity $policyName -Confirm:$false
        }
    }

    foreach ($policyName in $managedLabelPolicies)
    {
        $existingPolicy = Get-LabelPolicy | Where-Object { $_.Name -eq $policyName } | Select-Object -First 1
        if ($null -ne $existingPolicy -and (Invoke-ScriptShouldProcess -Target $policyName -Action 'Remove label policy'))
        {
            Remove-LabelPolicy -Identity $policyName -Confirm:$false
        }
    }
}

function Remove-ManagedLabels
{
    foreach ($labelName in $managedRemovalOrder)
    {
        try
        {
            $existing = Get-Label -Identity $labelName -IncludeDetailedLabelActions -ErrorAction Stop
        }
        catch
        {
            continue
        }

        if (Invoke-ScriptShouldProcess -Target $labelName -Action 'Remove managed label or label group')
        {
            Remove-Label -Identity $labelName -Confirm:$false
            Start-Sleep -Seconds 2
        }
    }
}

function Ensure-ModernLabelGroup
{
    param(
        [Parameter(Mandatory = $true)]
        [hashtable]$Definition
    )

    $allLabels = Get-CurrentLabels
    $existing = Get-LabelByName -Name $Definition.Name -AllLabels $allLabels

    if ($null -eq $existing)
    {
        if (Invoke-ScriptShouldProcess -Target $Definition.Name -Action 'Create modern label group')
        {
            New-Label `
                -Name $Definition.Name `
                -DisplayName $Definition.DisplayName `
                -Tooltip $Definition.Tooltip `
                -AdvancedSettings @{ color = $Definition.Color } `
                -IsLabelGroup | Out-Null
            Start-Sleep -Seconds 5
        }
        return
    }

    if (Test-IsPureModernLabelGroup -Label $existing)
    {
        return
    }

    $childLabels = Get-ChildLabels -ParentLabel $existing -AllLabels $allLabels
    if ($childLabels.Count -gt 0)
    {
        throw "Label '$($Definition.Name)' exists but is not a reusable modern label group and already has child labels. Re-run this script with -ResetManagedObjects to rebuild the managed label tree deterministically."
    }

    if (Invoke-ScriptShouldProcess -Target $Definition.Name -Action 'Replace broken legacy-like label with modern label group')
    {
        Remove-Label -Identity $Definition.Name -Confirm:$false
        Start-Sleep -Seconds 2
        New-Label `
            -Name $Definition.Name `
            -DisplayName $Definition.DisplayName `
            -Tooltip $Definition.Tooltip `
            -AdvancedSettings @{ color = $Definition.Color } `
            -IsLabelGroup | Out-Null
        Start-Sleep -Seconds 5
    }
}

function Show-ManagedState
{
    $allLabels = Get-CurrentLabels | Sort-Object Priority
    $managedNames = $managedLabels + ($managedGroups | ForEach-Object { $_.Name })

    $allLabels |
        Where-Object { $_.Name -in $managedNames } |
        Select-Object Name, DisplayName, ParentId, Priority |
        Format-Table -AutoSize
}

try
{
    Connect-PurviewSession

    if ($ResetManagedObjects)
    {
        Remove-ManagedPolicies
        Remove-ManagedLabels
    }

    foreach ($group in $managedGroups)
    {
        Ensure-ModernLabelGroup -Definition $group
    }

    Show-ManagedState
}
finally
{
    Disconnect-PurviewSession
}
