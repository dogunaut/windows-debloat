Write-Host "Disabling tasks..."

Get-ScheduledTask XblGameSaveTask | Disable-ScheduledTask
Get-ScheduledTask Consolidator | Disable-ScheduledTask
Get-ScheduledTask UsbCeip | Disable-ScheduledTask
Get-ScheduledTask DmClient | Disable-ScheduledTask
Get-ScheduledTask DmClientOnScenarioDownload | Disable-ScheduledTask



Write-Host "`r`n"
Write-Host "Disabling services..."


# Server
Stop-Service "LanmanServer"
Set-Service "LanmanServer" -StartupType Disabled

# Workstation
Stop-Service "LanmanWorkstation"
Set-Service "LanmanWorkstation" -StartupType Disabled

# Superfetch
Disable-MMAgent -ApplicationLaunchPrefetching
Disable-MMAgent -ApplicationPreLaunch
Disable-MMAgent -MemoryCompression

Stop-Service "SysMain"
Set-Service "SysMain" -StartupType Disabled


# Network Connected Devices Auto-Setup
Stop-Service "NcdAutoSetup"
Set-Service "NcdAutoSetup" -StartupType Disabled

# Downloaded Maps Manager
Stop-Service "MapsBroker"
Set-Service "MapsBroker" -StartupType Disabled


# Connected User Experiences and Telemetry
Stop-Service "DiagTrack"
Set-Service "DiagTrack" -StartupType Disabled

# Device Management Wireless Application Protocol
Stop-Service "dmwappushservice"
Set-Service "dmwappushservice" -StartupType Disabled

# TCP/IP NetBIOS Helper
Stop-Service "lmhosts"
Set-Service "lmhosts" -StartupType Disabled



Write-Host "`r`n"
Write-Host "Disabling network adapter netbios..."

# disable netbios for all adapters
$i = 'HKLM:\SYSTEM\CurrentControlSet\Services\NetBt\Parameters\Interfaces'
Get-ChildItem $i | ForEach-Object {
	Write-Host $_.PSChildName
	Set-ItemProperty -Path "$i\$($_.PSChildName)" -Name NetbiosOptions -Value 2
}



Write-Host "`r`n"
Write-Host "Disabling network adapter bloat..."

# disable all adapter services except ipv4 and ipv6
$binds = (Get-NetAdapterBinding)
foreach ($bind in $binds) {
	if ($bind.DisplayName -notlike "*TCP/IPv*") {
		Write-Host $bind.Name " - " $bind.DisplayName
		Disable-NetAdapterBinding -Name $bind.Name -ComponentID $bind.ComponentID
	}
}



Write-Host "`r`n"
Write-Host "Unhiding power plan options..."

# USB 3 Link Power Management
powercfg -attributes 2a737441-1930-4402-8d77-b2bebba308a3 d4e98f31-5ffe-4ce1-be31-1b38b384c009 -ATTRIB_HIDE

# Interrupt steering
powercfg -attributes 48672f38-7a9a-4bb2-8bf8-3d85be19de4e 2bfc24f9-5ea2-4801-8213-3dbae01aa39d -ATTRIB_HIDE


Write-Host "`r`n"
Write-Host "Fixing system clock..."

bcdedit /set useplatformclock false
bcdedit /set disabledynamictick yes


Write-Host "`r`n"
Write-Host "Disabling legacy USB enumerator..."

Disable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName "Microsoft Device Association Root Enumerator").InstanceId -Confirm:$false



Write-Host "`r`n"
Write-Host "Done!"
