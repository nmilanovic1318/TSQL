USE SQLProgramiranjeProjekat;
GO

-- FOR JSON PATH nam omogućava da vratimo rezultat upita u JSON formatu; ROOT je podešen kao 'Artikli'

SELECT dbo.Artikal.BrojArtikla AS 'BrojArtikla', dbo.Artikal.NazivArtikla AS 'Naziv', dbo.Artikal.Cena AS 'Cena', Kategorija.NazivKategorije AS 'Kategorija' FROM dbo.Artikal INNER JOIN dbo.Kategorija ON dbo.Artikal.KategorijaID = dbo.Kategorija.KategorijaID FOR JSON PATH, ROOT('Artikli');

-- Deklariše se varijabla @JSON_Text tipa nvarchar u kojoj će se čuvati rezultat upita koji vraća rezultate u JSON formatu.

DECLARE @JSON_Text nvarchar(max)

SET @JSON_Text = (SELECT dbo.Artikal.BrojArtikla, dbo.Artikal.NazivArtikla AS 'Naziv', dbo.Kategorija.NazivKategorije AS 'Kategorija', dbo.Artikal.Cena AS 'Cena' FROM dbo.Artikal INNER JOIN dbo.Kategorija ON dbo.Artikal.KategorijaID = dbo.Kategorija.KategorijaID FOR JSON PATH, ROOT('Artikli'));

-- Parsiraju se JSON podaci i prikazuju se u vidu tabele sa kolonama BrojArtikla, NazivArtikla, Kategorija i Cena.

SELECT * FROM OPENJSON(@JSON_Text, '$.Artikli')
	WITH 
	(
	BrojArtikla int '$.BrojArtikla', 
	NazivArtikla nvarchar(50) '$.Naziv', 
	Kategorija nvarchar(50) '$.Kategorija',
	Cena float '$.Cena'
	);


