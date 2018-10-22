#Requires -RunAsAdministrator

#SetIPAndFirewall
#Ip adres 
Write-host "Set IP and Firewall"

New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress "192.168.1.3" -PrefixLength 24 -DefaultGateway "192.168.1.1"
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses 192.168.1.1

#firewall
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

#Install prerequisites
Write-host "Installing prerequisites"
Install-WindowsFeature RSAT-Clustering-CmdInterface, NET-Framework-45-Features, RPC-over-HTTP-proxy, RSAT-Clustering, RSAT-Clustering-CmdInterface, RSAT-Clustering-Mgmt, RSAT-Clustering-PowerShell, Web-Mgmt-Console, WAS-Process-Model, Web-Asp-Net45, Web-Basic-Auth, Web-Client-Auth, Web-Digest-Auth, Web-Dir-Browsing, Web-Dyn-Compression, Web-Http-Errors, Web-Http-Logging, Web-Http-Redirect, Web-Http-Tracing, Web-ISAPI-Ext, Web-ISAPI-Filter, Web-Lgcy-Mgmt-Console, Web-Metabase, Web-Mgmt-Console, Web-Mgmt-Service, Web-Net-Ext45, Web-Request-Monitor, Web-Server, Web-Stat-Compression, Web-Static-Content, Web-Windows-Auth, Web-WMI, Windows-Identity-Foundation, RSAT-ADDS


#create UCMA folder

ECHO "Creating folder for UCMA"
if(!(Test-Path ucma))
{
new-item ucma -itemtype directory 
}else
{
ECHO "Already created"
}
ECHO "Place ucma.exe in C:\Users\Administrator\Documents\ucma. "

Write-Host "Press any key to continue"
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Write-Host

Write-Host "Installing UCMA"

.\ucma\ucma.exe -q

Write-Host "Press any key to restart"
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Write-Host

Restart-Computer