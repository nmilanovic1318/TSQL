USE SQLProgramiranjeProjekat;
GO

CREATE TABLE dbo.ErrorData(

	ErrorID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	ErrorTime datetime NOT NULL DEFAULT (GETDATE()),
	ErrorNumber int NOT NULL,
	ErrorSeverity int NOT NULL,
	ErrorState int NULL,
	ErrorProcedure nvarchar(126) NULL,
	ErrorLine int NOT NULL,
	ErrorMessage nvarchar(1000) NULL,
	Username nvarchar(50) NULL DEFAULT (SUSER_NAME()),
	Resolved bit NULL DEFAULT (0)

);
GO