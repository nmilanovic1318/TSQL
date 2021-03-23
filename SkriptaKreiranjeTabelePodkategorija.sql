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


