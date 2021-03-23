USE SQLProgramiranjeProjekat;
GO

/***************************************************************************************************************************************************************	
	Funkcija pruža mogućnost korisniku da unese broj artikala koji želi da mu se prikaže u rezultujućoj tabeli, kao i cenu ispod koje želi da vidi artikle. Artikli su na kraju sortirani prema ceni u opadajućem maniru. 

****************************************************************************************************************************************************************/

CREATE FUNCTION dbo.ArtikliPoCeni(

	@BrojArtikala int,
	@Cena int
)
RETURNS TABLE
AS
RETURN (SELECT TOP(@BrojArtikala)
		dbo.Artikal.NazivArtikla AS [Naziv artikla],
		dbo.Artikal.Cena AS [Cena artikla],
		dbo.Artikal.BrojArtikla AS [BrojArtikla]
		FROM dbo.Artikal
		WHERE dbo.Artikal.Cena < @Cena
		ORDER BY dbo.Artikal.Cena DESC);
GO

SELECT * FROM dbo.ArtikliPoCeni(10, 30000);

