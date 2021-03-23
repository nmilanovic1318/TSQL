USE SQLProgramiranjeProjekat;
GO

/************************************************************************************************************************************

	Pomoću ovog upita izvlače se nazivi i cene svih artikala (iz tabele Artikal), nakon čega se sortiraju u opadajućem maniru prema ceni. Uz pomoć OFFSET-FETCH clause-a se nakon toga izbacuje 10 najskupljih proizvoda i listira 25 sledećih proizvoda iz tabele, kako bi se dobio osećaj za prosečnu cenu proizvoda u prodavnici.


*************************************************************************************************************************************/

SELECT dbo.Artikal.NazivArtikla AS [Naziv artikla], dbo.Artikal.Cena AS [Cena artikla] FROM dbo.Artikal ORDER BY dbo.Artikal.Cena DESC OFFSET 10 ROWS FETCH NEXT 25 ROWS ONLY; 
GO

/************************************************************************************************************************************

	Ovim upitom se izvlače nazivi svih podkategorija (iz tabele Podkategorija), nakon čega se uz pomoć EXISTS predikata filtriraju samo one podkategorije koje nude neki proizvod u 'Basic' modelu. Upit je koristan za utvrđivanje toga koje podkategorije artikala se nude u okviru 'Basic' modela.

************************************************************************************************************************************/

SELECT dbo.Podkategorija.NazivPodkategorije AS [Naziv podkategorije] FROM dbo.Podkategorija WHERE EXISTS (SELECT dbo.Model.NazivModela FROM dbo.Model WHERE dbo.Podkategorija.PodkategorijaID = dbo.Model.PodkategorijaID AND dbo.Model.NazivModela = 'Basic');
GO