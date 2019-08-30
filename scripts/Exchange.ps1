# -------------------------------------------------------------------------
# Change hostname
# -------------------------------------------------------------------------
function changeHostname {
    $hostname = "Exchange"
    Rename-Computer -ComputerName $env:COMPUTERNAME -newName $hostname -Force
    Restart-Computer
}
# -------------------------------------------------------------------------
# Change networksettings
# -------------------------------------------------------------------------
function changeNetworkSettings {
    $ip = "172.16.1.3" 
    $dns = "172.16.1.2"
    $gw = "172.16.1.1"
    New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress $ip -PrefixLength 24 -DefaultGateway $gw
    Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses $gw, $dns
}
# -------------------------------------------------------------------------
# Join existing Domain
# -------------------------------------------------------------------------
function joinDomain {
    $domainname = "AXXESTRAINEE.COM"
    $username = "$domainname\Administrator"
    $password = "P@ssw0rd" | ConvertTo-SecureString -AsPlainText -Force
    $credential = New-Object System.Management.Automation.PSCredential($username, $password)
    Add-Computer -DomainName $domainname -Credential $credential
    Restart-computer
}
# -------------------------------------------------------------------------
# Installing prerequisites for Exchange Server
# -------------------------------------------------------------------------
function changePrerquisites {
    $chromeMSIDownloadLink
    $UCMADownloadLink
    $DOTNETDownloadLink
    $VCRedistDownloadLink
    Set-Location C:/
    Invoke-WebRequest $chromeMSIDownloadLink -OutFile chromeMSI.msi
    Invoke-WebRequest $UCMADownloadLink -OutFile UCMA.exe
    Invoke-WebRequest $DOTNETDownloadLink -OutFile DOTNET.exe
    Invoke-WebRequest $VCRedistDownloadLink -OutFile VCRedist.exe
    .\chromeMSI.msi /q
    .\UCMA.exe -q
    .\DOTNET.exe /passive /norestart
    .\VCRedist.exe /passive /norestart
    Start-Sleep -s 30
    Restart-Computer
}
# -------------------------------------------------------------------------
# Installing Exchange Server
# -------------------------------------------------------------------------
function changeExchange { 
    $exchangeISO
    Install-WindowsFeature RSAT-ADDS
    Set-Location $exchangeISO
    .\Setup.exe /PrepareSchema /IAcceptExchangeServerLicenseTerms 
    .\Setup.exe /PrepareAD /OrganizationName:"RED" /IAcceptExchangeServerLicenseTerms
    #Install prerequisites
    Install-WindowsFeature NET-Framework-45-Features, RPC-over-HTTP-proxy, RSAT-Clustering, RSAT-Clustering-CmdInterface, RSAT-Clustering-Mgmt, RSAT-ADDS, RSAT-Clustering-PowerShell, Web-Mgmt-Console, WAS-Process-Model, Web-Asp-Net45, Web-Basic-Auth, Web-Client-Auth, Web-Digest-Auth, Web-Dir-Browsing, Web-Dyn-Compression, Web-Http-Errors, Web-Http-Logging, Web-Http-Redirect, Web-Http-Tracing, Web-ISAPI-Ext, Web-ISAPI-Filter, Web-Lgcy-Mgmt-Console, Web-Metabase, Web-Mgmt-Console, Web-Mgmt-Service, Web-Net-Ext45, Web-Request-Monitor, Web-Server, Web-Stat-Compression, Web-Static-Content, Web-Windows-Auth, Web-WMI, Windows-Identity-Foundation
    .\Setup.exe /M:Install /R:Mailbox, ManagementTools /IAcceptExchangeServerLicenseTerms
}