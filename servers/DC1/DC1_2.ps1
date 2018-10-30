#Declaring variables
$domainname = "jenduf.gent"

#IP-adres en default gateway wijzigen
New-NetIPAddress -InterfaceAlias "Ethernet 2" -IPAddress 192.168.1.1 -DefaultGateway 192.168.1.1 -PrefixLength 24
Set-DnsClientServerAddress -InterfaceAlias "Ethernet 2" -ServerAddresses 192.168.1.1, 192.18.1.2

#Firewall uitschakelen
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

#DC en DNS installeren en domeinnaam instellen
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
Install-ADDSForest -DomainName $domainname -SafeModeAdministratorPassword:(ConvertTo-SecureString -String "Project2018" -AsPlainText -Force) -Force

#Server opnieuw opstarten
Restart-computer
