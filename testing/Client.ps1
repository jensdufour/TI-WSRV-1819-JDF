# Install-Module -Name Pester -SkipPublisherCheck -Force
$hostName = "WS-CLI"
$domainName = "AXXESTRAINEE.COM"
function testName {
    $actual = $env:COMPUTERNAME
    $actual | Should -Be  $hostName
}
function testDomain {
    $actual = Get-ADForest -Current LocalComputer.Name
    $actual | Should -Be  $domainName
}

function testNetworkConfiguration {
    $actual = Get-NetIPAddress -InterfaceAlias "Ethernet"
    $expected = "Dhcp"
    $actual | Should Be $expected
}