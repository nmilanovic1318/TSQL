USE SQLProgramiranjeProjekat;
GO

/*************************************************************************

	Upit izvlači naziv i težinu artikla iz tabele Artikal; nakon toga se uz pomoć skalarnog podupita izvlači maksimalna težina artikla iz tabele Artikal i prikazuje se najteži - odnosno onaj artikal čija je težina jednaka vrednosti težine koju je podupit izvukao. 

*************************************************************************/

SELECT dbo.Artikal.NazivArtikla AS [Naziv artikla], Artikal.Težina AS [Težina artikla] FROM dbo.Artikal WHERE dbo.Artikal.Težina = (SELECT MAX(Težina) AS maksimalnaTežina FROM dbo.Artikal);
GO

/*************************************************************************

	Upit izvlači ime i prezime kupca iz tabele Kupac; nakon toga, uz pomoć više-vrednosnog podupita se preko broja kupca izvlače svi kupci koji su iz Valjeva. 

*************************************************************************/

SELECT dbo.Kupac.Ime AS [Ime kupca], dbo.Kupac.Prezime AS [Prezime kupca] FROM dbo.Kupac WHERE dbo.Kupac.BrojKupca IN (SELECT dbo.Kupac.BrojKupca FROM dbo.Kupac WHERE Grad = 'Valjevo' );
GO

/*************************************************************************

	Upit izvlači Broj fakture, ID zaposlenog, i datum dostave iz tabele Dostava. Nakon toga, uz pomoć podupita se pronalazi maksimalan datum dostave za svakog zaposlenog (odnosno datum njihove poslednje dostave), preuzima se vrednost iz spoljašnjeg upita, i ukoliko se ID zaposlenog iz spoljnog i unutrašnjeg upita poklapaju, dodaje se red u rezultujuću tabelu. Sa obzirom na to da podupit zavisi od vrednosti spoljašnjeg upita, u pitanju je korelativni podupit.

*************************************************************************/

SELECT ZaposleniID AS [ID Zaposlenog], BrojFakture AS [Broj fakture], DatumDostave AS [Datum dostave] FROM dbo.Dostava AS Q1 WHERE DatumDostave = (SELECT MAX(DatumDostave) FROM dbo.Dostava AS Q2 WHERE Q2.ZaposleniID = Q1.ZaposleniID) ORDER BY ZaposleniID, DatumDostave;