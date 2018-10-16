U bent IT-Consultant en krijgt de vraag om een voorstel te maken en te demonstreren van een Windowsomgeving.
Deze omgeving moet bestaan uit het volgende .
De cliënt wenst een redundante oplossing voor zijn servers. Dit vooral op de domeincontrollers. De cliënt wenst ook dat er een mailomgeving geïnstalleerd wordt en een omgeving die toelaat om op een efficiënte manier Windows toestellen te installeren en te deployen. 

U krijgt dus volgende situatie:

    1. Domeincontrollers die bestaan uit Windows 2016 met volgende specifiacties
        a. OS: Windows 2016 
        b. IP instellingen DC 1
            i. 1 NIC op NAT
            ii. 1 NIC op intern netwerk met volgende IP configuratie
                1. IP: 192.168.1.1
                2. SN: 255.255.255.0
        c. IP instellingen DC 2
            i. 1 NIC op Intern netwerk
                1. IP: 192.18.1.2
                2. SN: 255.255.255.0
                3. DG: 192.168.1.1
&#8291;

    2. SQL server
        a. OS: Windows 2016
        b. Versie SQL versie 2013 - 2016
        c. IP instellingen SQL server
            i. 1 NIC op intern netwerk
                1. IP: 192.168.1.3
                2. SN: 255.255.255.0
                3. DG: 192.168.1.1
&#8291;


    3. Exchange server
        a. OS: Windows 2016
        b. Versie Exchange: 2013 of 2016
        c. IP instellingen Exchange
            i. 1 NIC op intern netwerk
                1. IP: 192.168.1.3
                2. SN: 255.255.255.0
                3. DG: 192.168.1.1
&#8291;


    4. Deployment server
        a. OS: Windows 2016
        b. Versie SCCm: 2012
        c. IP instellingen Deployment
            i. 1 NIC op intern netwerk
                1. IP: 192.168.1.4
                2. SN: 255.255.255.0
                3. DG: 192.168.1.1
&#8291;


    5. Windows Cliënt
        a. OS: Windows 10
        b. IP: via DHCP van de DC1 of DC2
        c. Office software om te mailen
&#8291;


    6. Bijkomende specificaties
        a. Naamgeving domein: eerste 3 letters van uw voornaam plus de eerste 3 letters van de achternaam en als extensie de campus
            i. Voorbeeld dirthi.aalst
            ii. Voorbeeld dirthi.gent
        b. Naamgeving servers
            i. Configureer de naam zo dat de functie van de server kan gehaald worden uit uw naamgeving
            ii. Voorbeeld: ServerDC1
            iii. Voorbeeld: ClientPC1
        c. Configureer op uw DC 1 de routerfaciliteiten zodat uw intern netwerk via de DC1 op het internet kan.
&#8291;


    7. Opdracht specifiek servers
        a. Exchange server
            i. Moet zo geconfigureerd worden dat het mogelijk is om en mail te sturen naar dirk.thijs@pcprof.be.
            ii. Dit lukt enkel buiten de school. 
        b. Deployment server:
            i. Moet mogelijk zijn om een Windows Cliënt te installeren via een image
            ii. Moet mogelijk zijn om Adobe reader te deployen op een Windows toestel
            iii. Beheers uw updates via de deployment omgeving
&#8291;


    8. Software
        a. Te downloaden via imagine. Email adressen worden doorgegeven aan bert zodat de accounts kunnen aangemaakt worden.
 &#8291;


    9. Documentatie
        a. Daar waar mogelijk zal alles op chamilo geplaatst worden. Andere info kan je vinden op internet.
 &#8291;


    10. Evaluatie
        a. Documenteer uw verschillende installatie stappen en manier waarop je bepaalde problemen hebt opgelost.
        b. Op het einde van de module is er een evaluatie moment waarop u komt verdedigen waarom u een bepaalde manier hebt gevolgd, of waarom iets niet gewerkt heeft.