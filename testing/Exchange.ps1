# Install-Module -Name Pester -SkipPublisherCheck -Force
function testName {
    $expected = "Exchange"
    $actual = $env:COMPUTERNAME
    $actual | Should -Be  $expected
}
function testDomain {
    $expected = "AXXESTRAINEE.COM"
    $actual = Get-ADForest -Current LocalComputer.Name
    $actual | Should -Be  $expected
}
testName
testDomain