package com.cibertec.controller;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cibertec.entidad.Marca;
import com.cibertec.entidad.Pais;
import com.cibertec.servicio.MarcaService;
import com.cibertec.servicio.PaisService;

@Controller
public class MarcaController {

	@Autowired
	private MarcaService marcaService;		
	@Autowired
	private PaisService paisService;
	
	@ResponseBody	
	@RequestMapping("/listaPais")	
	public List<Pais> listaPais() {
		return paisService.listaTodos();
	}
	
	
	@RequestMapping("/consultaCrudMarca")
	public String consultaCrud(String filtro, HttpSession session) {
		List<Marca> lista = marcaService.listarPorNombre(filtro+"%");
		session.setAttribute("marcas", lista);
		return "intranetRegistroMarca";
	}
	
	@RequestMapping("/registraMarca")
	public String registra(Marca obj, HttpSession session) {	
		try {
			obj.setFechaRegistro(new Date());
			marcaService.insertaMarca(obj);		
			session.setAttribute("MENSAJE", "Se registro correctamente");	
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Existe ERROR");
			e.printStackTrace();
		}
		return "redirect:salidaMarca";
	}
	
	@RequestMapping("/actualizaMarca")
	public String actualiza(Marca obj, HttpSession session) {	
		try {
			obj.setFechaRegistro(new Date());
			marcaService.insertaMarca(obj);		
			session.setAttribute("MENSAJE", "Se registro correctamente");	
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Existe ERROR");
			e.printStackTrace();
		}
		return "redirect:salidaMarca";
	}
	
	
	
	@RequestMapping("/eliminaCrudMarca")
	public String elimina(int id, HttpSession session) {
		
		try {
			Optional<Marca> obj = marcaService.buscaPorId(id);
			if(obj.isPresent()) {
				marcaService.eliminaMarca(id);
				session.setAttribute("MENSAJE", "Se eliminó correctamente");
			}else {
				session.setAttribute("MENSAJE", "No existe el ID");	
			}	
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Existe ERROR");
			e.printStackTrace();
		}
		return "redirect:salidaMarca";
	}
	
	@RequestMapping("/salidaMarca")
	public String listarTodaslasMarcas(HttpSession session) {
		List<Marca> data = marcaService.listarTodos();
		session.setAttribute("marcas", data);
		return "intranetRegistroMarca";
	}
	
	
}
