USE SQLProgramiranjeProjekat;
GO

/*************************************************************************************************************************************************************

	DDL Trigger koji zabranjuje brisanje tabela na nivou baze podataka; ako neko pokuša da iskoristi drop table komandu, umesto brisanja tabele će dobiti grešku sa porukom o tome da brisanje tabela nije dozvoljeno.

*************************************************************************************************************************************************************/

CREATE OR ALTER TRIGGER TR_ZabranaBrisanjaTabela
	ON DATABASE
	FOR DROP_TABLE
AS
	SET NOCOUNT ON;
	RAISERROR('Brisanje tabela nije dozvoljeno!', 16, 1);
	ROLLBACK TRANSACTION;
GO

DROP TABLE IF EXISTS dbo.ErrorData;

