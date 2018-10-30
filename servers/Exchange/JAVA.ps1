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
    wget "http://javadl.oracle.com/webapps/download/AutoDL?BundleId=235725_2787e4a523244c269598db4e85c51e0c" -OutFile jre-8u191-windows-x64.exe
    Start-Process -FilePath ".\jre-8u191-windows-x64.exe" -ArgumentList '/s' -wait -PassThru
}
NET
JAVA