# Install-Module -Name Pester -SkipPublisherCheck -Force
$hostName = "WS-CLI"
$domainName = "AXXESTRAINEE.COM"
function testName {
    $actual = $env:COMPUTERNAME
    $actual | Should -Be $hostName
}
function testDomain {
    $actual = Get-ADForest -Current LocalComputer.Name
    $actual | Should -Be $domainName
}
function testDomainController {
    $actual = Get-ADDomainController -Identity $hostName
    $actual | Should -Not -Be $Error
}
function testDHCP {
    $actual = Get-DhcpServerVersion -ComputerName $hostName
    $actual | Should -Not -Be $Error
}
function testDNS {
    $actual = Get-DnsServerZone -ComputerName $hostName
    $actual | Should -Not -Be $Error
}
function testNetworkConfiguration {
    $actual = Get-NetIPAddress -InterfaceAlias "Ethernet"
    $expected = "172.16.1.1"
    $actual | Should Be $expected
}