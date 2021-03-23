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


