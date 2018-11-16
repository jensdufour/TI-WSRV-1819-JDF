#Declaring variables
$domainname = "jenduf.gent"

#IP-adres en default gateway wijzigen
New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress 192.168.1.2 -DefaultGateway 192.168.1.1 -PrefixLength 24
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses 192.168.1.1, 192.18.1.2

#Firewall uitschakelen
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

#JoinDomain
Write-Host 'Trying to join domain jenduf.gent'
$DomainName = "jenduf.gent"
$SafeModeAdministratorPassword = "Project2018" | ConvertTo-SecureString -AsPlainText -Force
$domain = "jensduf"
$joindomainuser = "Administrator"
$credential = New-Object System.Management.Automation.PSCredential($joindomainuser,$SafeModeAdministratorPassword)
Add-Computer -DomainName $DomainName -Credential $credential

#DC en DNS installeren en domeinnaam instellen
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools
Install-ADDSDomainController -DomainName $domainname -SafeModeAdministratorPassword:(ConvertTo-SecureString -String "Admin2018" -AsPlainText -Force) -Force

#Server opnieuw opstarten
Restart-computer
