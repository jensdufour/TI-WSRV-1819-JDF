Workflow DC_Setup {
    $hostname = "WS-GUI"
    $domainname = "AXXESTRAINEE.COM"
    $ip = "172.16.1.2"
    $gw = "172.16.1.1"
    $password = ConvertTo-SecureString -String "P@ssw0rd" -AsPlainText -Force
    # Change hostname
    Rename-Computer -PSComputerName $env:COMPUTERNAME -newName $hostname -Force
    Restart-Computer -Wait
    # Change networksettings
    New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress $ip -PrefixLength 24 -DefaultGateway $gw
    Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses $gw, $ip
    # Join existing Domain
    $username = "$domainname\Administrator"
    $credential = New-Object System.Management.Automation.PSCredential($username, $password)
    Add-Computer -DomainName $domain -Credential $credential
    # Install Forest
    InlineScript { Install-WindowsFeature AD-Domain-Services -IncludeManagementTools }
    InlineScript { Install-ADDSForest -DomainName $domainname -SafeModeAdministratorPassword:($password) -Force }
    Unregister-ScheduledJob -Name ResumeScript
    Restart-computer
}
# -------------------------------------------------------------------------
# Resume at Startup-Trigger
# -------------------------------------------------------------------------
$adm = "Administrator"
$pwd = ConvertTo-SecureString -String "P@ssw0rd" -AsPlainText -Force
$cred = New-Object System.Management.Automation.PSCredential($adm, $pwd)
$AtStartup = New-JobTrigger -AtStartup
Register-ScheduledJob -Name ResumeScript `
    -Credential $cred `
    -Trigger $AtStartup `
    -ScriptBlock { Import-Module PSWorkflow; `
        Get-Job -Name NewSrvSetup -State Suspended `
    | Resume-Job }
DC_Setup -JobName NewSrvSetup