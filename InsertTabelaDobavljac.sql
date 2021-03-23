use SQLProgramiranjeProjekat;
GO
INSERT dbo.Dobavljač (NazivDobavljača, BrojTelefonaDobavljača, AdresaDobavljača, TipRobe) 
VALUES 
('Dreamzone', 061111222, 'Čarlija Čaplina 14', 'Dušeci'),
('DAMHUS', 061222333, 'Starine Novaka 12', 'Ormani'),
('HARLEV', 061333444, 'Veljka Dugoševića 16', 'Gejming stolice'),
('SNERTINGE', 061444555, 'Nikole Tesle 17', 'Gejming stolice'),
('DALMOSE', 061555666, 'Višnjička 12', 'Kancelarijske stolice'),
('GELSTED', 061666777, 'Vojvode Micka Krstića 15', 'Radni stolovi'),
('TUNE', 061777888, 'Porečka 12', 'Fotelja'),
('EGENSE', 061888999, 'Jahorinska 9', 'Kauči'),
('KAGSTRUP', 062111222, 'Đorđa Vajferta 10', 'Polični elementi'),
('GUDHJEM', 062222333, 'Vardarska 14', 'Baštenske stolice'),
('KARLSTAD', 062333444, 'Dubljanska 7', 'Peškiri'),
('AABENRAA', 062444555, 'Sazonova 3', 'Trpezarijska garnitura'),
('HALS', 062555666, 'Žička 8', 'Cipelarnik'),
('SENJA', 062666777, 'Rtanjska 18', 'Roletne'),
('STENROS', 062777888, 'Tetovska 2', 'Ćebad'),
('LOTUS', +3815213684, 'Vodovodska 13', 'Ćebad');

--SELECT * FROM dbo.Dobavljač;