package com.cibertec.servicio;

import java.util.List;

import com.cibertec.entidad.Cliente;


public interface ClienteServicio {
	
	public abstract List<Cliente> listaCliente();
	public abstract Cliente registraCliente(Cliente obj);
	
}
