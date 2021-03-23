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


