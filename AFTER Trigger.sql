USE SQLProgramiranjeProjekat;
GO
/*************************************************************************************************************************************************************

	Okidač se pokreće nakon što se izvrši INSERT komanda za tabelu Zaposleni; proverava da li neko pokušava da ubaci novog zaposlenog sa brojem telefona koji već postoji u tabeli (pretpostavka je da može postojati samo jedan zaposleni sa istim brojem telefona) - ukoliko se utvrdi da već postoji zaposleni sa brojem telefona koji neko pokušava da unese, transakcija se rollback-uje i podiže se greška sa porukom o tome da su podaci duplirani.

*************************************************************************************************************************************************************/

CREATE OR ALTER TRIGGER KontrolaRedudanse 
ON dbo.Zaposleni
AFTER INSERT
AS
BEGIN

	SET NOCOUNT ON;
	IF EXISTS (SELECT * FROM dbo.Zaposleni INNER JOIN inserted ON inserted.BrojTelefona = dbo.Zaposleni.BrojTelefona AND inserted.ZaposleniID <> dbo.Zaposleni.ZaposleniID)
	BEGIN
		ROLLBACK TRANSACTION
		RAISERROR('Duplirani podaci', 16, 1);
		END
END
GO

SELECT * FROM dbo.Zaposleni;
INSERT INTO dbo.Zaposleni (Ime, Prezime, Adresa, BrojTelefona) VALUES ('Nikola', 'Miškov', 'Molerova 7', '061999888');
GO
