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


