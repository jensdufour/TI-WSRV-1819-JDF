Write-Host 'SQL Managemnt Studio Installeren'
wget "https://go.microsoft.com/fwlink/?linkid=858904" -OutFile SSMS-Setup-ENU.exe
Start-Process -FilePath ".\SSMS-Setup-ENU.exe" -ArgumentList '/s' -Wait -PassThru
