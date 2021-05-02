package com.cibertec.repositorio;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.cibertec.entidad.Marca;

public interface MarcaRepositorio extends JpaRepository<Marca, Integer>{
	@Query("select a from Marca a where a.nombre like :parametro")
	public abstract List<Marca> listaPorNombre(@Param("parametro") String filtro);
}
