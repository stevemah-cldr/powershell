
#install Nessus

Write-Host "Installing Tenable Nessus"
# See if it's 32bit or 64bit
if ((gwmi win32_operatingsystem | select osarchitecture).osarchitecture -eq "64-bit")
    {
      #64 bit logic here
      Write "64-bit OS"
      copy-item -Path \\ansa-dc1\file-share\nessus\NessusAgent-7.1.1-x64.msi -Destination $env:temp\NessusAgent-7.1.1-x64.msi
      msiexec /i $env:temp\NessusAgent-7.1.1-x64.msi NESSUS_GROUPS="ansademo510" NESSUS_SERVER="cloud.tenable.com:443" NESSUS_KEY=eff2cf201092db21b7640bd0c520f8f3904af1abed1de80a09bcfab911ac3f22 /qn
    }
else
    {
      #32 bit logic here
      Write "32-bit OS"
      copy-item -Path \\ansa-dc1\file-share\nessus\NessusAgent-7.1.1-Win32.msi -Destination $env:temp\NessusAgent-7.1.1-x64.msi
      msiexec /i $env:temp\NessusAgent-7.1.1-Win32.msi NESSUS_GROUPS="ansademo510" NESSUS_SERVER="cloud.tenable.com:443" NESSUS_KEY=eff2cf201092db21b7640bd0c520f8f3904af1abed1de80a09bcfab911ac3f22 /qn
    }
