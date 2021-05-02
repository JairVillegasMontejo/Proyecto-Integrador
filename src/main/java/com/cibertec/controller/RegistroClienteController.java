package com.cibertec.controller;


import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cibertec.entidad.Cliente;

import com.cibertec.entidad.Ubigeo;
import com.cibertec.servicio.ClienteServicio;
import com.cibertec.servicio.UbigeoServicio;

/**
 * @author Sergio Chavez
 * 
 */

@Controller
public class RegistroClienteController {

	@Autowired
	UbigeoServicio servicioUbi1;

	@Autowired
	ClienteServicio servicio;

	@ResponseBody
	@RequestMapping("/listaDepartamentos")
	public List<Ubigeo> listaDepartamentos() {
		return servicioUbi1.listaDepartamentos();
	}

	@ResponseBody
	@RequestMapping("/listaProvincias")
	public List<Ubigeo> listaProvincias(String var_departamento) {
		return servicioUbi1.listaProvincia(var_departamento);
	}

	@ResponseBody
	@RequestMapping("/listaDistritos")
	public List<Ubigeo> listaDistritos(String var_departamento, String var_provincia) {
		return servicioUbi1.listaDistrito(var_departamento, var_provincia);
	}

	@RequestMapping("/registraCliente")
	public String registraCliente(HttpServletRequest request, Cliente obj) {
		HttpSession session = request.getSession(true);
		obj.setFechaRegistro(new Date());
		Cliente prov = servicio.registraCliente(obj);
		if (prov == null) {
			session.setAttribute("objMensajeCliente", "Registro Erroneo!");
		} else {
			session.setAttribute("objMensajeCliente", "Registro Exitoso!");
		}
		return "redirect:verRegistroCliente";
	}
}
