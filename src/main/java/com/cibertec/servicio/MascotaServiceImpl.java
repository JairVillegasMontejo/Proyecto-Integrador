package com.cibertec.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cibertec.entidad.Mascota;
import com.cibertec.repositorio.MascotaRepository;

@Service
public class MascotaServiceImpl implements MascotaService{

	@Autowired
	private MascotaRepository repository;
	
	@Override
	public Mascota insertaMascota(Mascota obj) {
		return repository.save(obj);
	}

	//@Override
	//public List<Mascota> listaMascota(String filtro) {
		//return repository.listaMascota(filtro+"%");
	
	//}

	


}
