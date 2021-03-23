USE SQLProgramiranjeProjekat;
GO
/********************************************************************************************************************************************* 

	Ovim upitom se izvlače podaci o svim reklamacijama koje su poslate u vezi sa fakturama koje su napravljene nakon desetog januara 2021. godine. Koristan je za filtriranje trendova u primljenim reklamacijama u traženom vremenskom periodu - može, na primer, pomoći da se utvrdi ukoliko postoji neki problem sa nekom pošiljkom određenog tipa robe. 

***********************************************************************************************************************************************/

SELECT dbo.Reklamacija.BrojFakture AS [Broj Fakture], dbo.Reklamacija.OpisReklamacije AS [Opis Reklamacije], dbo.Faktura.Datum AS [Datum Fakture] FROM dbo.Reklamacija INNER JOIN dbo.Faktura ON dbo.Reklamacija.BrojFakture = dbo.Faktura.BrojFakture WHERE dbo.Faktura.Datum > '2021-01-10';
GO

/********************************************************************************************************************************

	Ovim upitom se izvlače osnovni podaci o kupcima iz tabele Kupac, datum(i) njihovih faktura iz tabele Faktura, kao i broj i količina artikala koji su kupili iz tabele StavkeFakture. Nakon izvlačenja, podaci su raspoređeni prema količini kupljenih artikala (padajući). Uz pomoć ovog upita lako se mogu prikazati korisnici koji su napravili najveće pojedinačne kupovine.

*********************************************************************************************************************************/

SELECT dbo.Kupac.Ime AS [Ime Kupca], dbo.Kupac.Prezime AS [Prezime Kupca], dbo.Kupac.BrojTelefonaKupca AS [Broj Telefona Kupca], dbo.Faktura.Datum AS [Datum Fakture], dbo.StavkeFakture.BrojArtikla AS [Broj kupljenog artikla], dbo.StavkeFakture.Količina AS [Količina] FROM dbo.Kupac INNER JOIN dbo.Faktura ON dbo.Kupac.BrojKupca = dbo.Faktura.BrojKupca INNER JOIN dbo.StavkeFakture ON dbo.Faktura.BrojFakture = dbo.StavkeFakture.BrojFakture ORDER BY dbo.StavkeFakture.Količina DESC;
GO

/********************************************************************************************************************************

	Ovim upitom se iz tabele Artikal izvlači naziv kupljenog artikla, količina kupljenih artikala iz tabele StavkeFakture, kao i datum kada je faktura napravljena iz tabele Faktura. Nakon što se podaci izvuku, grupisani su uz pomoć GROUP BY clause-a, prvo preko količine, zatim preko naziva artikala, i poslednje preko datuma kada je faktura napravljena. Nakon ovoga, korišćen je HAVING clause kako bi upit izvukao samo one stavke gde je količina kupljenih artikala veća od 2. Na kraju su podaci poređani prema količini kupljenih artikala u opadajućem maniru.  

********************************************************************************************************************************/

SELECT dbo.Artikal.NazivArtikla AS [Naziv artikla],dbo.StavkeFakture.Količina AS [Količina kupljenih artikala], dbo.Faktura.Datum AS [Datum fakture] FROM dbo.Faktura INNER JOIN dbo.StavkeFakture ON dbo.Faktura.BrojFakture = dbo.StavkeFakture.BrojFakture INNER JOIN dbo.Artikal ON dbo.StavkeFakture.BrojArtikla = dbo.Artikal.BrojArtikla GROUP BY dbo.StavkeFakture.Količina, dbo.Artikal.NazivArtikla, dbo.Faktura.Datum HAVING dbo.StavkeFakture.Količina > 2 ORDER BY dbo.StavkeFakture.Količina DESC;
GO

/************************************************************************************************************************************

	Ovim upitom se izvlače nazivi i cene svih artikala (iz tabele Artikal), kao i adrese magacina. Nakon toga se uz pomoć WHERE clause-a filtriraju samo oni artikli koji se nalaze unutar magacina čije je operativno stanje jednako nuli (što signalizira da magacin nije operativan). Upit je koristan za utvrđivanje toga koja roba se nalazi u magacinima koji trenutno nisu operativni.

************************************************************************************************************************************/


SELECT dbo.Artikal.NazivArtikla AS [Naziv artikla], dbo.Artikal.Cena AS [Cena artikla], dbo.Magacin.Adresa AS [Adresa magacina] FROM dbo.Artikal INNER JOIN dbo.Magacin ON dbo.Artikal.MagacinID = dbo.Magacin.MagacinID WHERE dbo.Magacin.OperativnoStanje = 0; 
GO

/****************************************************************************************************************************************

	Ovaj upit izvlači osnovne podatke (ime, prezime i grad) o kupcima iz tabele Kupac, koristi COUNT funkciju na polju BrojKupca iz tabele Faktura kako bi izračunao broj kupovina koji su kupci pojedinačno napravili, nakon čega prikazuje podatke grupisane po broju kupovina, zatim imenu i prezimenu, i konačno gradu. Posle grupisanja, podaci su sortirani prema broju kupovina u opadajućem maniru. Upit je koristan jer pruža uvid u količinu kupovina napravljenu u svakom gradu, od strane svakog kupca pojedinačno. Ovo može služiti za izvlačenje mesečnih statistika.

****************************************************************************************************************************************/

SELECT dbo.Kupac.Ime AS [Ime kupca], dbo.Kupac.Prezime AS [Prezime kupca], COUNT(dbo.Faktura.BrojKupca) AS [Broj kupovina], dbo.Kupac.Grad AS [Grad] FROM dbo.Faktura INNER JOIN dbo.Kupac on dbo.Faktura.BrojKupca = dbo.Kupac.BrojKupca GROUP BY dbo.Faktura.BrojKupca, dbo.Kupac.Ime, dbo.Kupac.Prezime, dbo.Kupac.Grad ORDER BY [Broj kupovina] DESC;
GO

/*****************************************************************************************************************************************

	Upit selektuje osnovne podatke zaposlenih iz tabele Zaposleni (ime, prezime), datum kada je napravljena faktura iz tabele Faktura, kao i datum kada je izvršena dostava iz tabele Dostava. Nakon ovoga, za potrebu određivanja vremenskog perioda (u ovom slučaju poslednjih 15 dana), iskorišćena je ugrađena DATEDIFF funkcija. Uz pomoć WHERE clause-a specificirano je da se kao rezultat upita prikažu samo one dostave koje spadaju u vremenski interval određen uz pomoć DATEDIFF funkcije. Upit je koristan jer pruža uvid u to koliko dostava je izvršeno u poslednjih 15 dana - što je dobar indikator da li poslovanje teče dobro. Takođe, datum fakture je prikazan pored datuma dostave, što omogućava lak uvid u prosečno vreme čekanja na dostavu.

*****************************************************************************************************************************************/

SELECT dbo.Zaposleni.Ime AS [Ime zaposlenog], dbo.Zaposleni.Prezime AS [Prezime zaposlenog], dbo.Faktura.Datum AS [Datum Fakture], dbo.Dostava.DatumDostave AS [Datum dostave] FROM dbo.Zaposleni INNER JOIN dbo.Dostava ON dbo.Zaposleni.ZaposleniID = dbo.Dostava.ZaposleniID INNER JOIN dbo.Faktura ON dbo.Faktura.BrojFakture = dbo.Dostava.BrojFakture WHERE DATEDIFF(DAY, dbo.Dostava.DatumDostave, GETDATE()) between 0 and 15;
GO

/*****************************************************************************************************
	
	Upit izvlači naziv modela i ID podkategorije iz tabele Model, kao i naziv podkategorije iz tabele Podkategorija. Pošto se koristi outer (right) join gde se Podkategorija nalazi sa desne strane JOIN izraza, prikazuju se vrednosti (nazivi kategorije) iz tabele Podkategorija čak i ako ne postoje parovi vrednosti iz tabele sa leve strane JOIN izraza (Model). U ovom slučaju, možemo videti da se artikli iz određenih podkategorija ne nude u specifičnim modelima - pa su polja u toj situaciji popunjena sa NULL vrednostima. Upit je koristan ukoliko želimo istovremeno da imamo uvid i u podkategorije i u modele, bez obzira na to da li za određenu podkategoriju postoji poseban model.

******************************************************************************************************/

SELECT dbo.Model.NazivModela AS [Naziv modela], dbo.Podkategorija.NazivPodkategorije AS [Naziv podkategorije], dbo.Model.PodkategorijaID AS [Podkategorija ID] FROM dbo.Model RIGHT JOIN dbo.Podkategorija ON dbo.Model.PodkategorijaID = dbo.Podkategorija.PodkategorijaID;
GO

/*****************************************************************************************************
	
	Upit izvlači osnovne podatke o kupcu iz tabele Kupac (ime, prezime, adresa). Pošto se koristi outer (left) join gde se Kupac nalazi sa leve strane JOIN izraza, prikazuju se vrednosti (ime, prezime, adresa kupca) iz tabele Kupac čak i ako ne postoje parovi vrednosti iz tabele sa desne strane JOIN izraza (Faktura). U ovom slučaju, možemo videti da se podaci o kupcima prikazuju čak i ako još uvek nisu napravili nijednu kupovinu. Upit je koristan ukoliko želimo istovremeno da imamo uvid u sve kupce koji su registrovani u bazi podataka i napravljene kupovine, bez obzira na to da li su korisnici napravili kupovine u prošlosti (naravno, vrednost broja fakture će u slučaju da nisu biti NULL).

******************************************************************************************************/

SELECT dbo.Kupac.Ime AS [Ime kupca], dbo.Kupac.Prezime AS [Prezime kupca], dbo.Kupac.AdresaKupca AS [Adresa kupca], dbo.Faktura.BrojFakture AS [Broj fakture] FROM dbo.Kupac LEFT JOIN dbo.Faktura ON dbo.Kupac.BrojKupca = dbo.Faktura.BrojKupca;
GO

/*****************************************************************************************************
	
	Upit izvlači naziv i cenu artikla iz tabele Artikal, kao i naziv i broj telefona dobavljača iz tabele Dobavljač. Zatim filtrira samo one artikle za koje je tip robe dobavljača ćebe. Koristan je za istovremeno pretraživanje proizvoda i dobavljača u odnosu na tip robe.

******************************************************************************************************/

SELECT dbo.Artikal.NazivArtikla AS [Naziv artikla], dbo.Artikal.Cena AS [Cena artikla], dbo.Dobavljač.NazivDobavljača AS [Naziv dobavljača], dbo.Dobavljač.BrojTelefonaDobavljača AS [Broj telefona dobavljača], dbo.Dobavljač.AdresaDobavljača AS [Adresa dobavljača] FROM dbo.Artikal INNER JOIN dbo.Dobavljač ON dbo.Artikal.DobavljačID = dbo.Dobavljač.DobavljačID WHERE (dbo.Dobavljač.TipRobe = 'Ćebad');
GO

/*****************************************************************************************************
	
	Upit izvlači broj fakture i datum dostave iz tabele Dostava, ime i prezime kupca iz tabele Kupac, kao i ime i prezime zaposlenog iz tabele Zaposleni - prikazuje podatke o kupcima koji su naručili makar jednu dostavu, napravljenim dostavama, kao i zaposlenima koji su izvršili dostave. Koristan je za istovremenu pretragu svih dostava u bazi, kao i osoba koje su naručile dostave u pitanju i zaposlenih koji su ih izvršili. 

******************************************************************************************************/

SELECT (dbo.Dostava.BrojFakture) AS [Broj dostava], dbo.Dostava.DatumDostave AS [Datum dostave], dbo.Kupac.Ime AS [Ime kupca], dbo.Kupac.Prezime AS [Prezime kupca], dbo.Zaposleni.Ime AS [Ime zaposlenog], dbo.Zaposleni.Prezime AS [Prezime zaposlenog] FROM dbo.Dostava INNER JOIN dbo.Zaposleni ON dbo.Dostava.ZaposleniID = dbo.Zaposleni.ZaposleniID INNER JOIN dbo.Faktura ON dbo.Dostava.BrojFakture = dbo.Faktura.BrojFakture INNER JOIN dbo.Kupac ON dbo.Kupac.BrojKupca = dbo.Faktura.BrojKupca;
GO

/*****************************************************************************************************
	
	Upit izvlači naziv i ID podkategorije iz tabele Podkategorija, i zatim uz pomoć EXISTS predikata filtrira samo one podkategorije za koje postoji neki od modela iz tabele Model. Koristan je za pretragu podkategorija koje nude proizvode u bar jednom od postojećih modela.

******************************************************************************************************/

SELECT dbo.Podkategorija.NazivPodkategorije AS [Naziv podkategorije], dbo.Podkategorija.PodkategorijaID AS [ID Podkategorije] FROM dbo.Podkategorija WHERE EXISTS (SELECT dbo.Model.ModelID FROM dbo.Model WHERE dbo.Model.PodkategorijaID = dbo.Podkategorija.PodkategorijaID AND dbo.Model.ModelID IS NOT NULL);
GO

