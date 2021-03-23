-- 1: Prva skripta pristupa bazi
USE SQLProgramiranjeProjekat;
GO

-- 2: Započinje prva transakcija
BEGIN TRAN;

UPDATE dbo.StavkeFakture
SET Količina += 1
WHERE BrojArtikla = 6;

-- 5: Prva transakcija pokušava da pristupi podacima koji su zaključani od strane druge transakcije
SELECT NazivArtikla, BrojArtikla, Cena
FROM dbo.Artikal
WHERE BrojArtikla = 6;

COMMIT TRAN;
GO
