package com.cibertec.repositorio;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.cibertec.entidad.Producto;

public interface ProductoRepositorio extends JpaRepository<Producto, Integer> {
	
	@Query("select a from Producto a where a.nombre like :parametro")
	public abstract List<Producto> listaPorNombre(@Param("parametro") String filtro);
	
}
