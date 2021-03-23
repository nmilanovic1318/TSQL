USE [master]
GO

/****** Object:  Database [SQLProgramiranjeProjekat]    Script Date: 1/23/2021 12:49:01 AM ******/
CREATE DATABASE [SQLProgramiranjeProjekat]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SQLProgramiranjeProjekat', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SQLProgramiranjeProjekat.mdf' , SIZE = 20480KB , MAXSIZE = UNLIMITED, FILEGROWTH = 15%)
 LOG ON 
( NAME = N'SQLProgramiranjeProjekat_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\SQLProgramiranjeProjekat_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SQLProgramiranjeProjekat].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET ARITHABORT OFF 
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET  DISABLE_BROKER 
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET RECOVERY FULL 
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET  MULTI_USER 
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET DB_CHAINING OFF 
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET QUERY_STORE = OFF
GO

ALTER DATABASE [SQLProgramiranjeProjekat] SET  READ_WRITE 
GO

USE SQLProgramiranjeProjekat;
GO

CREATE TABLE dbo.ErrorData(

	ErrorID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	ErrorTime datetime NOT NULL DEFAULT (GETDATE()),
	ErrorNumber int NOT NULL,
	ErrorSeverity int NOT NULL,
	ErrorState int NULL,
	ErrorProcedure nvarchar(126) NULL,
	ErrorLine int NOT NULL,
	ErrorMessage nvarchar(1000) NULL,
	Username nvarchar(50) NULL DEFAULT (SUSER_NAME()),
	Resolved bit NULL DEFAULT (0)

);
GO

USE [SQLProgramiranjeProjekat]
GO

/****** Object:  Table [dbo].[Magacin]    Script Date: 1/25/2021 3:18:47 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Magacin](
	[MagacinID] [int] IDENTITY(1,1) NOT NULL,
	[Površina] [float] NOT NULL,
	[OperativnoStanje] [bit] NOT NULL,
	[Adresa] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Magacin] PRIMARY KEY CLUSTERED 
(
	[MagacinID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [SQLProgramiranjeProjekat]
GO

/****** Object:  Table [dbo].[Kupac]    Script Date: 1/25/2021 4:11:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Kupac](
	[BrojKupca] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](30) NOT NULL,
	[Prezime] [nvarchar](40) NOT NULL,
	[AdresaKupca] [nvarchar](50) NOT NULL,
	[BrojTelefonaKupca] [nvarchar](20) NOT NULL,
	[Grad] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Kupac] PRIMARY KEY CLUSTERED 
(
	[BrojKupca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [SQLProgramiranjeProjekat]
GO

/****** Object:  Table [dbo].[Zaposleni]    Script Date: 1/25/2021 3:22:33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Zaposleni](
	[ZaposleniID] [int] IDENTITY(1,1) NOT NULL,
	[Ime] [nvarchar](30) NOT NULL,
	[Prezime] [nvarchar](40) NOT NULL,
	[Adresa] [nvarchar](50) NOT NULL,
	[BrojTelefona] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Zaposleni] PRIMARY KEY CLUSTERED 
(
	[ZaposleniID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


USE [SQLProgramiranjeProjekat]
GO

/****** Object:  Table [dbo].[Kategorija]    Script Date: 1/25/2021 3:18:23 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Kategorija](
	[KategorijaID] [int] IDENTITY(1,1) NOT NULL,
	[NazivKategorije] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_Kategorija] PRIMARY KEY CLUSTERED 
(
	[KategorijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

USE [SQLProgramiranjeProjekat]
GO

/****** Object:  Table [dbo].[Dobavljač]    Script Date: 1/25/2021 3:17:35 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dobavljač](
	[DobavljačID] [int] IDENTITY(1,1) NOT NULL,
	[NazivDobavljača] [nvarchar](50) NOT NULL,
	[BrojTelefonaDobavljača] [nvarchar](20) NOT NULL,
	[AdresaDobavljača] [nvarchar](50) NOT NULL,
	[TipRobe] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_Dobavljač] PRIMARY KEY CLUSTERED 
(
	[DobavljačID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO




USE [SQLProgramiranjeProjekat]
GO

/****** Object:  Table [dbo].[Artikal]    Script Date: 1/25/2021 6:26:28 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Artikal](
	[BrojArtikla] [int] IDENTITY(1,1) NOT NULL,
	[NazivArtikla] [nvarchar](50) NOT NULL,
	[Širina] [float] NOT NULL,
	[Visina] [float] NOT NULL,
	[Težina] [float] NOT NULL,
	[DobavljačID] [int] NOT NULL,
	[MagacinID] [int] NOT NULL,
	[Cena] [float] NOT NULL,
	[KategorijaID] [int] NOT NULL,
	[Dužina] [float] NOT NULL,
 CONSTRAINT [PK_Artikal] PRIMARY KEY CLUSTERED 
(
	[BrojArtikla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Artikal]  WITH CHECK ADD  CONSTRAINT [FK_Artikal_Dobavljač] FOREIGN KEY([DobavljačID])
REFERENCES [dbo].[Dobavljač] ([DobavljačID])
GO

ALTER TABLE [dbo].[Artikal] CHECK CONSTRAINT [FK_Artikal_Dobavljač]
GO

ALTER TABLE [dbo].[Artikal]  WITH CHECK ADD  CONSTRAINT [FK_Artikal_Kategorija] FOREIGN KEY([KategorijaID])
REFERENCES [dbo].[Kategorija] ([KategorijaID])
GO

ALTER TABLE [dbo].[Artikal] CHECK CONSTRAINT [FK_Artikal_Kategorija]
GO

ALTER TABLE [dbo].[Artikal]  WITH CHECK ADD  CONSTRAINT [FK_Artikal_Magacin] FOREIGN KEY([MagacinID])
REFERENCES [dbo].[Magacin] ([MagacinID])
GO

ALTER TABLE [dbo].[Artikal] CHECK CONSTRAINT [FK_Artikal_Magacin]
GO


USE [SQLProgramiranjeProjekat]
GO

/****** Object:  Table [dbo].[Faktura]    Script Date: 1/25/2021 3:18:07 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Faktura](
	[BrojFakture] [int] IDENTITY(1,1) NOT NULL,
	[BrojKupca] [int] NOT NULL,
	[Datum] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Faktura] PRIMARY KEY CLUSTERED 
(
	[BrojFakture] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Faktura]  WITH CHECK ADD  CONSTRAINT [FK_Faktura_Kupac] FOREIGN KEY([BrojKupca])
REFERENCES [dbo].[Kupac] ([BrojKupca])
GO

ALTER TABLE [dbo].[Faktura] CHECK CONSTRAINT [FK_Faktura_Kupac]
GO

USE [SQLProgramiranjeProjekat]
GO

/****** Object:  Table [dbo].[Reklamacija]    Script Date: 1/25/2021 3:19:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Reklamacija](
	[ReklamacijaID] [int] IDENTITY(1,1) NOT NULL,
	[BrojFakture] [int] NOT NULL,
	[OpisReklamacije] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Reklamacija] PRIMARY KEY CLUSTERED 
(
	[ReklamacijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Reklamacija]  WITH CHECK ADD  CONSTRAINT [FK_Reklamacija_Faktura] FOREIGN KEY([BrojFakture])
REFERENCES [dbo].[Faktura] ([BrojFakture])
GO

ALTER TABLE [dbo].[Reklamacija] CHECK CONSTRAINT [FK_Reklamacija_Faktura]
GO

USE [SQLProgramiranjeProjekat]
GO

/****** Object:  Table [dbo].[Reklamacija]    Script Date: 1/25/2021 3:19:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [SQLProgramiranjeProjekat]
GO

/****** Object:  Table [dbo].[StavkeFakture]    Script Date: 1/25/2021 3:20:02 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[StavkeFakture](
	[BrojStavke] [int] IDENTITY(1,1) NOT NULL,
	[BrojFakture] [int] NOT NULL,
	[BrojArtikla] [int] NOT NULL,
	[Količina] [int] NOT NULL,
 CONSTRAINT [PK_StavkeFakture] PRIMARY KEY CLUSTERED 
(
	[BrojStavke] ASC,
	[BrojFakture] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[StavkeFakture]  WITH CHECK ADD  CONSTRAINT [FK_StavkeFakture_Artikal] FOREIGN KEY([BrojArtikla])
REFERENCES [dbo].[Artikal] ([BrojArtikla])
GO

ALTER TABLE [dbo].[StavkeFakture] CHECK CONSTRAINT [FK_StavkeFakture_Artikal]
GO

ALTER TABLE [dbo].[StavkeFakture]  WITH CHECK ADD  CONSTRAINT [FK_StavkeFakture_Faktura] FOREIGN KEY([BrojFakture])
REFERENCES [dbo].[Faktura] ([BrojFakture])
GO

ALTER TABLE [dbo].[StavkeFakture] CHECK CONSTRAINT [FK_StavkeFakture_Faktura]
GO

USE [SQLProgramiranjeProjekat]
GO

/****** Object:  Table [dbo].[Dostava]    Script Date: 1/25/2021 3:17:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Dostava](
	[DostavaID] [int] IDENTITY(1,1) NOT NULL,
	[BrojFakture] [int] NOT NULL,
	[DatumDostave] [datetime2](7) NOT NULL,
	[ZaposleniID] [int] NOT NULL,
 CONSTRAINT [PK_Dostava] PRIMARY KEY CLUSTERED 
(
	[DostavaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Dostava]  WITH CHECK ADD  CONSTRAINT [FK_Dostava_Faktura] FOREIGN KEY([BrojFakture])
REFERENCES [dbo].[Faktura] ([BrojFakture])
GO

ALTER TABLE [dbo].[Dostava] CHECK CONSTRAINT [FK_Dostava_Faktura]
GO

ALTER TABLE [dbo].[Dostava]  WITH CHECK ADD  CONSTRAINT [FK_Dostava_Zaposleni] FOREIGN KEY([ZaposleniID])
REFERENCES [dbo].[Zaposleni] ([ZaposleniID])
GO

ALTER TABLE [dbo].[Dostava] CHECK CONSTRAINT [FK_Dostava_Zaposleni]
GO

USE [SQLProgramiranjeProjekat]
GO

/****** Object:  Table [dbo].[Model]    Script Date: 1/25/2021 3:19:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [SQLProgramiranjeProjekat]
GO

/****** Object:  Table [dbo].[Podkategorija]    Script Date: 1/25/2021 3:19:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Podkategorija](
	[PodkategorijaID] [int] IDENTITY(1,1) NOT NULL,
	[NazivPodkategorije] [nvarchar](40) NOT NULL,
	[KategorijaID] [int] NOT NULL,
 CONSTRAINT [PK_Podkategorija] PRIMARY KEY CLUSTERED 
(
	[PodkategorijaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Podkategorija]  WITH CHECK ADD  CONSTRAINT [FK_Podkategorija_Kategorija] FOREIGN KEY([KategorijaID])
REFERENCES [dbo].[Kategorija] ([KategorijaID])
GO

ALTER TABLE [dbo].[Podkategorija] CHECK CONSTRAINT [FK_Podkategorija_Kategorija]
GO




CREATE TABLE [dbo].[Model](
	[ModelID] [int] IDENTITY(1,1) NOT NULL,
	[NazivModela] [nvarchar](40) NOT NULL,
	[PodkategorijaID] [int] NOT NULL,
 CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED 
(
	[ModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Model]  WITH CHECK ADD  CONSTRAINT [FK_Model_Podkategorija] FOREIGN KEY([PodkategorijaID])
REFERENCES [dbo].[Podkategorija] ([PodkategorijaID])
GO

ALTER TABLE [dbo].[Model] CHECK CONSTRAINT [FK_Model_Podkategorija]
GO

-- INSERT NAREDBE


use SQLProgramiranjeProjekat;
GO
INSERT dbo.Magacin (Površina, OperativnoStanje, Adresa) 
VALUES
(500, 1, 'Savska 10'),
(300, 1, 'Durmitorska 13'),
(400, 1, 'Hercegovačka 10'),
(300, 0, 'Miloša Pocerca 21')

--SELECT * FROM dbo.Magacin;

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


use SQLProgramiranjeProjekat;
GO
INSERT dbo.Zaposleni (Ime, Prezime, Adresa, BrojTelefona) 
VALUES
('Nikola', 'Miškov', 'Molerova 7', +38161999888),
('Petar', 'Jeremić', 'Kralja Milutina 10', +38161888999),
('Vladimir', 'Grujić', 'Dubljanska 7', +38161666555),
('Stefan', 'Marković', 'Niška 8', +38161444333),
('Igor', 'Kamaljević', 'Požarevačka 10', +38161777444),
('Đorđe', 'Paunović', 'Bosanska 15', +38161888111)

--SELECT * FROM dbo.Zaposleni;

use SQLProgramiranjeProjekat;
GO
INSERT dbo.Kategorija(NazivKategorije) 
VALUES 
('Spavaća soba'),
('Kupatilo'),
('Radna soba'),
('Dnevna soba'),
('Trpezarija'),
('Odlaganje'),
('Zavese'),
('Bašta'),
('Pokućstvo')

--SELECT * FROM dbo.Kategorija;

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


USE SQLProgramiranjeProjekat;
GO
INSERT dbo.Artikal (NazivArtikla, Širina, Visina, Težina, DobavljačID, MagacinID, Cena, KategorijaID, Dužina) 
VALUES 
('Dušek BASIC F5', 90, 9, 3, 1, 2, 2750, 1, 200),
('Dušek BASIC F10', 80, 7, 2.8, 1, 3, 3500, 1, 200),
('Dušek PLUS F40', 90, 12.5, 7, 1, 4, 8000, 1, 200),
('Dušek BASIC F15', 60, 7, 1.3, 1, 1, 4500, 1, 190),
('Dušek GOLD F70', 80, 20, 14.1, 1, 3, 17000, 1, 200),
('Orman DAMHAUS 60x150', 60, 150, 2, 2, 1, 1350, 6, 65),
('Orman DAMHAUS 100x174', 100, 174, 4, 2, 2, 2500, 6, 75),
('Orman DAMHAUS 149x174', 149, 174, 5, 2, 3, 3000, 6, 99),
('Gejmerska stolica HARLEV', 58, 109, 12, 3, 3, 9500, 3, 63),
('Gejmerska stolica SNERTINGE', 59, 125, 15, 4, 2, 11000, 3, 62),
('Kanc. stolica HARLEV', 57, 101, 13, 3, 4, 7000, 3, 64),
('Radni sto GELSTED', 60, 84, 9, 6, 2, 7500, 3, 120),
('Radni sto GELSTED 54x120', 54, 75, 35, 6, 1, 9000, 3, 128),
('Radni sto GELSTED 60x120', 60, 74, 13, 6, 3, 8500, 3, 120),
('Fotelja TUNE vešt. koža', 67, 92, 6, 7, 1, 8999, 4, 78),
('Fotelja TUNE krem', 67, 92, 6, 7, 1, 7000, 4, 78),
('Dvosed EGENSE tam. siva', 142, 80, 33, 8, 3, 39999, 4, 115),
('Dvosed EGENSE sv. siva', 142, 80, 33, 8, 3, 39999, 4, 115),
('Trosed EGENSE sv. siva', 200, 80, 55, 8, 1, 35000, 4, 174),
('Trosed EGENSE tam. siva', 200, 80, 55, 8, 1, 35000, 4, 174),
('Garnitura EGENSE sv. siva', 228, 80, 81, 8, 2, 43500, 4, 141),
('Polica KAGSTRUP 1', 80, 40, 8, 9, 4, 3500, 4, 86),
('Polica KAGSTRUP', 80, 40, 10, 9, 4, 4000, 4, 83),
('AABENRAA D120', 80, 75, 13, 12, 1, 29999, 5, 120),
('AABENRAA D160', 90, 75, 13, 12, 2, 32999, 5, 160),
('AABENRAA KOKKEDAL', 80, 75, 13, 12, 1, 46999, 5, 120),
('Bašt. stolica GUDHJEM natur', 55, 94, 5, 10, 3, 3000, 8, 63),
('Bašt. stolica GUDHJEM braon', 55, 94, 5, 10, 2, 3500, 8, 63),
('Bašt. stolica GUDHJEM crna', 55, 94, 5, 10, 1, 3000, 8, 63),
('Bašt. stolica GUDHJEM siva', 55, 94, 5, 10, 3, 3000, 8, 63),
('Bašt. stolica GUDHJEM siva', 55, 94, 5, 10, 4, 3000, 8, 63),
('Peškir KARLSTAD 50x100 sv. crvena', 50, 0.5, 0.05, 11, 1, 360, 2, 100),
('Peškir KARLSTAD 50x100 crvena', 50, 0.5, 0.05, 11, 1, 360, 2, 100),
('Peškir KARLSTAD 50x100 šljiva', 50, 0.5, 0.05, 11, 1, 360, 2, 100),
('Peškir KARLSTAD 50x100 bež', 50, 0.5, 0.05, 11, 1, 360, 2, 100),
('Peškir KARLSTAD 50x100 tam. siva', 50, 0.5, 0.05, 11, 1, 360, 2, 100),
('Peškir KARLSTAD 50x100 braon', 50, 0.5, 0.05, 11, 3, 360, 2, 100),
('Peškir KARLSTAD 100x150', 100, 0.5, 0.5, 11, 3, 1080, 2, 150),
('Polica za obuću HALS 2', 92, 39, 3, 13, 3, 1750, 6, 35),
('Polica za obuću HALS 4', 82, 78, 5, 13, 1, 3500, 6, 35),
('Roletna SENJA 45x170 bež', 45, 170, 0.17, 14, 2, 850, 7, 120),
('Roletna SENJA 45x170 pesak', 45, 170, 0.17, 14, 2, 850, 7, 120),
('Roletna SENJA 45x170 siva', 45, 170, 0.17, 14, 2, 850, 7, 120),
('Roletna SENJA 45x170 bež', 45, 170, 0.17, 14, 2, 850, 7, 120),
('Ćebe STENROS 130x170 siva', 130, 0.05, 0.50, 15, 2, 2000, 9, 170),
('Ćebe STENROS 130x170 zelena', 130, 0.05, 0.50, 15, 2, 2000, 9, 170),
('Ćebe STENROS 130x170 bela', 130, 0.05, 0.50, 15, 2, 2000, 9, 170),
('Ćebe LOTUS 135x195 braon', 135, 0.05, 0.50, 16, 4, 1900, 9, 195),
('Ćebe LOTUS 135x195 siva', 135, 0.05, 0.50, 16, 4, 1900, 9, 195),
('Ćebe LOTUS 135x195 bela', 135, 0.05, 0.50, 16, 4, 1900, 9, 195);

-- SELECT * FROM dbo.Artikal;

use SQLProgramiranjeProjekat;
GO
INSERT dbo.Faktura (BrojKupca, Datum)
VALUES
(7, '2021-01-25 11:25:00'),
(7, '2021-01-24 11:10:22'),
(7, '2021-01-22 16:33:21'),
(7, '2021-01-20 14:43:33'),
(7, '2021-01-15 13:23:21'),
(7, '2021-01-14 10:22:53'),
(6, '2021-01-21 13:20:51'),
(6, '2021-01-18 12:21:55'),
(6, '2021-01-16 13:15:22'),
(5, '2021-01-20 12:15:26'),
(5, '2021-01-16 10:15:23'),
(5, '2021-01-13 19:15:26'),
(1, '2021-01-17 09:27:31'),
(1, '2021-01-12 11:23:25'),
(2, '2021-01-15 14:41:34'),
(2, '2021-01-12 19:55:59'),
(2, '2021-01-11 13:37:37'),
(3, '2021-01-13 12:17:20'),
(3, '2021-01-12 11:25:37'),
(3, '2021-01-10 09:04:44'),
(8, '2021-01-10 10:16:31'),
(8, '2021-01-09 08:12:29'),
(8, '2021-01-08 13:16:24'),
(9, '2021-01-07 17:16:32'),
(9, '2021-01-04 18:16:24'),
(9, '2021-01-05 16:16:32'),
(4, '2021-01-05 06:21:34'),
(4, '2021-01-02 08:15:54'),
(4, '2021-01-05 09:25:31'),
(10, '2021-01-02 07:25:25'),
(10, '2021-01-03 09:13:53'),
(10, '2021-01-05 11:21:16'),
(11, '2021-01-04 20:21:20'),
(11, '2021-01-05 18:21:36'),
(12, '2021-01-06 18:13:54'),
(12, '2021-01-07 16:12:52'),
(13, '2021-01-07 11:21:34'),
(13, '2021-01-07 11:50:52'),
(14, '2021-01-25 16:21:16'),
(14, '2021-01-20 12:59:55'),
(15, '2021-01-16 14:45:31'),
(15, '2021-01-11 08:33:31'),
(16, '2021-01-17 15:56:48'),
(16, '2021-01-10 10:34:53'),
(17, '2021-01-22 18:57:21'),
(17, '2021-01-23 19:52:33'),
(17, '2021-01-18 14:22:16'),
(18, '2021-01-10 10:16:23'),
(18, '2021-01-11 12:33:52'),
(18, '2021-01-03 07:15:22'),
(19, '2021-01-25 20:55:52');

--SELECT * FROM dbo.Faktura;

USE SQLProgramiranjeProjekat;
GO
INSERT dbo.Reklamacija (BrojFakture, OpisReklamacije)
VALUES
(19, 'Dušek stigao u oštećenom stanju, deo postavke pocepan.'),
(29, 'Polica stigla bez dovoljnog broja šrafova za montiranje.'),
(34, 'Fotelja stigla sa polomljenom nogom.'),
(31, 'Poručene stolice sive boje, dostavljene stolice crne boje.'),
(42, 'Isporučeno ćebe pogrešnih dimenzija.'),
(30, 'Dvosed stigao bez jastuka za naslon.');

--SELECT * FROM dbo.Reklamacija;

USE SQLProgramiranjeProjekat;
GO
INSERT dbo.StavkeFakture (BrojFakture, BrojArtikla, Količina)
VALUES
(1, 1, 1),
(2, 6, 1),
(3, 11, 1),
(4, 13, 1),
(5, 15, 1),
(6, 17, 1),
(7, 42, 1),
(8, 33, 1),
(9, 50, 3),
(10, 40, 2),
(11, 23, 2),
(12, 18, 1),
(13, 7, 1),
(14, 14, 1),
(15, 31, 4),
(16, 44, 5),
(17, 24, 1),
(18, 15, 2),
(19, 27, 4),
(20, 39, 2),
(21, 17, 1),
(21, 3, 2),
(22, 10, 1),
(23, 45, 1),
(24, 46, 1),
(24, 47, 1),
(24, 48, 1),
(25, 1, 1),
(25, 33, 1),
(25, 34, 1),
(25, 47, 2),
(26, 39, 1),
(27, 3, 1),
(27, 5, 1),
(28, 20, 1),
(29, 38, 2),
(29, 46, 3),
(30, 1, 3),
(30, 6, 1),
(31, 12, 1),
(32, 14, 1),
(32, 9, 1),
(33, 18, 1),
(34, 31, 4),
(35, 21, 1),
(36, 28, 4),
(37, 6, 2),
(38, 50, 3),
(39, 27, 4),
(40, 15, 2),
(40, 14, 1),
(41, 8, 1),
(41, 13, 1),
(42, 28, 4),
(43, 38, 1),
(43, 37, 1),
(43, 36, 1),
(44, 40, 1),
(45, 25, 1),
(45, 22, 1),
(46, 1, 1),
(46, 10, 1),
(46, 14, 1),
(46, 7, 1),
(47, 16, 1),
(48, 45, 2),
(49, 42, 4),
(50, 20, 1),
(50, 29, 2),
(51, 30, 2),
(51, 8, 1);

--SELECT * FROM dbo.StavkeFakture;

use SQLProgramiranjeProjekat;
GO
INSERT dbo.Dostava (BrojFakture, DatumDostave, ZaposleniID) 
VALUES
(21, '2021-01-23 12:25:37', 3),
(22, '2021-01-22 13:37:33', 6),
(23, '2021-01-16 10:20:25', 2),
(33, '2021-01-17 14:43:27', 1),
(34, '2021-01-15 16:13:37', 2),
(48, '2021-01-05 11:13:23', 4),
(49, '2021-01-07 13:20:25', 5),
(50, '2021-01-06 16:33:21', 1),
(11, '2021-01-21 15:55:34', 5),
(13, '2021-01-14 14:44:13', 6);

-- SELECT * FROM dbo.Dostava;


USE SQLProgramiranjeProjekat;
GO
INSERT dbo.Podkategorija (NazivPodkategorije, KategorijaID) 
VALUES
('Dušeci', 1),
('Ormani', 6),
('Gejming stolice', 3),
('Kancelarijske stolice', 3),
('Radni stolovi', 3),
('Fotelja', 4),
('Kauči', 4),
('Polični elementi', 4),
('Baštenske stolice', 8),
('Peškiri', 2),
('Trpezarijska garnitura', 5),
('Cipelarnik', 6),
('Roletne', 7),
('Ćebad', 9);

--SELECT * FROM dbo.Podkategorija;

USE SQLProgramiranjeProjekat;
GO
INSERT dbo.Model (NazivModela, PodkategorijaID)
VALUES
('Basic', 1),
('Plus', 1),
('Gold', 3),
('Basic', 2),
('Plus', 2),
('Basic', 4),
('Plus', 4),
('Gold', 4),
('Basic', 10),
('Plus', 10),
('Gold', 10),
('Deciji', 10),
('Za lice', 10),
('Dnevne', 13),
('Duo', 13),
('Panel', 13),
('Za zamračivanje', 13)

--SELECT * FROM dbo.Model;














