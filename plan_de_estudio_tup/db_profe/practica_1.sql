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

