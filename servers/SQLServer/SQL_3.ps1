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
    wget "http://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jre-8u191-windows-x64.exe" -OutFile jre-8u191-windows-x64.exe
    Start-Process -FilePath ".\jre-8u191-windows-x64.exe" -ArgumentList '/s' -wait -PassThru
}
NuGet
ServerManager
NET
JAVA
