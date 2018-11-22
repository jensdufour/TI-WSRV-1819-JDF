#Requires -RunAsAdministrator
#Activeer PS
Set-ExecutionPolicy Unrestricted

#SetIPAndFirewall
Write-host "Set IP and Firewall"

New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress "192.168.1.3" -PrefixLength 24 -DefaultGateway "192.168.1.1"
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses "192.168.1.1"

#firewall
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

#JoinDomain
Write-Host 'Trying to join domain jenduf.gent'
$DomainName = "jenduf.gent"
$SafeModeAdministratorPassword = "Admin2018" | ConvertTo-SecureString -AsPlainText -Force
$domain = "jensduf"
$joindomainuser = "Administrator"
$credential = New-Object System.Management.Automation.PSCredential($joindomainuser,$SafeModeAdministratorPassword)
Add-Computer -DomainName $DomainName -Credential $credential