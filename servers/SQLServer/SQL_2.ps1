Function Firewall{
    Write-Host 'Firewall Config'
    Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
    Write-Host 'Firewall Rule Port 1433'
    New-NetFirewallRule -DisplayName "MSSQL ENGINE TCP" -Direction Inbound -LocalPort 1433 -Protocol TCP -Action Allow
}

Function JoinDomain{
    Write-Host 'Trying to join domain jenduf.gent'
    $DomainName = "jenduf.gent"
    $SafeModeAdministratorPassword = "Admin2018" | ConvertTo-SecureString -AsPlainText -Force
    $domain = "jensduf"
    $joindomainuser = "Administrator"
    $credential = New-Object System.Management.Automation.PSCredential($joindomainuser,$SafeModeAdministratorPassword)
    Add-Computer -DomainName $DomainName -Credential $credential
}

JoinDomain
Firewall
Restart-Computer
