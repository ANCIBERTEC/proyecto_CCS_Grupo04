package net.ncdevice.entidad;

import java.io.InputStream;

public class Usuario {
	private String idusuario,nombre, apellidos,banco,numeroCuenta,telefono,fechaContrato;
	private String sexo,correo,nombreFoto,especialidad,tipo,password,dni,ruc,estado;
	private InputStream archivoFoto;
	private byte[] archivoFoto2;
	private double sueldo;
	private Cargo cargo;
	private Distrito distrito;
	private int idcargo,iddistrito;
	
	
	
	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public int getIddistrito() {
		return iddistrito;
	}

	public void setIddistrito(int iddistrito) {
		this.iddistrito = iddistrito;
	}

	public String getSexo() {
		return sexo;
	}

	public void setSexo(String sexo) {
		this.sexo = sexo;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getCorreo() {
		return correo;
	}

	public void setCorreo(String correo) {
		this.correo = correo;
	}

	public double getSueldo() {
		return sueldo;
	}

	public void setSueldo(double sueldo) {
		this.sueldo = sueldo;
	}

	public int getIdcargo() {
		return idcargo;
	}

	public void setIdcargo(int idcargo) {
		this.idcargo = idcargo;
	}

	public byte[] getArchivoFoto2() {
		return archivoFoto2;
	}

	public void setArchivoFoto2(byte[] archivoFoto2) {
		this.archivoFoto2 = archivoFoto2;
	}

	public String getDni() {
		return dni;
	}
	public void setDni(String dni) {
		this.dni = dni;
	}
	public String getRuc() {
		return ruc;
	}
	public void setRuc(String ruc) {
		this.ruc = ruc;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getIdusuario() {
		return idusuario;
	}
	public void setIdusuario(String idusuario) {
		this.idusuario = idusuario;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public String getApellidos() {
		return apellidos;
	}
	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
	public String getBanco() {
		return banco;
	}
	public void setBanco(String banco) {
		this.banco = banco;
	}
	public String getNumeroCuenta() {
		return numeroCuenta;
	}
	public void setNumeroCuenta(String numeroCuenta) {
		this.numeroCuenta = numeroCuenta;
	}
	public String getFechaContrato() {
		return fechaContrato;
	}
	public void setFechaContrato(String fechaContrato) {
		this.fechaContrato = fechaContrato;
	}
	public String getNombreFoto() {
		return nombreFoto;
	}
	public void setNombreFoto(String nombreFoto) {
		this.nombreFoto = nombreFoto;
	}
	public String getEspecialidad() {
		return especialidad;
	}
	public void setEspecialidad(String especialidad) {
		this.especialidad = especialidad;
	}
	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	public InputStream getArchivoFoto() {
		return archivoFoto;
	}
	public void setArchivoFoto(InputStream archivoFoto) {
		this.archivoFoto = archivoFoto;
	}
	public Cargo getCargo() {
		return cargo;
	}
	public void setCargo(Cargo cargo) {
		this.cargo = cargo;
	}
	public Distrito getDistrito() {
		return distrito;
	}
	public void setDistrito(Distrito distrito) {
		this.distrito = distrito;
	}
	
}
