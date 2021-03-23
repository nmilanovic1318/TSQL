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


