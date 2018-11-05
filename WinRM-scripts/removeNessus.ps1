
#Remove Nessus

Write-Host "Unistalling Tenable Nessus"
$app = Get-WmiObject -Class Win32_product -Filter "Name = 'Nessus Agent'"
$app.Uninstall()
