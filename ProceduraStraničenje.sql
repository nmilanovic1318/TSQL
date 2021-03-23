USE SQLProgramiranjeProjekat;
GO

/*****************************************************************************************************************************************

	Kreira se procedura sa imenom Paging za svrhu straničenja rezultata upita. Ima dva ulazna parametra - @brojStrane tipa int, kao i @brojRedova tipa int.
		U telu procedure je deklarisan parametar @preskoci, koji je takođe tipa int. On uzima vrednost za jedan manju od parametra @brojStrane, i množi se sa unetim brojem redova (koji ima početnu vrednost 10, koja će biti iskorišćena ako korisnik ne unese drugi broj). Na ovaj način, pomoću parametara možemo kontrolisati koliko redova će biti preskočeno, a koliko prikazano nakon toga.

*****************************************************************************************************************************************/

CREATE PROC Paging(

	@brojStrane int = 1,
	@brojRedova int = 10

)
AS
BEGIN
DECLARE @preskoci int = (@brojStrane - 1) * @brojRedova
SELECT *
FROM dbo.Artikal
ORDER BY Artikal.Cena DESC
OFFSET @preskoci ROW FETCH FIRST @brojRedova ROWS ONLY
END;
GO

--Korišćenje procedure
EXEC Paging 1, 15
GO