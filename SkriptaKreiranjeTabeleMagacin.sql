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


