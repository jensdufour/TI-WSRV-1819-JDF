Write-host "Installing prerequisites"

Add-PSSnapin microsoft-exhcange.management.powershell.snapin
Add-PSSnapin microsoft-exhcange.management.powershell.setup
Add-PSSnapin microsoft-exhcange.management.powershell.support

Write-host "Every user gets a mailbox"
Get-User | Where-Object {$_.RecipientType -eq "User"} | ForEach-Object {Enable-Mailbox -Identity $_.Name}

Write-host "Setting some configurations"
New-SendConnector -Name "MBG Send Connector" -Usage Internet -AddressSpaces * -DNSRoutingEnabled $true 
Set-WebServicesVirtualDirectory -Identity "EWS (Default Web Site)" -ExternalUrl https://mail.jenduf.gent/EWS/exchange.asmx
Set-owavirtualdirectory –Identity "owa (Default Web Site)" –ExternalUrl https://mail.jenduf.gent/owa
Set-ecpvirtualdirectory –Identity "ecp (Default Web Site)" –ExternalUrl https://mail.jenduf.gent/ecp
Set-ActiveSyncVirtualDirectory -Identity "Microsoft-Server-ActiveSync (Default Web Site)" -ExternalUrl https://mail.jenduf.gent/Microsoft-Server-ActiveSync 
Set-oabvirtualdirectory –Identity "OAB (Default Web Site)" –ExternalUrl https://mail.jenduf.gent/oab
Set-OutlookAnywhere -Identity "mail\rpc (Default Web Site)" -InternalHostname mail.jenduf.gent -ExternalHostname mail.jenduf.gent -ExternalClientsRequireSsl $true -DefaultAuthenticationMethod negotiate -InternalClientsRequireSsl $true
Set-ClientAccessServer -Identity mail -AutoDiscoverServiceInternalUri https://autodiscover.jenduf.gent/Autodiscover/Autodiscover.xml

Write-host "Creating mailbox folders"
New-Mailbox -PublicFolder -Name PublicJENDUF
Write-host "Exhange is ready to use!"