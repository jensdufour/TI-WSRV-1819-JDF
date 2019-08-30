Function SQL{
    Write-Output "Downloading SQL..."
    Set-Location C:/
    Invoke-WebRequest "https://download.microsoft.com/download/5/E/9/5E9B18CC-8FD5-467E-B5BF-BADE39C51F73/
    SQLServer2017-SSEI-Expr.exe" -OutFile SQLServer2017-SSEI.exe
    Start-Process -FilePath ./SQLServer2017-SSEI.exe -ArgumentList "/action=download 
    /quiet /enu /MediaPath=C:/" -wait
    Remove-Item ./SQLServer2017-SSEI.exe
    Start-Process -FilePath C:/SQLEXPR_x64_ENU.exe -WorkingDirectory C:/ /q -wait
    Write-Host 'SQL Installeren'
    Start-Process -FilePath C:/SQLEXPR_x64_ENU/SETUP.EXE -ArgumentList "/Q /Action=install 
    /IAcceptSQLServerLicenseTerms /FEATURES=SQL,Tools /TCPENABLED=1 /SECURITYMODE=`"SQL`" 
    /SQLSYSADMINACCOUNTS=`"BUILTIN\Administrators`" /INSTANCENAME=`"SQL`" /INSTANCEID=`"SQL`" 
    /SAPWD=`"P@ssw0rd`"" -wait
    
    }
    
    Function SSMS{
    Write-Host 'SQL Managemnt Studio Installeren'
    Set-Location C:/
    Invoke-WebRequest "https://go.microsoft.com/fwlink/?linkid=858904" -OutFile SSMS-Setup-ENU.exe
    Start-Process -FilePath "C:\SSMS-Setup-ENU.exe" -ArgumentList '/s' -Wait -PassThru
    }
    
    SQL
    SSMS
    Restart-Computer