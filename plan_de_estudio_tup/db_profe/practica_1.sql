-- No ejecutar estos códigos.

-- ---------- Agregar mis notas de cada parcial. -------------

-- Modificar tabla Evaluación para que tenga la columna alumno_id
ALTER TABLE Evaluacion
ADD alumno_id int not null;

-- Agrega Clave foránea.
ALTER TABLE Evaluacion
ADD CONSTRAINT FK_Evaluacion_Alumno
FOREIGN KEY (alumno_id) REFERENCES Alumno(id);

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