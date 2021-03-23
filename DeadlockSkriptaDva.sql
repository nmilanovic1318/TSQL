
-- 3: Druga skripta pristupa bazi
USE SQLProgramiranjeProjekat;
GO

-- 4: Počinje druga transakcija
BEGIN TRAN;

UPDATE dbo.Artikal
SET Cena += 1.00
WHERE BrojArtikla = 6;


-- 6: Druga transakcija pokušava da pristupi podacima koje je prva transakcija zaključala
SELECT BrojStavke, Količina
FROM dbo.StavkeFakture
WHERE BrojArtikla = 6;

COMMIT TRAN;
GO



