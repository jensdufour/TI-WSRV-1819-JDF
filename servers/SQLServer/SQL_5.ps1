
#Mount SQL ISO
Write-Host 'Disk mounten'
Mount-DiskImage 'C:\en_sql_server_2016_enterprise_x64_dvd_8701793.iso'
Write-Host 'SQL Installeren'
#EXE uitvoeren vanuit ISO
D:\setup.exe /configurationfile="E:\ConfigurationFile.ini"
