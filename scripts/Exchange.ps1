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
    $chromeEnterpriseDownloadLink = https://dl.google.com/tag/s/appguid%3D%7B8A69D345-D564-463C-AFF1-A69D9E530F96%7D%26iid%3D%7BAB3972F4-91EE-53EB-4009-AFA933E367B2%7D%26lang%3Den%26browser%3D4%26usagestats%3D1%26appname%3DGoogle%2520Chrome%26needsadmin%3Dtrue%26ap%3Dx64-stable-statsdef_0%26brand%3DGCEB/dl/chrome/install/GoogleChromeEnterpriseBundle64.zip
    $UCMADownloadLink = https://download.microsoft.com/download/3/9/B/39B042C0-8ACB-4D1A-BE02-4E20247A36E6/UcmaSdkSetup.exe
    $DOTNETDownloadLink = https://download.visualstudio.microsoft.com/download/pr/c76aa823-bbc7-4b21-9e29-ab24ceb14b2d/9de2e14be600ef7d5067c09ab8af5063/dotnet-sdk-2.2.401-win-x64.exe
    $VCRedistDownloadLink = https://aka.ms/vs/16/release/vc_redist.x64.exe
    Set-Location C:/
    Invoke-WebRequest $chromeEnterpriseDownloadLink -OutFile GoogleChromeEnterpriseBundle.zip
    Expand-Archive GoogleChromeEnterpriseBundle.zip
    Invoke-WebRequest $UCMADownloadLink -OutFile UCMA.exe
    Invoke-WebRequest $DOTNETDownloadLink -OutFile DOTNET.exe
    Invoke-WebRequest $VCRedistDownloadLink -OutFile VCRedist.exe
    .\GoogleChromeEnterpriseBundle64.zip\Installers\GoogleChromeStandaloneEnterprise64.msi /q
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
    $domainName = "AXXESTRAINEE"
    #Add the downloadlink for the Exchange Server iso here!
    $exchangeDownloadLink
    Set-Location C:/
    Invoke-WebRequest $exchangeDownloadLink -OutFile Exchange.iso
    Mount-DiskImage -ImagePath .\Exchange.iso
    $exchangeISO = (Get-DiskImage ".\Exchange.iso" | Get-Volume).DriveLetter
    Install-WindowsFeature RSAT-ADDS
    Set-Location $exchangeISO
    .\Setup.exe /PrepareSchema /IAcceptExchangeServerLicenseTerms 
    .\Setup.exe /PrepareAD /OrganizationName:$domainName /IAcceptExchangeServerLicenseTerms
    #Install prerequisites
    Install-WindowsFeature NET-Framework-45-Features, RPC-over-HTTP-proxy, RSAT-Clustering, RSAT-Clustering-CmdInterface, RSAT-Clustering-Mgmt, RSAT-ADDS, RSAT-Clustering-PowerShell, Web-Mgmt-Console, WAS-Process-Model, Web-Asp-Net45, Web-Basic-Auth, Web-Client-Auth, Web-Digest-Auth, Web-Dir-Browsing, Web-Dyn-Compression, Web-Http-Errors, Web-Http-Logging, Web-Http-Redirect, Web-Http-Tracing, Web-ISAPI-Ext, Web-ISAPI-Filter, Web-Lgcy-Mgmt-Console, Web-Metabase, Web-Mgmt-Console, Web-Mgmt-Service, Web-Net-Ext45, Web-Request-Monitor, Web-Server, Web-Stat-Compression, Web-Static-Content, Web-Windows-Auth, Web-WMI, Windows-Identity-Foundation
    .\Setup.exe /M:Install /R:Mailbox, ManagementTools /IAcceptExchangeServerLicenseTerms
}