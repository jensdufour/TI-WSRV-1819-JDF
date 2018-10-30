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
cd C:\Users\Administrator\Documents\exchange
wget "https://download.microsoft.com/download/3/9/B/39B8DDA8-509C-4B9E-BCE9-4CD8CDC9A7DA/Exchange2016-x64.exe" -OutFile exchange.exe

Write-Host "Press any key to install Exchange"
$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
Write-Host

Write-Host "Installing Exchange"
.\exchange\exchange.exe /IAcceptExchangeServerLicenseTerms /PrepareAD /OrganizationName:"jenduf.gent" /Roles:Mailbox
