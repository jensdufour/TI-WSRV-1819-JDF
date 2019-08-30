# Windows Server 2018-2019

> Make this in Hyper-V.
> Use Windows Server Core wherever possible.


## Situation

    01. DC1
        i. NAT Interface
        ii. Internal Switch DC1
            01. IP: 192.168.1.1
            02. SN: 255.255.255.0
            03. GW: 192.168.1.1
    02. DC2
        i. Internal Switch DC2
                01. IP: 192.18.1.2
                02. SN: 255.255.255.0
                03. DG: 192.168.1.1
    03. SQL server
        i. Internal Switch
            01. IP: 192.168.1.3
            02. SN: 255.255.255.0
            03. DG: 192.168.1.1
    04. Exchange server
        i. Internal Switch
            01. IP: 192.168.1.3
            02. SN: 255.255.255.0
            03. DG: 192.168.1.1
    05. Deployment server
            i. Internal Switch
                01. IP: 192.168.1.4
                02. SN: 255.255.255.0
                03. DG: 192.168.1.1
    06. Windows Cliënt
            i. Internal Switch
                01. IP: DHCP
                02. SN: DHCP
                03. DG: 192.168.1.1
    06. Bijkomende specificaties
        a. Naamgeving domein: eerste 3 letters van uw voornaam plus de eerste 3 letters van de achternaam en als extensie de campus
        b. Naamgeving servers
            i. Configureer de naam zo dat de functie van de server kan gehaald worden uit uw naamgeving
        c. Configureer op uw DC 1 de routerfaciliteiten zodat uw intern netwerk via de DC1 op het internet kan
    07. Opdracht specifiek servers
        a. Exchange server
            i. Moet zo geconfigureerd worden dat het mogelijk is om en mail te sturen naar dirk.thijs@pcprof.be.
            ii. Dit lukt enkel buiten de school.
        b. Deployment server:
            i. Moet mogelijk zijn om een Windows Cliënt te installeren via een image
            ii. Moet mogelijk zijn om Adobe reader te deployen op een Windows toestel
            iii. Beheers uw updates via de deployment omgeving
    08. Software
        a. Te downloaden via imagine. Email adressen worden doorgegeven aan bert zodat de accounts kunnen aangemaakt worden.
    09. Documentatie
        a. Daar waar mogelijk zal alles op chamilo geplaatst worden. Andere info kan je vinden op internet.
    10. Evaluatie
        a. Documenteer uw verschillende installatie stappen en manier waarop je bepaalde problemen hebt opgelost.
        b. Op het einde van de module is er een evaluatie moment waarop u komt verdedigen waarom u een bepaalde manier hebt gevolgd, of waarom iets niet gewerkt heeft.
