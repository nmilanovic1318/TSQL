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


