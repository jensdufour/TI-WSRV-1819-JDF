# Install-Module -Name Pester -SkipPublisherCheck -Force
function testName {
    $expected = "SCCM"
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