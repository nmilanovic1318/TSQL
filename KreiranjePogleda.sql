USE SQLProgramiranjeProjekat;
GO
/*****************************************************************************************************************************************

	Kreira se pogled sa imenom PregledReklamacija; sastoji se od SELECT naredbe koja izvlači ime, prezime i broj kupaca i prikazuje njihov ukupan broj reklamacija uz pomoć COUNT funkcije.

*****************************************************************************************************************************************/

CREATE VIEW PregledReklamacija
AS
SELECT COUNT(dbo.Reklamacija.ReklamacijaID) AS [Ukupno reklamacija], dbo.Kupac.Ime, dbo.Kupac.Prezime, dbo.Faktura.BrojKupca FROM dbo.Reklamacija INNER JOIN dbo.Faktura ON dbo.Reklamacija.BrojFakture = dbo.Faktura.BrojFakture INNER JOIN dbo.Kupac ON dbo.Kupac.BrojKupca = dbo.Faktura.BrojKupca GROUP BY dbo.Kupac.Ime, dbo.Kupac.Prezime, dbo.Faktura.BrojKupca;
GO

-- Korišćenje pogleda
SELECT * FROM PregledReklamacija;
