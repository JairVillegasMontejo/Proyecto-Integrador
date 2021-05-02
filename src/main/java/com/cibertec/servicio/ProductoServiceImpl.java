package com.cibertec.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cibertec.entidad.Producto;
import com.cibertec.repositorio.ProductoRepositorio;


@Service
public class ProductoServiceImpl implements ProductoService {

	@Autowired 
	private ProductoRepositorio repositorio;
	
	@Override
	public List<Producto> listarTodos() {
		return repositorio.findAll();
	}

	@Override
	public Producto insertaProducto(Producto obj) {
		return repositorio.save(obj);
	}

	@Override
	public void eliminaProducto(int id) {
		repositorio.deleteById(id);

	}

	@Override
	public List<Producto> listarPorNombre(String filtro) {
		return repositorio.listaPorNombre(filtro);
	}

	@Override
	public Producto insertaActualizaProducto(Producto obj) {
		return repositorio.save(obj);
	}

	@Override
	public Optional<Producto> buscaPorId(int id) {
		return repositorio.findById(id);
	}

}
