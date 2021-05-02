package com.cibertec.servicio;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cibertec.entidad.Marca;
import com.cibertec.repositorio.MarcaRepositorio;

@Service
public class MarcaServiceImpl implements MarcaService {

	@Autowired
	private MarcaRepositorio repository;
	
	

	@Override
	public Marca insertaMarca(Marca marca) {
		return repository.save(marca);
	}

	@Override
	public void eliminaMarca(int id) {
		repository.deleteById(id);
		
	}
	
	@Override
	public List<Marca> listarTodos() {
		return repository.findAll();
	}

	@Override
	public List<Marca> listarPorNombre(String filtro) {
		return repository.listaPorNombre(filtro);
	}

	@Override
	public Marca insertaActualizaMarca(Marca obj) {
		return repository.save(obj);
	}

	@Override
	public Optional<Marca> buscaPorId(int id) {
		return repository.findById(id);
	}

}
