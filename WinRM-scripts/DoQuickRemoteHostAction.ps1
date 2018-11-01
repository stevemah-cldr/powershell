$RemoteComputers = @("WIN10-EP011","WIN10-EP014","WIN2008-EP005","WIN2012-EP005","WIN2016-EP003","WIN732-EP015","WIN81-EP006")

ForEach ($Computer in $RemoteComputers)
{
     Try
         {
             Invoke-Command -ComputerName $Computer -ScriptBlock {Get-ChildItem "C:\Program Files"} -ErrorAction Stop
         }
     Catch
         {
             Add-Content Unavailable-Computers.txt $Computer
         }
}
