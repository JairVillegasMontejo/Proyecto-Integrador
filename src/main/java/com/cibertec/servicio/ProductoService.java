package com.cibertec.servicio;

import java.util.List;
import java.util.Optional;


import com.cibertec.entidad.Producto;



public interface ProductoService {

	public abstract List<Producto> listarTodos();
	public abstract Producto insertaProducto(Producto obj);
	public abstract void eliminaProducto (int id);
	public abstract List<Producto> listarPorNombre(String filtro);
	public abstract Producto insertaActualizaProducto(Producto obj);
	public abstract Optional<Producto> buscaPorId(int id);
	
	
}
