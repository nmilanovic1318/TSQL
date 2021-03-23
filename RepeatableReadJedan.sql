
-- Skripta simulira korišćenje podataka sa izolacionim nivoom podešenim na Repeatable Read zajedno sa skriptom RepeatableReadDva

--1: Prvi korisnik pristupa bazi podataka i pokreće transakciju koja ima podešen nivo izolacije Repeatable Read; za lakšu simulaciju, korišćena je funkcija WAITFOR DELAY koja pravi pauzu između izvršavanja naredbi

USE SQLProgramiranjeProjekat;
GO

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ;
GO

BEGIN TRANSACTION

SELECT * FROM Zaposleni;

WAITFOR DELAY '00:00:10'

SELECT * FROM Zaposleni;

WAITFOR DELAY '00:00:10'

SELECT * FROM Zaposleni;

COMMIT TRANSACTION

/*************************************************************************************************************************************

	Zbog odabranog nivoa izolacije, Repeatable Read, podaci se nakon čitanja "zaključavaju", odnosno ne mogu se menjati. Međutim, moguće je ubaciti nove redove u tabelu koju Repeatable Read transakcija čita. Zbog ovoga, kada ubacimo novi red, nakon druge SELECT naredbe u transakciji, videćemo novu vrednost u tabeli. Međutim, čak i kada obrišemo red uz pomoć DELETE naredbe, poslednja SELECT naredba će i dalje pročitati vrednost tog reda jer je bio "zaključan", što rezultuje u tzv. "phantom read-u".

*************************************************************************************************************************************/
