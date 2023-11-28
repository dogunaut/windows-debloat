Disable-PnpDevice -InstanceId (Get-PnpDevice -FriendlyName "AMD Radeon 780M Graphics").InstanceId -Confirm:$false

Stop-Service "AMD External Events Utility"
Set-Service "AMD External Events Utility" -StartupType Disabled
