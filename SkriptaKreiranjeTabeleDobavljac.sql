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


