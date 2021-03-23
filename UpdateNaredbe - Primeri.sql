USE SQLProgramiranjeProjekat;
GO
-- Update komanda koja služi za ažuriranje trenutnog grada kupca 

UPDATE dbo.Kupac SET Grad = 'Beograd' WHERE BrojKupca = 19;
GO

-- Update komanda koja služi za ažuriranje broja telefona zaposlenog radnika 

UPDATE dbo.Zaposleni SET BrojTelefona = '+38112345678' WHERE ZaposleniID = 2;
GO

-- Update komanda koja služi za podešavanje cene traženih artikala (na primer, ukoliko je potrebno na određene artikle primeniti sniženje - u ovom slučaju, popust bi bio primenjen na artikle iz kategorije spavaća soba)

UPDATE dbo.Artikal SET Cena = (Cena * 0.7) WHERE KategorijaID = 1;
GO

