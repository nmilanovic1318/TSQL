use SQLProgramiranjeProjekat;
GO
INSERT dbo.Kupac(Ime, Prezime, AdresaKupca, BrojTelefonaKupca, Grad)
VALUES
('Milutin', 'Vinulović', 'Kneza Bogosava 15', +38163111222, 'Beograd'),
('Milica', 'Jovetić', 'Ljube Čupe 6', +38163333444, 'Beograd'),
('Miodrag', 'Sretenović', 'Podravska 7', +38163222333, 'Beograd'),
('Nenad', 'Kojić', 'Kisačka 8', +38163555666, 'Novi Sad'),
('Aleksandar', 'Petrović', 'Bulevar Kralja Petra 2', +38163666777, 'Novi Sad'),
('Stefan', 'Krunić', 'Karađorđeva 14', +38163999888, 'Valjevo'),
('Anđela', 'Tešić', 'Čika Ljubina 12', +38163777888, 'Valjevo'),
('Uroš', 'Katić', 'Jug Bogdanova 13', +38163999888, 'Kraljevo'),
('David', 'Arsenijević', 'Cara Dušana 20', +38163666111, 'Kraljevo'),
('Marija', 'Petković', 'Moše Pijade 15', +38163111333, 'Kraljevo'),
('Petar', 'Petrović', 'Šumadijska 10', +38163111444, 'Niš'),
('Saša', 'Matić', 'Banjalučka 14', +38163111555, 'Niš'),
('Danijel', 'Lukić', 'Cetinsjka 16', +38163111777, 'Niš'),
('Ivana', 'Ivanović', 'Đurđinska 7', +38163111888, 'Subotica'),
('Jelena', 'Stević', 'Zadarska 5', +38163111999, 'Subotica'),
('Tamara', 'Milosavljević', 'Sonje Marinković 5', +38163222999, 'Subotica'),
('Miloš', 'Milošević', 'Takovska 13', +38163333999, 'Čačak'),
('Slobodan', 'Vučić', 'Radisava Gavrilovića 18', +38163444888, 'Čačak'),
('Lazar', 'Matić', 'Radiše Živkovića 12', +38163845621, 'Čačak'),
('Mitar', 'Radanović', 'Balkanska 3', +38163432621, 'Novi sad');

--SELECT * FROM dbo.Kupac;