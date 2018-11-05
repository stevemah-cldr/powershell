
# Reads from file ansademohosts.txt and performs Remote Command in loop

$source = "C:\WinRM-scripts\nessus\nessusremove\"
$destination = "c:\windows\nessusremove\"

$epodevcred = Get-Credential -UserName ansa\epodev -Message "Provide the password for epodev"

ForEach ($Computer in Get-Content .\testhost.txt)
{	
	write-host "Processing $Computer"
	if (test-Connection -Cn $computer -quiet) {
		#clean up old install files:
		$Session = New-PSSession -ComputerName "$computer" -Credential $epodevcred
		Invoke-Command -ComputerName $computer -Credential $epodevcred -ScriptBlock {Remove-Item -Recurse "c:\windows\nessusinstall"}
		Copy-Item "$source" -Destination "$destination" -ToSession $Session -Recurse
		Invoke-Command -ComputerName $computer -ScriptBlock {powershell.exe -executionpolicy Bypass -file c:\windows\nessusremove\removeNessus.ps1}
		Write-Host -ForegroundColor Green "removal of Tenable successful on $computer"

	} else {
			Write-Host -ForegroundColor Red "$computer is not online, UnInstall failed"
	
				}
 }
