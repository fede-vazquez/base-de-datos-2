-- Cambié el código porque el anterior no estaba completo.
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