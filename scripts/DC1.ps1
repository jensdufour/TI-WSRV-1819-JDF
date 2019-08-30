# -------------------------------------------------------------------------
# Change hostname
# -------------------------------------------------------------------------
function changeHostname {
    $hostname = "WS-CLI"
    Rename-Computer -ComputerName $env:COMPUTERNAME -newName $hostname -Force
    Restart-Computer
}
# -------------------------------------------------------------------------
# Change networksettings
# -------------------------------------------------------------------------
function changeNetworkSettings {
    $ip = "172.16.1.1"
    New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress $ip -PrefixLength 24 -DefaultGateway $ip
    Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses $ip, "8.8.8.8"   
}
# -------------------------------------------------------------------------
# Install Forest
# -------------------------------------------------------------------------
function changeDomain {
    $domainname = "AXXESTRAINEE.COM"
    $netbios = "AXXESTRAINEE"
    $password = "P@ssw0rd" | ConvertTo-SecureString -AsPlainText -Force
    Install-WindowsFeature AD-Domain-Services -IncludeManagementTools 
    Install-ADDSForest -DomainName $domainname -CreateDnsDelegation:$false -DatabasePath "C:\Windows\NTDS" -DomainMode "7" -DomainNetbiosName $netbios -ForestMode "7" -InstallDns:$true -LogPath "C:\Windows\NTDS" -NoRebootOnCompletion:$True -SysvolPath "C:\Windows\SYSVOL" -SafeModeAdministratorPassword:($password) -Force:$true 
    Restart-computer
}
# -------------------------------------------------------------------------
# Configure DNS
# -------------------------------------------------------------------------
function changeDNS {
    $Forwarder = "8.8.8.8"
    Add-DnsServerForwarder -IPAddress $Forwarder -PassThru
}
# -------------------------------------------------------------------------
# Configure DHCP
# -------------------------------------------------------------------------
function changeDHCP {
    $ip = "172.16.1.1"
    $startScope = "172.16.1.10"
    $endScope = "172.16.1.100"
    Install-WindowsFeature -Name 'DHCP' –IncludeManagementTools 
    Add-DhcpServerV4Scope -Name "DHCP Scope" -StartRange $startScope -EndRange $endScope -SubnetMask 255.255.255.0 
    Set-DhcpServerV4OptionValue -DnsServer $ip -Router $ip 
    Set-DhcpServerv4Scope -ScopeId $ip -LeaseDuration 1.00:00:00 
    Restart-service dhcpserver  
}
# -------------------------------------------------------------------------
# Configure RRAS
# -------------------------------------------------------------------------
function changeRRAS { 
    Install-WindowsFeature Routing -IncludeManagementTools
    Restart-Computer
    Install-RemoteAccess -VpnType Vpn
    $ExternalInterface = "Ethernet 2"
    $InternalInterface = "Ethernet"
    cmd.exe /c "netsh routing ip nat add interface $ExternalInterface"
    cmd.exe /c "netsh routing ip nat set interface $ExternalInterface mode=full"
    cmd.exe /c "netsh routing ip nat add interface $InternalInterface"
}
changeHostname
changeNetworkSettings
changeDomain
changeDNS
changeDHCP
changeRRAS