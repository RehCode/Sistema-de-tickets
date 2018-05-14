SELECT [ticket_id]
      ,[titulo]
      ,[descripcion]
      ,[fecha]
      ,[departamentos].[departamento]
      ,[nombre_interesado]
      ,[categorias].[categoria]
	  ,[responsables].[nombre]
  FROM ((tickets
  inner join departamentos on tickets.departamento_id = departamentos.departamento_id)
  inner join categorias on tickets.categoria_id = categorias.categoria_id
  ) inner join responsables on tickets.responsable_id = responsables.responsable_id
  where solucionado=0
  order by fecha asc  