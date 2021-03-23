USE SQLProgramiranjeProjekat;
GO

/***************************************************************************************************************************************************************	
	Funkcija pruža mogućnost korisniku da unese broj kupca za kojeg želi da pretraži broj ukupnih kupovina, nakon čega vraća traženu vrednost.

****************************************************************************************************************************************************************/

CREATE FUNCTION dbo.BrojKupovina(
	@BrojKupca INT
)
RETURNS INT
AS 

BEGIN

	DECLARE @brojProdaja INT
	SELECT @brojProdaja = COUNT(BrojKupca) FROM dbo.Faktura WHERE BrojKupca = @BrojKupca;
	RETURN @brojProdaja

END;
GO

SELECT dbo.BrojKupovina(3) AS [Broj kupovina];