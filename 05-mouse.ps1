Write-Host "Setting mouse wheel direction..."

$devices = Get-PnpDevice -Class Mouse -PresentOnly -Status OK
$devices | ForEach-Object {
	Write-Host "$($_.Name): $($_.DeviceID)"
	Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Enum\$($_.DeviceID)\Device Parameters" -Name "FlipFlopWheel" -Value 1
}

Write-Host "Done!"
