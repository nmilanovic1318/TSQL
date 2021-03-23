USE SQLProgramiranjeProjekat;
GO

/*****************************************************************************************************************************************

	Kreira se procedura sa imenom InsertKupac za svrhu ubacivanja podataka o kupcu u tabelu dbo.Kupac. Procedura sadrži obradu transakcije. 
	U Try bloku se započinje transakcija, koja sadrži dve INSERT naredbe - unos podataka za dva različita kupca. Prva INSERT naredba ne sadrži nikakvu grešku i izvršava se bez problema - međutim, druga INSERT naredba sadrži grešku zbog koje se ne može izvršiti. Kada dođe do greške, Catch blok prikazuje poruku sa podacima o istoj i rollback-uje čitavu transakciju - što znači da se ni prva INSERT naredba neće izvršiti, jer transakcija nije commit-ovana.

*****************************************************************************************************************************************/

CREATE PROC InsertKupac
AS 
BEGIN
	BEGIN TRY
	BEGIN TRANSACTION
		INSERT INTO dbo.Kupac (Ime, Prezime, AdresaKupca, BrojTelefonaKupca, Grad)
		VALUES ('Marko', 'Petković', 'Zmajevačka 14', '0656789421', 'Beograd');

		-- IDENTITY_INSERT je namešten na OFF, ubacivanje broja kupca preko INSERT komande rezultuje u grešci; obe INSERT naredbe će biti rollback-ovane kao rezultat 

		INSERT INTO dbo.Kupac (BrojKupca, Ime, Prezime, AdresaKupca, BrojTelefonaKupca, Grad)
		VALUES (101, 'Ana', 'Stanković', 'Grigora Viteza 16', '0614534461', 'Beograd');
	COMMIT TRANSACTION
	END TRY
	BEGIN CATCH
		SELECT ERROR_NUMBER() AS [Error Number], ERROR_MESSAGE() AS [Error Message];
		ROLLBACK TRANSACTION
	END CATCH;
	END;
	GO

EXEC InsertKupac;
GO

-- SELECT * FROM Kupac;
