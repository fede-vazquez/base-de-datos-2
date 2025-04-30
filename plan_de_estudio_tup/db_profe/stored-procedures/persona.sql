-- Create ------------------------------------------
drop procedure I_Persona;

create procedure I_Persona
    @apellido varchar(64),
    @nombre varchar(64),
    @dni integer,
    @id int out
as
Begin
    Begin Try
        Insert into Persona(apellido, nombre, dni)
        values (@apellido, @nombre, @dni);
    End Try
    Begin Catch
        SELECT ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage;
    End Catch
End

-- Update ------------------------------------------

drop procedure U_Persona;

create procedure U_Persona
    @apellido varchar(64),
    @nombre varchar(64),
    @dni integer,
    @id int out
as
Begin
    Begin Try
        Update Persona
        Set
        apellido = IsNull(@apellido, apellido),
        nombre = IsNull(@nombre, nombre),
        dni = IsNull(@dni, dni)
        where id = @id;
    End Try
    Begin Try
        SELECT ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage;
    End Try
End

-- Delete ------------------------------------------

drop procedure D_Persona;

create procedure D_Persona
    @id integer out
as
Begin
    Begin Try
        Delete from D_Persona where id = @id;
    End Try
    Begin Catch
        SELECT ERROR_NUMBER() AS ErrorNumber,
        ERROR_SEVERITY() AS ErrorSeverity,
        ERROR_STATE() AS ErrorState,
        ERROR_PROCEDURE() AS ErrorProcedure,
        ERROR_LINE() AS ErrorLine,
        ERROR_MESSAGE() AS ErrorMessage;
    End Catch
End