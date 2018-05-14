create procedure nuevoTicket(
	@titulo nvarchar(50),
	@descripcion nvarchar(max),
	@departamento_id int,
	@nombre_interesado nvarchar(50),
	@categoria_id int
)
as
begin
	insert into tickets (titulo, descripcion, departamento_id, nombre_interesado, categoria_id)
	values (@titulo, @descripcion, @departamento_id, @nombre_interesado, @categoria_id)
end