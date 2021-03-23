USE [SQLProgramiranjeProjekat]
GO

/****** Object:  Table [dbo].[Model]    Script Date: 1/25/2021 3:19:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Model](
	[ModelID] [int] IDENTITY(1,1) NOT NULL,
	[NazivModela] [nvarchar](40) NOT NULL,
	[PodkategorijaID] [int] NOT NULL,
 CONSTRAINT [PK_Model] PRIMARY KEY CLUSTERED 
(
	[ModelID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Model]  WITH CHECK ADD  CONSTRAINT [FK_Model_Podkategorija] FOREIGN KEY([PodkategorijaID])
REFERENCES [dbo].[Podkategorija] ([PodkategorijaID])
GO

ALTER TABLE [dbo].[Model] CHECK CONSTRAINT [FK_Model_Podkategorija]
GO


