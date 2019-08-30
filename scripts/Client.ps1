# -------------------------------------------------------------------------
# Change hostname
# -------------------------------------------------------------------------
function changeHostname {
    $hostname = "W10"
    Rename-Computer -ComputerName $env:COMPUTERNAME -newName $hostname -Force
    Restart-Computer
}
# -------------------------------------------------------------------------
# Join the exisiting domain
# -------------------------------------------------------------------------
function joinDomain {
    $domainname = "AXXESTRAINEE.COM"
    $username = "$domainname\Administrator"
    $password = "P@ssw0rd" | ConvertTo-SecureString -AsPlainText -Force
    $credential = New-Object System.Management.Automation.PSCredential($username, $password)
    $ip = "172.16.1.9"
    $gw = "172.16.1.1"
    $dns = "172.16.1.2"
    New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress $ip -PrefixLength 24 -DefaultGateway $gw
    Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses $gw, $dns
    Add-Computer -DomainName $domainname -Credential $credential
    #Get-NetIPAddress -InterfaceAlias 'Ethernet' | Remove-NetRoute
    #Get-NetIPAddress -InterfaceAlias 'Ethernet' | Remove-NetIpAddress
    #Set-NetIPInterface -InterfaceAlias 'Ethernet' -Dhcp Enabled
    Restart-computer
}