Begin
DECLARE @ID INT;

EXEC dbo.I_Correlativas @ID OUTPUT, @ASIGNATURA_ID = 5, @CORRELATIVA_ID = 1, @TIPO_CORRELATIVA = 'C'; -- Prog II ← Prog I
EXEC dbo.I_Correlativas @ID OUTPUT, @ASIGNATURA_ID = 9, @CORRELATIVA_ID = 5, @TIPO_CORRELATIVA = 'A'; -- Prog III ← Prog II
EXEC dbo.I_Correlativas @ID OUTPUT, @ASIGNATURA_ID = 13, @CORRELATIVA_ID = 9, @TIPO_CORRELATIVA = 'A'; -- Prog IV ← Prog III
EXEC dbo.I_Correlativas @ID OUTPUT, @ASIGNATURA_ID = 7, @CORRELATIVA_ID = 5, @TIPO_CORRELATIVA = 'C'; -- BD I ← Prog II
EXEC dbo.I_Correlativas @ID OUTPUT, @ASIGNATURA_ID = 10, @CORRELATIVA_ID = 7, @TIPO_CORRELATIVA = 'A'; -- BD II ← BD I
EXEC dbo.I_Correlativas @ID OUTPUT, @ASIGNATURA_ID = 11, @CORRELATIVA_ID = 5, @TIPO_CORRELATIVA = 'C'; -- Metodología I ← Prog II
EXEC dbo.I_Correlativas @ID OUTPUT, @ASIGNATURA_ID = 14, @CORRELATIVA_ID = 11, @TIPO_CORRELATIVA = 'A'; -- Metodología II ← Metodología I
EXEC dbo.I_Correlativas @ID OUTPUT, @ASIGNATURA_ID = 15, @CORRELATIVA_ID = 6, @TIPO_CORRELATIVA = 'C'; -- Análisis de datos ← Probabilidad
EXEC dbo.I_Correlativas @ID OUTPUT, @ASIGNATURA_ID = 17, @CORRELATIVA_ID = 13, @TIPO_CORRELATIVA = 'A'; -- Gestión ← Prog IV
End