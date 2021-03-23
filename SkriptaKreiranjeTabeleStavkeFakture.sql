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


