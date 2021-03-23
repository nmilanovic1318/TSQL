-- Skripta simulira korišćenje podataka sa izolacionim nivoom podešenim na Repeatable Read zajedno sa skriptom RepeatableReadJedan

USE SQLProgramiranjeProjekat;
GO

-- 2: Kada je u prvoj skripti pokrenuta Repeatable Read transakcija, drugi korisnik koristi INSERT naredbu koja ubacuje novi red u tabelu koja se čita

INSERT Zaposleni (Ime, Prezime, Adresa, BrojTelefona) VALUES ('Probni', 'Zaposleni', 'Molerova 15', '061746421');

--3: Nakon ubacivanja reda u tabelu zaposleni, kada prođe 10 sekundi, drugi korisnik koristi DELETE naredbu da obriše red koji je uneo

DELETE FROM Zaposleni WHERE Ime = 'Probni' AND Prezime = 'Zaposleni';

SELECT * FROM Zaposleni; 

/*************************************************************************************************************************************

	Zbog odabranog nivoa izolacije, Repeatable Read, podaci se nakon čitanja "zaključavaju", odnosno ne mogu se menjati. Međutim, moguće je ubaciti nove redove u tabelu koju Repeatable Read transakcija čita. Zbog ovoga, kada ubacimo novi red, nakon druge SELECT naredbe u transakciji, videćemo novu vrednost u tabeli. Međutim, čak i kada obrišemo red uz pomoć DELETE naredbe, poslednja SELECT naredba će i dalje pročitati vrednost tog reda jer je bio "zaključan", što rezultuje u tzv. "phantom read-u".

*************************************************************************************************************************************/