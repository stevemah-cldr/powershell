
# Reads from file ansademohosts.txt and performs Remote Command in loop

$source = "C:\WinRM-scripts\nessus\nessusinstall\"
$destination = "c:\windows\nessusinstall\"
#$testPath = "c:\nessusinstall\NessusAgent-7.1.1-x64.msi"

$epodevcred = Get-Credential -UserName ansa\epodev -Message "Provide the password for epodev"

ForEach ($Computer in Get-Content .\testhost.txt)
{	
	write-host "Processing $Computer"
	if (test-Connection -Cn $computer -quiet) {
		#Copy-Item $source -Destination \\$computer\$dest -Recurse -Force
		$Session = New-PSSession -ComputerName "$computer" -Credential $epodevcred
		Copy-Item "$source" -Destination "$destination" -ToSession $Session -Recurse
		Invoke-Command -ComputerName $computer -ScriptBlock {powershell.exe -executionpolicy Bypass -file c:\windows\nessusinstall\InstallNessus.ps1}
		Write-Host -ForegroundColor Green "Installation successful on $computer"

	} else {
			Write-Host -ForegroundColor Red "$computer is not online, Install failed"
	
				}
 }
