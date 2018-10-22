echo "Downloading SQL..."
wget "https://go.microsoft.com/fwlink/?linkid=853016" -OutFile SQLServer2017-SSEI-Dev.exe
Write-Host 'SQL Installeren'
.\SQLServer2017-SSEI-Dev.exe /Q  /Action=install /INSTANCENAME="SQLServer"  /INSTANCEID="SQLServer"  /IAcceptSQLServerLicenseTerms  /FEATURES=SQL,Tools  /TCPENABLED=1  /SECURITYMODE="SQL" /SAPWD="@Project2018"
