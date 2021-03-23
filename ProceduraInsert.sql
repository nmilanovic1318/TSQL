USE SQLProgramiranjeProjekat;
GO

/*****************************************************************************************************************************************

	Kreira se procedura sa imenom InsertZaposlenog za svrhu ubacivanja podataka o zaposlenima u tabelu Zaposleni. U Try bloku se prvo testira ispravnost unetih podataka (ukoliko je bilo koji od parametara jednak praznom polju ili NULL vrednosti, ispisaće se greška), nakon čega se vrednosti parametara ubacuju u tabelu Zaposleni preko INSERT naredbe. Ukoliko dođe do greške, Catch blok poziva proceduru za upravljanje greškama.

*****************************************************************************************************************************************/

CREATE PROC InsertZaposlenog(
	@Adresa varchar(30) = NULL,
	@Ime varchar(40) = NULL,
	@Prezime varchar(50) = NULL,
	@BrojTelefona varchar(20) = NULL
)
AS 
BEGIN
	BEGIN TRY
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
		INSERT INTO dbo.Zaposleni (Ime, Prezime, Adresa, BrojTelefona)
		VALUES
		(
			@Ime,
			@Prezime,
			@Adresa,
			@BrojTelefona
		)
		
	END TRY
	BEGIN CATCH
		EXEC dbo.ErrorHandling
	END CATCH;
	END;
	GO

EXEC InsertZaposlenog 'Vodovodska 15', 'Mihajlo', 'Nikolic', '0612353633'
GO

--SELECT * FROM dbo.ErrorData;

--SELECT * FROM dbo.Zaposleni;

