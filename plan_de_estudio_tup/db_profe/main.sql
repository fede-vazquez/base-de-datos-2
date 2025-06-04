-- Creación de tablas y procedures de insert, deletes, updates.
:r .\tablas.sql
GO
:r .\GetErrorInfo.sql
GO
:r .\GenCreateDelete.sql
GO
:r .\GenCreateInsert.sql
GO
:r .\GenCreateUpdate.sql
GO
:r .\GenXml.sql
GO
:r .\GenAll.sql

-- Inserts de datos.
:r .\data.sql
GO
:r .\InsPersonas.sql
GO
:r .\views\CargaAlumnos.sql
GO
:r .\views\CargaCorrelativas.sql
GO
:r .\views\CargarEvaluaciones.sql
GO

-- Creación de views.
:r .\views\vAlumnos.sql
GO
:r .\views\vCreditosXNivel.sql
GO
:r .\views\vEstadoAcademico.sql
GO
:r .\views\vEvaluacionesMateria.sql
GO
:r .\views\vMateriasXArea.sql
GO
:r .\views\vMateriasXCuatrimestre.sql
GO
:r .\views\vMateriasXNivel.sql
GO
:r .\views\vPromedios.sql
GO

-- Creación de procedures propios.
:r .\stored-procedures\obtenerEstadoAcademico.sql
:r .\stored-procedures\obtenerPromedio.sql
GO

-- Creación de triggers.

:r .\triggers\trgHistoEvaluacion.sql