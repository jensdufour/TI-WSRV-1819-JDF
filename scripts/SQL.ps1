# -------------------------------------------------------------------------
# Change hostname before joining domain
# -------------------------------------------------------------------------
function changeHostname {
    $hostname = "SQL"
    Rename-Computer -ComputerName $env:COMPUTERNAME -newName $hostname -Force
    Restart-Computer
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
# Change SQL Server (Perform on Server Core)
# -------------------------------------------------------------------------
Function changeSQL {
    $sqlDownloadLink = "https://download.microsoft.com/download/5/E/9/5E9B18CC-8FD5-467E-B5BF-BADE39C51F73/SQLServer2017-SSEI-Expr.exe"
    Set-Location C:/
    Invoke-WebRequest $sqlDownloadLink -OutFile SQLServer.exe
    Start-Process -FilePath ./SQLServer.exe -ArgumentList "/action=download /quiet /enu /MediaPath=C:/" -wait
    Remove-Item ./SQLServer.exe
    Start-Process -FilePath C:/SQLEXPR_x64_ENU.exe -WorkingDirectory C:/ /q -wait
    Start-Process -FilePath C:/SQLEXPR_x64_ENU/SETUP.EXE -ArgumentList "/Q /Action=install /IAcceptSQLServerLicenseTerms /FEATURES=SQL,Tools /TCPENABLED=1 /SECURITYMODE=`"SQL`"    /SQLSYSADMINACCOUNTS=`"BUILTIN\Administrators`" /INSTANCENAME=`"SQL`" /INSTANCEID=`"SQL`" 
    /SAPWD=`"P@ssw0rd`"" -wait
}
# -------------------------------------------------------------------------
#Change SSMS installation (Best performed on jumpserver)
# -------------------------------------------------------------------------
Function changeSSMS {
    $SSMSDownloadLink = "https://go.microsoft.com/fwlink/?linkid=858904"
    Set-Location C:/
    Invoke-WebRequest $SSMSDownloadLink -OutFile SSMS.exe
    Start-Process -FilePath "C:\SSMS.exe" -ArgumentList '/s' -Wait -PassThru
}
changeHostname
joinDomain
changeSQL
changeSSMS