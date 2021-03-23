USE SQLProgramiranjeProjekat;
GO

/*****************************************************************************************************************************************

	Kreira se procedura sa imenom UpdateZaposlenog za svrhe izmene podataka o zaposlenima u tabeli Zaposleni. 
	U Try bloku se prvo testira ispravnost unetih podataka (ukoliko je bilo koji od parametara jednak praznom polju ili NULL vrednosti, ispisaće se greška), nakon čega se vrednosti u tabeli Zaposleni podešavaju na vrednosti unetih parametara. 
	
	Ukoliko dođe do greške, Catch blok poziva proceduru za upravljanje greškama.

*****************************************************************************************************************************************/

CREATE PROC UpdateZaposlenog(
	@ZaposleniID int = NULL,
	@Adresa varchar(30) = NULL,
	@Ime varchar(40) = NULL,
	@Prezime varchar(50) = NULL,
	@BrojTelefona varchar(20) = NULL
)
AS 
BEGIN
	BEGIN TRY
	IF(ISNULL(@ZaposleniID, 0) = 0)
		BEGIN
			RAISERROR('ID Zaposlenog ne sme biti nula ili NULL!', 18, 0);
		END
	IF(ISNULL(@Adresa, '') = '')
		BEGIN
			RAISERROR('Adresa ne sme biti NULL ni prazna!', 18, 0);
		END
		IF(ISNULL(@Ime, '') = '')
		BEGIN
			RAISERROR('Ime ne sme biti NULL ni prazno!', 18, 0);
		END
		IF(ISNULL(@Prezime, '') = '')
		BEGIN
			RAISERROR('Prezime ne sme biti NULL ni prazno!', 18, 0);
		END
		IF(ISNULL(@BrojTelefona, '') = '')
		BEGIN
			RAISERROR('Broj telefona ne sme biti NULL ni prazan!', 18, 0);
		END
		UPDATE Zaposleni SET Adresa = @Adresa, Ime = @Ime, Prezime = @Prezime, BrojTelefona = @BrojTelefona WHERE (ZaposleniID = @ZaposleniID)
	END TRY
	BEGIN CATCH
		EXEC dbo.ErrorHandling
	END CATCH;
	END;
	GO

EXEC UpdateZaposlenog 1, 'Molerova 8', 'Nikola', 'Miskov', '061999888'
GO

--SELECT * FROM Zaposleni


