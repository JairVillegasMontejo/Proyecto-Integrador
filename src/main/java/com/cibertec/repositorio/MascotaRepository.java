package com.cibertec.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.cibertec.entidad.Mascota;

public interface MascotaRepository  extends JpaRepository<Mascota, Integer>{

	//@Query("select e from Mascota e where e.nombre like :param_filtro")
	//public abstract List<Mascota> listaMascota(@Param("param_filtro") String filtro);
	
	
	

	
}
