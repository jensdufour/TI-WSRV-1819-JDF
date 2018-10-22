Write-Host 'Computernaam wijzigen'
#Change Name
Get-WmiObject win32_ComputerSystem
$ComputerName = Get-WmiObject win32_ComputerSystem
$name = "SQLServer"
$ComputerName.Rename($name)

Write-Host 'IP addres geven'
#IP configuration
New-NetIPAddress -InterfaceAlias Ethernet -IPAddress 192.168.1.3 -DefaultGateway 192.168.1.1 -PrefixLength 24
Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses 192.168.1.1, 192.18.1.2