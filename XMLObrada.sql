USE SQLProgramiranjeProjekat;
GO

-- FOR XML PATH nam omogućava da vratimo rezultat upita u XML formatu; Root je definisan kao 'Artikli'.

SELECT dbo.Artikal.BrojArtikla AS '@Broj', dbo.Artikal.NazivArtikla AS 'Naziv', dbo.Artikal.Cena AS 'Cena', Kategorija.NazivKategorije AS 'Kategorija' FROM dbo.Artikal INNER JOIN dbo.Kategorija ON dbo.Artikal.KategorijaID = dbo.Kategorija.KategorijaID FOR XML PATH ('Artikal'), ROOT('Artikli');

/***************************************************************************************************************************************************************

	Upit vraća rezultat sa više od 4000 karaktera; da bi se zaobišao limit NVARCHAR-a (4000 karaktera), broj karaktera je podešen na max. @handle služi da skladišti mesto u memoriji gde se obrađivani podaci nalaze.

***************************************************************************************************************************************************************/

DECLARE @XML_text nvarchar(max), @handle int

SET @XML_text = (SELECT dbo.Artikal.BrojArtikla AS '@Broj', dbo.Artikal.NazivArtikla AS 'Naziv', dbo.Artikal.Cena AS 'Cena', Kategorija.NazivKategorije AS 'Kategorija' FROM dbo.Artikal INNER JOIN dbo.Kategorija ON dbo.Artikal.KategorijaID = dbo.Kategorija.KategorijaID FOR XML PATH ('Artikal'), ROOT('Artikli'));

EXEC sp_xml_preparedocument @handle OUTPUT, @xml_text

-- Parsiraju se XML podaci i prikazuju se u vidu tabele sa kolonama BrojArtikla, NazivArtikla, Kategorija i Cena.

SELECT * FROM OPENXML(@handle, 'Artikli/Artikal')

-- Kako bi OPENXML uspešno vratio podatke, neophodno je specificirati šta je atribut, a šta element (u suprotnom vraća NULL vrednost). 

WITH(BrojArtikla int '@Broj', NazivArtikla nvarchar(50) 'Naziv', Kategorija nvarchar(50)'Kategorija', Cena float 'Cena')

-- Čišćenje memorije
EXEC sp_xml_removedocument @handle
