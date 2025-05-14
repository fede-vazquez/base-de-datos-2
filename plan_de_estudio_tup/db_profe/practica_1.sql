declare @Id int;
-- Final, Parcial, Trabajo Práctico, Monografía
EXEC I_TipoEvaluacion @Id OUT, 'Final';
EXEC I_TipoEvaluacion @Id OUT, 'Parcial';
EXEC I_TipoEvaluacion @Id OUT, 'Trabajo';
EXEC I_TipoEvaluacion @Id OUT, 'Práctico';
EXEC I_TipoEvaluacion @Id OUT, 'Monografía';


-- ---------- Agregar mis notas de cada parcial. -------------

-- Modificar tabla Evaluación para que tenga la columna alumno_id
ALTER TABLE Evaluacion
ADD alumno_id int not null;

-- Agrega Clave foránea.
ALTER TABLE Evaluacion
ADD CONSTRAINT FK_Evaluacion_Alumno
FOREIGN KEY (alumno_id) REFERENCES Alumno(id);

-- Me agrega como alumno
declare @Id int;
Exec I_Alumno @Id OUT, 59, 1, 17772; 

select * from evaluacion;

-- Cambiar tabla Correlativas y agregarle tipo_correlativa.

drop table Correlativas;
create table Correlativas(
	id integer not null primary key identity(1,1),
	asignatura_id integer not null,
	correlativa_id integer not null,
	tipo_correlativa char(1) not null,
	check (tipo_correlativa in ('A', 'C')),
	foreign key (asignatura_id) references Asignatura(id),
	foreign key (correlativa_id) references Asignatura(id)
);
GO
create unique index uix_correlativas on Correlativas(asignatura_id, correlativa_id);

-- dropea lost Stored procedure de correlativa.
drop procedure I_Correlativas;
drop procedure U_Correlativas;
drop procedure D_Correlativas;
GO
-- Vuelve a crearlos:
exec Geninsert 'Correlativas';
exec Genupdate 'Correlativas';
exec Gendelete 'Correlativas';
GO
-- Insert
CREATE PROCEDURE I_Correlativas
    @ID INT OUTPUT
   ,@ASIGNATURA_ID INT
   ,@CORRELATIVA_ID INT
   ,@TIPO_CORRELATIVA CHAR(1)
AS
BEGIN
  BEGIN TRY
    INSERT INTO Correlativas
    (ASIGNATURA_ID ,CORRELATIVA_ID ,TIPO_CORRELATIVA)
    VALUES
    (@ASIGNATURA_ID ,@CORRELATIVA_ID ,@TIPO_CORRELATIVA)
     SET @ID = @@IDENTITY
  END TRY
  BEGIN CATCH
     EXECUTE GetErrorInfo
  END CATCH
END;
GO
-- Update

CREATE PROCEDURE U_Correlativas
    @ID INT = NULL
   ,@ASIGNATURA_ID INT = NULL
   ,@CORRELATIVA_ID INT = NULL
   ,@TIPO_CORRELATIVA CHAR(1) = NULL
AS
BEGIN
  BEGIN TRY
    UPDATE Correlativas SET
    ASIGNATURA_ID = ISNULL(@ASIGNATURA_ID, ASIGNATURA_ID)
   ,CORRELATIVA_ID = ISNULL(@CORRELATIVA_ID, CORRELATIVA_ID)
   ,TIPO_CORRELATIVA = ISNULL(@TIPO_CORRELATIVA, TIPO_CORRELATIVA)
    WHERE ID = ID
  END TRY
  BEGIN CATCH
     EXECUTE GetErrorInfo
  END CATCH
END;
GO
-- Delete

CREATE PROCEDURE D_Correlativas
@ID INTEGER
AS
BEGIN
  BEGIN TRY
    DELETE FROM Correlativas WHERE ID = @ID
  END TRY
  BEGIN CATCH
     EXECUTE GetErrorInfo
  END CATCH
END;
GO

-- inserta nuevamente las correlativas.
delete from Correlativas;
select * from Correlativas;
DECLARE @ID INT;

-- 5
EXEC I_Correlativas @ID OUTPUT, 5, 1, 'C';
EXEC I_Correlativas @ID OUTPUT, 5, 2, 'C';

-- 6
EXEC I_Correlativas @ID OUTPUT, 6, 3, 'C';

-- 7
EXEC I_Correlativas @ID OUTPUT, 7, 1, 'C';
EXEC I_Correlativas @ID OUTPUT, 7, 3, 'C';

-- 9
EXEC I_Correlativas @ID OUTPUT, 9, 5, 'C';
EXEC I_Correlativas @ID OUTPUT, 9, 7, 'C';
EXEC I_Correlativas @ID OUTPUT, 9, 1, 'A';

-- 10
EXEC I_Correlativas @ID OUTPUT, 10, 7, 'C';
EXEC I_Correlativas @ID OUTPUT, 10, 1, 'A';

-- 11
EXEC I_Correlativas @ID OUTPUT, 11, 5, 'C';
EXEC I_Correlativas @ID OUTPUT, 11, 7, 'C';
EXEC I_Correlativas @ID OUTPUT, 11, 1, 'A';
EXEC I_Correlativas @ID OUTPUT, 11, 4, 'A';

-- 12
EXEC I_Correlativas @ID OUTPUT, 12, 8, 'C';

-- 13
EXEC I_Correlativas @ID OUTPUT, 13, 9, 'C';
EXEC I_Correlativas @ID OUTPUT, 13, 10, 'C';
EXEC I_Correlativas @ID OUTPUT, 13, 11, 'C';
EXEC I_Correlativas @ID OUTPUT, 13, 5, 'A';
EXEC I_Correlativas @ID OUTPUT, 13, 7, 'A';

-- 14
EXEC I_Correlativas @ID OUTPUT, 14, 11, 'C';
EXEC I_Correlativas @ID OUTPUT, 14, 4, 'A';

-- 15
EXEC I_Correlativas @ID OUTPUT, 15, 10, 'C';
EXEC I_Correlativas @ID OUTPUT, 15, 6, 'A';
EXEC I_Correlativas @ID OUTPUT, 15, 7, 'A';

-- 16
EXEC I_Correlativas @ID OUTPUT, 16, 7, 'C';
EXEC I_Correlativas @ID OUTPUT, 16, 4, 'A';

-- 17
EXEC I_Correlativas @ID OUTPUT, 17, 9, 'C';
EXEC I_Correlativas @ID OUTPUT, 17, 10, 'C';
EXEC I_Correlativas @ID OUTPUT, 17, 5, 'A';
EXEC I_Correlativas @ID OUTPUT, 17, 7, 'A';
GO
-- Agrega mis notas a la tabla evaluacion

select * from Evaluacion;
delete from Evaluacion;

DECLARE @ID INT;

EXEC [dbo].[I_Evaluacion] @ID OUTPUT, 1, 1, '2023-15-10', 'S', 8.5, 1;
EXEC [dbo].[I_Evaluacion] @ID OUTPUT, 1, 2, '2023-22-10', 'S', 7.8, 1;
EXEC [dbo].[I_Evaluacion] @ID OUTPUT, 1, 3, '2023-03-11', 'S', 9.1, 1;
EXEC [dbo].[I_Evaluacion] @ID OUTPUT, 1, 4, '2023-12-11', 'S', 7.3, 1;
EXEC [dbo].[I_Evaluacion] @ID OUTPUT, 1, 5, '2023-25-11', 'S', 8.0, 1;
EXEC [dbo].[I_Evaluacion] @ID OUTPUT, 1, 6, '2023-02-12', 'S', 9.7, 1;
EXEC [dbo].[I_Evaluacion] @ID OUTPUT, 1, 7, '2023-10-12', 'S', 8.9, 1;
EXEC [dbo].[I_Evaluacion] @ID OUTPUT, 1, 8, '2023-18-12', 'S', 7.6, 1;
GO

-- Traer todas las materias de un alumno de cierto plan, las que tengan y no tengan calificación.