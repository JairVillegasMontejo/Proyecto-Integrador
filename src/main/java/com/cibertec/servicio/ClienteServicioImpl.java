package com.cibertec.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cibertec.entidad.Cliente;
import com.cibertec.repositorio.ClienteRepositorio;

@Service
public class ClienteServicioImpl implements ClienteServicio {
	
	@Autowired
	private ClienteRepositorio repositorio;
	
	@Override
	public List<Cliente> listaCliente() {
		return repositorio.findAll();
	}

	@Override
	public Cliente registraCliente(Cliente obj) {
		
		return repositorio.save(obj);
	}
}
