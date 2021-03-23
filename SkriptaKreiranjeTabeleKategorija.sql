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

