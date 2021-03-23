USE SQLProgramiranjeProjekat;
GO

/*************************************************************************************************************************************************************

	Okidač se pokreće nakon što se izvrši DELETE naredba za tabelu Magacin; umesto brisanja reda (ili redova) će podesiti polje OperativnoStanje na nulu - što signalizira da magacin nije operativan.

*************************************************************************************************************************************************************/

CREATE TRIGGER BrisanjeMagacina
ON dbo.Magacin
INSTEAD OF DELETE AS
BEGIN
	SET NOCOUNT ON;
	UPDATE mgc SET mgc.OperativnoStanje = 0
	FROM dbo.Magacin AS mgc
	INNER JOIN deleted as d
	ON mgc.MagacinID = d.MagacinID;
END;
GO


DELETE FROM dbo.Magacin WHERE MagacinID = 3;
SELECT * FROM dbo.Magacin;
GO
