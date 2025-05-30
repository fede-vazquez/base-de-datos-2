create trigger trg_histo_evaluacion
on dbo.Evaluacion
after insert, update, delete
as
Begin
	Declare @operacion char(1) =
		case when exists(select * from deleted) and
			exists (select * from deleted)
			then 'U'
		when exists (select * from inserted)
			then 'I'
		when exists (select * from deleted)
			then 'D'
		else
			null
		end;
	if @operacion ='U'
	begin
		insert into HistoricoEvaluacion(
		alumno_id, tipoevaluacion_id, materiaplan_id, fecha,
		aprobada_sn, promovida_sn, calificacion,
		usuario, fecha_operacion, operacion)
		select alumno_id, tipoevaluacion_id, materiaplan_id, fecha,
		aprobada_sn, promovida_sn, calificacion,
		suser_name(), getdate(), @operacion from deleted
		union all
		select alumno_id, tipoevaluacion_id, materiaplan_id, fecha,
		aprobada_sn, promovida_sn, calificacion,
		suser_name(), getdate(), @operacion from inserted
	end
	else if @operacion = 'I'
	begin
		insert into HistoricoEvaluacion(
		alumno_id, tipoevaluacion_id, materiaplan_id, fecha,
		aprobada_sn, promovida_sn, calificacion,
		usuario, fecha_operacion, operacion)
		select alumno_id, tipoevaluacion_id, materiaplan_id, fecha,
		aprobada_sn, promovida_sn, calificacion,
		suser_name(), getdate(), @operacion from inserted
	end
	else if @operacion = 'D'
	begin
		insert into HistoricoEvaluacion(
		alumno_id, tipoevaluacion_id, materiaplan_id, fecha,
		aprobada_sn, promovida_sn, calificacion,
		usuario, fecha_operacion, operacion)
		select alumno_id, tipoevaluacion_id, materiaplan_id, fecha,
		aprobada_sn, promovida_sn, calificacion,
		suser_name(), getdate(), @operacion from deleted
	end
end;
GO