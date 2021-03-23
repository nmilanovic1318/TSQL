USE SQLProgramiranjeProjekat;
GO
-- Komanda za brisanje zaposlenog iz tabele (u slučaju da zaposleni prestaje sa radom) 
DELETE FROM dbo.Zaposleni WHERE ZaposleniID = 5;
-- Komanda za brisanje svih artikla kojima je cena ispod nule (ukoliko su uneti greškom) 
DELETE FROM dbo.Artikal WHERE Cena < 0;
-- Komanda za brisanje dobavljača iz baze podataka ukoliko se sa istim prekida radni odnos 
DELETE FROM dbo.Dobavljač WHERE DobavljačID = 3;