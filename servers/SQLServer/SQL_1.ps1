Function setName{
Write-Host 'Computernaam wijzigen'
#Change Name
Get-WmiObject win32_ComputerSystem
$ComputerName = Get-WmiObject win32_ComputerSystem
$name = "SQLServer"
$ComputerName.Rename($name)
}

Function setIP{
Write-Host 'IP addres geven'
#IP configuration
New-NetIPAddress -InterfaceAlias Ethernet -IPAddress 192.168.1.3 -DefaultGateway 192.168.1.1 -PrefixLength 24
Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses 192.168.1.1, 192.18.1.2
}

Function createDirectories{
    Set-TimeZone -Name "Central Europe Standard Time"
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

Function NET {
    echo "Downloading .NET..."
    cd C:/
    wget "https://download.microsoft.com/download/8/E/2/8E2BDDE7-F06E-44CC-A145-56C6B9BBE5DD/NDP471-KB4033344-Web.exe" -OutFile NDP471-KB4033344-Web.exe
    .\NDP471-KB4033344-Web.exe /q
    Install-WindowsFeature Net-Framework-Core -source C:\NDP471-KB4033344-Web.exe
}

Function JAVA {
    Write-Host 'Java installeren'
    cd C:/
    wget "http://javadl.oracle.com/webapps/download/AutoDL?BundleId=235725_2787e4a523244c269598db4e85c51e0c" -OutFile jre-8u191-windows-x64.exe
    Start-Process -FilePath ".\jre-8u191-windows-x64.exe" -ArgumentList '/s' -wait -PassThru
}

setName
setIP
createDirectories
#NuGet
ServerManager
NET
JAVA
Restart-Computer
