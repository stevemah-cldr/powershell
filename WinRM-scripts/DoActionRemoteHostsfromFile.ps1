
# Reads from file ansademohosts.txt and performs Remote Command in loop

ForEach ($Computer in Get-Content .\ansademohosts.txt)
{
     Try
         {
            Write-Host "Running remote command on $Computer"
             Invoke-Command -ComputerName $Computer -ScriptBlock {Get-ChildItem "C:\Program Files"} -ErrorAction Stop
         }
     Catch
         {
             Write-Host "Failed to connect to $Computer"
             Add-Content Unavailable-Computers.txt $Computer
         }
}
