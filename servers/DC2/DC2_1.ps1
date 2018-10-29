#Activeer PS
Set-ExecutionPolicy Unrestricted
#Declaring variables
$hostname = "ns2"

#Computer naam wijzigen
Rename-Computer -ComputerName $env:COMPUTERNAME  -newName $hostname -Force -Restart