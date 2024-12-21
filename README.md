

**Avtor**: Lara Hanželič

## izziv pri predmetu Analiza medicinskih slik

## Opis in delovanje

Model [DeepFlash](https://github.com/jw4hv/deepflash) je nevronska mreža za difeomorfno registracijo medicinskih posnetkov (predictive diffeomorphic image registration).  
Ustvarjen je za vhodne podatke tipa `mhd`.

Glavna prednost modela **DeepFlash** je zelo učinkovita in hitra inferenca. Vhodni podatki se v koraku predprocesiranja pretvorijo v frekvenčno domeno, z `2D Fourierjevo` transformacijo. Konvolucija v frekvenčni domeni je zelo učinkovita, saj je ekvivalentna množenju.


## Zagon modela

Model se lahko uporablja `lokalno` ali preko [Dockerja](https://www.docker.com/).  
Zaradi ne delujoče `GPU` podpore v izvornem repozitoriju je model nastavljen da uporabllja samo `CPU`.

### Nastavitvhe vhodov in izhodov

Vse poti do podatkov so nastavljene v zagonskih datotekah `.bat`.  
Tam se lahko nastavlja vhodne in izhodne direktorije.  

> `PAZI!`  
> Vse poti morajo biti v `glob` formatu.  
> primer `./data/vhod/*.mhd` in ne `./data/vhod`

Opis vseh nastavitev je na voljo na [Izvornem repozitoriju.](https://github.com/jw4hv/deepflash)  

### Lokalno treniranje

V repoozitoriju so naloženi v naprej predprocesirani podatki. Model se trenira z zagonom datoteke `runDeepFLASH_testing.bat`   
Ko se treniranje modela konča, bo model shranjen v direktorij `(saved_trained_model)`

### Lokalno testiranje

Če obstaja checkpoint treniranega modela (ki se ustvari ko se model strenira), lahko model poženemo na testnih podatkih z zagonom `runDeepFLASH_training.bat`.  

### Uporaba z Dockerjem

Tako treniranje kot testiranje modela je definirano v `docker-compose.yaml` datoteki.  
Docker mounta lokalni direktorij, kar omogoča da vhodnih podatkov ne prenašamo v kontejnerje.  

- Treniranje
  - V `docker-compose.yaml` zakomentiramo storitev za inferenco (pustimo samo training)
  - Zaženemo `docker compose up -it`.
  - Počakamo da se training konča
  - z `ctrl + c` zapremo okolje
  - `docker compose down -v` zaustavi kontejnerje ter počisti mapirane volumne

- Inferenca
  - V `docker-compose.yaml` zakomentiramo storitev za učenje (pustimo samo inferenco)
  - Zaženemo `docker compose up -it`.
  - Počakamo da se rezultati izpišejo
  - z `ctrl + c` zapremo okolje
  - `docker compose down -v` zaustavi kontejnerje ter počisti mapirane volumne

Če ima naprava `GPU` in `nvidia container toolkit`, imajo kontejnerji omogočen dostop do grafičnih pospeševalnikov. (čeprav je v skripti omogočen le CPU)  

### Uporaba na lastnih podatkih  

Za uporabo lastnih podatkov (slik) je potrebno slediti navodilom za predprocesiranje na [izvornem repozitoriju](https://github.com/jw4hv/deepflash/blob/master/preprocess/Preprocessing_instruction.txt):

- Vhodne podatke se konvertira v `.mhd` format s skripto `convert.py`  
- Predprocesiranje podatkov je potrebno izvesti v `matlabu`.  
- Dodatno analizo za `initial velocity field` **NISEM USPELA IMPLEMENTIRATI**
