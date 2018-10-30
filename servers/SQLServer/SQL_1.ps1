#Activeer PS
Set-ExecutionPolicy Unrestricted
Function setName{
Write-Host 'Computernaam wijzigen'
#Change Name
Get-WmiObject win32_ComputerSystem
$ComputerName = Get-WmiObject win32_ComputerSystem
$name = "SQL"
$ComputerName.Rename($name)
}

Function setIP{
Write-Host 'IP addres geven'
#IP configuration
New-NetIPAddress -InterfaceAlias "Ethernet 2" -IPAddress 192.168.1.3 -DefaultGateway 192.168.1.1 -PrefixLength 24
Set-DnsClientServerAddress -InterfaceAlias "Ethernet 2" -ServerAddresses 192.168.1.1, 192.18.1.2
}

Function createDirectories{
    Write-Host 'Directories aanmaken'
    #Directories
    MD 'C:\Program Files\Microsoft SQL Server'
    MD 'C:\Program Files (x86)\Microsoft SQL Server'
    MD 'c:\Program Files (x86)\Microsoft SQL Server\DReplayClient\ResultDir'
    MD 'c:\Program Files (x86)\Microsoft SQL Server\DReplayClient\WorkingDir'
}

Function NuGet{
    Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
}

Function ServerManager {
    Import-Module ServerManager
}

setName
setIP
createDirectories
NuGet
ServerManager
Restart-Computer

