USE SQLProgramiranjeProjekat;
GO
/*****************************************************************************************************************************************

	Kreira se procedura sa imenom ErrorHandling za svrhu upravljanja greškama. U Try bloku se u tabelu dbo.ErrorData ubacuju podaci o grešci koji se dobijaju uz pomoć ugrađenih funkcija - ukoliko dođe do greške, u Catch bloku se ispisuje poruka o tome da je došlo do greške prilikom ubacivanja podataka u tabelu.

*****************************************************************************************************************************************/

CREATE PROC dbo.ErrorHandling
AS
BEGIN
	BEGIN TRY
	INSERT INTO dbo.ErrorData (ErrorNumber, ErrorSeverity, ErrorState, ErrorProcedure, ErrorLine, ErrorMessage)
	VALUES
	(
		ERROR_NUMBER(), 
		ERROR_SEVERITY(), 
		ERROR_STATE(), 
		ERROR_PROCEDURE(), 
		ERROR_LINE(), 
		ERROR_MESSAGE()
	)
	END TRY
	BEGIN CATCH
		PRINT 'Došlo je do greške prilikom unosa u tabelu ErrorData!';
	END CATCH

END;
GO


