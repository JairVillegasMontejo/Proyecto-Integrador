package com.cibertec.entidad;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;




@Entity
@Table(name = "mascota")
public class Mascota {

	@Column(name = "idMascota")
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int idMascota;
	
	@Column(name = "nombre")
	private String nombre;
	
	@Column(name = "color")
	private String color;
	
	@Column(name = "raza")
	private String raza;
	
	@Column(name = "descripcion")
	private String descripcion;
	
	
	
	
	

	public void setIdMascota(int idMascota) {
		this.idMascota = idMascota;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public int getIdMascota() {
		return idMascota;
	}

	public void setIdAlumno(int idMascota) {
		this.idMascota = idMascota;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public String getRaza() {
		return raza;
	}

	public void setRaza(String raza) {
		this.raza = raza;
	}
	
	public String getDescripcion() {
		return descripcion;
	}

	public void setDdescripcion(String descripcion) {
		this.descripcion = descripcion;
	}


	

	
	
	
}
