Write-Host '.NET Installeren'
Install-Module servermanager
install-WindowsFeature Net-Framework-Core -source F:\sources\sxs
Write-Host 'Java installeren'
Start-Process -FilePath "C:\JreJava.exe" -ArgumentList '/s' -wait -PassThru
