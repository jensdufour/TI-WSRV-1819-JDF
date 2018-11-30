Function NET {
    echo "Downloading .NET..."
    cd C:/
    wget "https://download.microsoft.com/download/8/E/2/8E2BDDE7-F06E-44CC-A145-56C6B9BBE5DD/NDP471-KB4033344-Web.exe" -OutFile NDP471-KB4033344-Web.exe
    .\NDP471-KB4033344-Web.exe /q
    Install-WindowsFeature Net-Framework-Core -source C:\NDP471-KB4033344-Web.exe
}
Function UCMA{
ECHO "Creating folder for UCMA"
cd C:/
new-item ucma -itemtype directory 
cd C:/ucma
Write-Host "Installing UCMA"
wget "https://download.microsoft.com/download/2/C/4/2C47A5C1-A1F3-4843-B9FE-84C0032C61EC/UcmaRuntimeSetup.exe" -OutFile ucma.exe
Start-Process ./ucma/ucma.exe -ArgumentList /quiet -Wait -PassThru
}
Function Check{
    cd C:/
    new-item visual -itemtype directory 
cd C:/visual
Write-Host "Installing Visual C"
wget "https://download.microsoft.com/download/2/E/6/2E61CFA4-993B-4DD4-91DA-3737CD5CD6E3/vcredist_x64.exe" -OutFile Visual.exe
.\visual\Visual.exe -q
}
Function Prereq{
Write-host "Installing prerequisites"
Install-WindowsFeature NET-Framework-45-Features, RPC-over-HTTP-proxy, RSAT-Clustering, RSAT-Clustering-CmdInterface, RSAT-Clustering-Mgmt, RSAT-Clustering-PowerShell, Web-Mgmt-Console, WAS-Process-Model, Web-Asp-Net45, Web-Basic-Auth, Web-Client-Auth, Web-Digest-Auth, Web-Dir-Browsing, Web-Dyn-Compression, Web-Http-Errors, Web-Http-Logging, Web-Http-Redirect, Web-Http-Tracing, Web-ISAPI-Ext, Web-ISAPI-Filter, Web-Lgcy-Mgmt-Console, Web-Metabase, Web-Mgmt-Console, Web-Mgmt-Service, Web-Net-Ext45, Web-Request-Monitor, Web-Server, Web-Stat-Compression, Web-Static-Content, Web-Windows-Auth, Web-WMI, Windows-Identity-Foundation
}
Prereq
NET
UCMA
Check
