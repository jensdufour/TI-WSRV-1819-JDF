#Requires -RunAsAdministrator

#Check if exchange folder exist
if(Test-Path exchange)
{
$directoryInfo = Get-ChildItem exchange | Measure-Object
if($directoryInfo.count -eq 0)
{
	Remove-Item exchange 
}
}

#Creating exchange folder
ECHO "Creating folder for exchange"
if(!(Test-Path exchange))
{
new-item exchange -itemtype directory 
}else
{
ECHO "Already created"
}
ECHO "Place exchange.exe in C:\Users\Administrator\Documents\exchange"

Write-Host "Press any key to install Exchange"
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Write-Host

Write-Host "Installing Exchange"
.\exchange\exchange.exe /IAcceptExchangeServerLicenseTerms /PrepareAD /OrganizationName:"jenduf.gent" /Roles:Mailbox
