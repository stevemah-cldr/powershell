# install chocolatey package manager
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# install older versions of 3rd party software

# https://chocolatey.org/packages/adobereader/2015.007.20033.01 - 3/15/2017
choco install adobereader --version 2015.007.20033.01 -y

# https://chocolatey.org/packages/Firefox/58.0 - 1/23/2018
choco install firefox --version 58.0 -y

# https://chocolatey.org/packages/flashplayerppapi/28.0.0.137 - 1/9/2018
#choco install flashplayerppapi --version 28.0.0.137 -y
# https://chocolatey.org/packages/flashplayerppapi/28.0.0.161 - 2/6/2018
#choco install flashplayerppapi --version 28.0.0.161 -y
choco install flashplayerppapi -y

# https://chocolatey.org/packages/flashplayeractivex/28.0.0.137 - 1/9/2018
choco install flashplayeractivex --version 28.0.0.137 -y

# https://chocolatey.org/packages/javaruntime/7.0.75 - 1/27/2015
#choco install javaruntime --version 7.0.75 -y

# https://chocolatey.org/packages/javaruntime/8.0.144 - 8/11/2017
choco install javaruntime --version 8.0.144 -y

# https://chocolatey.org/packages/GoogleChrome/64.0.3282.16800 - 2/14/2018
# choco install googlechrome --version 64.0.3282.16800 -y
# https://chocolatey.org/packages/GoogleChrome/66.0.3359.13900 - 4/24/2018
#choco install googlechrome --version 66.0.3359.13900 -y
#choco install googlechrome --version 65.0.3325.18100 -y
choco install googlechrome -y
