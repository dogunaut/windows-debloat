Stop-Service "AsusAppService"
Set-Service "AsusAppService" -StartupType Disabled

Stop-Service "ASUSLinkNear"
Set-Service "ASUSLinkNear" -StartupType Disabled

Stop-Service "ASUSLinkRemote"
Set-Service "ASUSLinkRemote" -StartupType Disabled

Stop-Service "ASUSOptimization"
Set-Service "ASUSOptimization" -StartupType Disabled

Stop-Service "ASUSSoftwareManager"
Set-Service "ASUSSoftwareManager" -StartupType Disabled

Stop-Service "ASUSSwitch"
Set-Service "ASUSSwitch" -StartupType Disabled

Stop-Service "ASUSSystemAnalysis"
Set-Service "ASUSSystemAnalysis" -StartupType Disabled

Stop-Service "ASUSSystemDiagnosis"
Set-Service "ASUSSystemDiagnosis" -StartupType Disabled


Stop-Service "DolbyDAXAPI"
Set-Service "DolbyDAXAPI" -StartupType Disabled

Stop-Service "FMAPOService"
Set-Service "FMAPOService" -StartupType Disabled

Stop-Service "RtkAudioUniversalService"
Set-Service "RtkAudioUniversalService" -StartupType Disabled


Stop-Service "AMD Crash Defender Service"
Set-Service "AMD Crash Defender Service" -StartupType Disabled



Get-ScheduledTask AMDInstallLauncher | Disable-ScheduledTask
Get-ScheduledTask ModifyLinkUpdate | Disable-ScheduledTask
Get-ScheduledTask StartCN | Disable-ScheduledTask


Get-ScheduledTask "ASUS Optimization 36D18D69AFC3" | Disable-ScheduledTask
Get-ScheduledTask "ASUS Update Checker 2.0" | Disable-ScheduledTask
Get-ScheduledTask RtkAudUService64_BG | Disable-ScheduledTask



Disable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName "ASUS System Control Interface v3").InstanceId -Confirm:$false

Disable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName "DolbyAPO Software Device (HSA)").InstanceId -Confirm:$false
Disable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName "DolbyAPO SWC Device").InstanceId -Confirm:$false
Disable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName "Fortemedia Audio Effects Component").InstanceId -Confirm:$false
Disable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName "Fortemedia SAMSoft Effects Component").InstanceId -Confirm:$false
Disable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName "Realtek Asio Component").InstanceId -Confirm:$false
Disable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName "Realtek Audio Effects Component").InstanceId -Confirm:$false
Disable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName "Realtek Audio Effects Component (INT)").InstanceId -Confirm:$false
Disable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName "Realtek Audio Universal Service").InstanceId -Confirm:$false
Disable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName "Realtek Hardware Support Application").InstanceId -Confirm:$false
Disable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName "Realtek OVWrap2 Component").InstanceId -Confirm:$false

Disable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName "AMD-Dynamic Audio Noise Supression").InstanceId -Confirm:$false
Disable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName "AMD-UWP Version Control").InstanceId -Confirm:$false
Disable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName "Windows Camera Effects").InstanceId -Confirm:$false
Disable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName "Windows Studio Effects Driver").InstanceId -Confirm:$false

Disable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName "Cirrus Logic Awesome Speaker Amps").InstanceId -Confirm:$false
Disable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName "AMD BT Audio Device").InstanceId -Confirm:$false
Disable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName "AMD High Definition Audio Device").InstanceId -Confirm:$false
Disable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName "NVIDIA High Definition Audio").InstanceId -Confirm:$false

Disable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName "AMD Crash Defender").InstanceId -Confirm:$false
