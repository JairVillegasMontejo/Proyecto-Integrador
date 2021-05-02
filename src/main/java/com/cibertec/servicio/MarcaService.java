package com.cibertec.servicio;

import java.util.List;
import java.util.Optional;

import com.cibertec.entidad.Marca;

public interface MarcaService {

	public abstract List<Marca> listarTodos();
	public abstract Marca insertaMarca(Marca marca);
	public abstract void eliminaMarca (int id);
	public abstract List<Marca> listarPorNombre(String filtro);
	public abstract Marca insertaActualizaMarca(Marca marca);
	public abstract Optional<Marca> buscaPorId(int id);
	
}
