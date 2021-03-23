USE SQLProgramiranjeProjekat;
GO

CREATE PROC DeleteZaposlenog(
	@ZaposleniID int = NULL
)
AS 
BEGIN
	BEGIN TRY
	
		DELETE FROM Zaposleni WHERE (ZaposleniID = @ZaposleniID OR @ZaposleniID IS NULL)
	
	END TRY
	BEGIN CATCH
		EXEC dbo.ErrorHandling
	END CATCH;
	END;
	GO

-- Ubacivanje probnog zaposlenog za testiranje
INSERT Zaposleni (Ime, Prezime, BrojTelefona, Adresa) VALUES ('Probni', 'Zaposleni', '061238295', 'Adresa');
GO

-- Korišćenje procedure za brisanje zaposlenog sa SELECT naredbom za proveru tabele
EXEC DeleteZaposlenog
SELECT * FROM Zaposleni;
GO


