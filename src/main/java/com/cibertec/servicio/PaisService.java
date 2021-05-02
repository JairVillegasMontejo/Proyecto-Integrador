package com.cibertec.servicio;

import java.util.List;

import org.springframework.stereotype.Service;

import com.cibertec.entidad.Pais;

public interface PaisService {
	public abstract List<Pais> listaTodos();
}
