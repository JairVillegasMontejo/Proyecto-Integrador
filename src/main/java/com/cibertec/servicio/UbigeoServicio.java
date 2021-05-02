package com.cibertec.servicio;

import java.util.List;

import com.cibertec.entidad.Ubigeo;

public interface UbigeoServicio {

	public abstract List<Ubigeo> listaDepartamentos();

	public abstract List<Ubigeo> listaProvincia(String departamento);

	public abstract List<Ubigeo> listaDistrito(String departamento, String provincia);

}
