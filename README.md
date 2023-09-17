## CD assignment

Voor deze opdracht heb ik gebruik gemaakt van de webpagina's die we eerder in de moduel maakten voor de 'farm-opdracht'. 

Het inrichten van de server om de website in de lucht te krijgen was gelukt door het doorlopen van de subopdrachten, maar het was me in het begin niet altijd duidelijk waarom ik bepaalde commando’s lokaal of juist op de server moest geven of waarom ik stukjes tekst in bijvoorbeeld het Nginx' configuration file moest aanpassen. Het duurde best even voor de informatie landde.

- Voor de CD assignment heb ik van de farm-opdrachtmap, lokaal op mijn PC, mbv VSCode een repository gemaakt. Vervolgens een pytest geschreven, een eerste stukje van een yml-file om een actie te starten en de repository gepusht naar GitHub.

- De Github-action wordt geactiveerd zodra nieuwe code naar Github wordt gepusht. 

- In eerste instantie was het plan om de 2 jobs (de pytest en daarna de deployactie) in 2 apartje yml files op te slaan en de 2e pas aan te roepen als de 1e klaar was. Door gebruik te maken van ***needs: run-tests*** bij de deploy-job konden beide opdrachten in één yml-file worden opgeslagen. Deploy wordt pas gestart als run-tests  succesvol is afgerond, dit heb ik getest met een aangepaste (foutieve) pytest.

- Bij aanpassing van de yml-file en push naar Github werkte de pytest eerst niet. Na toevoeging van "Flask" aan de requirements.txt draaide de 1e job van de yaml-file goed. 

- De 2e job niet: ik had de SSH-keys aangemaakt maar kreeg steeds de melding ‘host-verification failed’. Uiteindelijk alles opnieuw gedaan, ik bleek de public keys (set lokaal en set op VPS) te hebben verwisseld.

- Vervolgens werkte de SSH-keys wel maar de deploy niet, althans, de aangepaste bestanden stonden wel op mijn droplet maar de farm.service startte niet. De commando’s om de farm.service eerste te beëindigen en daarna te weer te starten waren niet afdoende.  

- Vervolgens heb ik gezocht naar een eventueel probleem in het servicebestand. Deze is eerst aangepast wat betreft het pad naar gunicorn  /usr/local/bin/gunicorn --chdir /home/farm main:app. 

- De website kon nog niet benaderd worden; pas na de toevoeging van --bind 0.0.0.0 werkte alles naar behoren.
