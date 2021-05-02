package com.cibertec.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cibertec.entidad.Mascota;
import com.cibertec.servicio.MascotaService;

@Controller
public class MascotaController {

	@Autowired
	private MascotaService service;
	
	
	
	@RequestMapping("/registraMascota")
	@ResponseBody
	public Map<String, Object> registra(Mascota obj){
		Map<String, Object> salida = new HashMap<>();
		Mascota objSalida = service.insertaMascota(obj);
		if (objSalida == null) {
			salida.put("MENSAJE", "Registro erróneo");
		}else {
			salida.put("MENSAJE", "Registro exitoso");
		}
		return salida;
	}
	
	
	
}
