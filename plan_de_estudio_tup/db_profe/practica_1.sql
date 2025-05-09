declare @Id int;
-- Final, Parcial, Trabajo Pr�ctico, Monograf�a
EXEC I_TipoEvaluacion @Id OUT, 'Final';
EXEC I_TipoEvaluacion @Id OUT, 'Parcial';
EXEC I_TipoEvaluacion @Id OUT, 'Trabajo';
EXEC I_TipoEvaluacion @Id OUT, 'Pr�ctico';
EXEC I_TipoEvaluacion @Id OUT, 'Monograf�a';


-- ---------- Agregar mis notas de cada parcial. -------------

-- Modificar tabla Evaluaci�n para que tenga la columna alumno_id
ALTER TABLE Evaluacion
ADD alumno_id int not null;

-- Agrega Clave for�nea.
ALTER TABLE Evaluacion
ADD CONSTRAINT FK_Evaluacion_Alumno
FOREIGN KEY (alumno_id) REFERENCES Alumno(id);

-- Me agrega como alumno
declare @Id int;
Exec I_Alumno @Id OUT, 59, 1, 17772; 

