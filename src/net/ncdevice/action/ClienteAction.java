package net.ncdevice.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import net.ncdevice.entidad.Cliente;
import net.ncdevice.service.ClienteService;


@SuppressWarnings("serial")
@ParentPackage("dawi")
public class ClienteAction extends ActionSupport{
	private List<Cliente> listaCliente;
	private int codigo;
	private String razSocial,nomContacto,telefono,email,mensaje;
	private String nombre;
	private Cliente cliente;
	
	private Map<String, Object> session=ActionContext.getContext().getSession();
	
	private ClienteService clienteService;
	
	public ClienteAction() {
		clienteService=new ClienteService();
	}
	
		@Action(value = "/listaCliente", results = { @Result(location = "/listaCliente.jsp", name="ok")})
	public String listaCliente() {
		System.out.println("sss");
		listaCliente=clienteService.listaCliente();
		session.put("clientes",listaCliente);
		return "ok";
	}
		
	@Action(value = "/buscaCliente",results = {@Result(name="ok",type="json")})
	public String buscaCliente() {
		cliente=clienteService.buscarClienteXID(codigo);
		return "ok";
	}
	
	@Action(value = "/listaClienteJson",results = {@Result(name="ok",type="json")})
	public String listaClienteJson() {
		listaCliente=clienteService.listaCliente();
		session.put("clientes",listaCliente);
		return "ok";
	}
	

	@Action(value = "/listaClienteAtName",results = {@Result(name="ok",type="json")})
	public String listaClienteAtName() {
		listaCliente=clienteService.listaClienteXName(nombre+"%");
		session.put("clientes",listaCliente);
		return "ok";
	}
	
	@Action(value = "/addClienteJson",results = {@Result(name="ok",type="json")})
	public String addClienteJson() {
		System.out.println("Hola "+razSocial);
		Cliente objC=new Cliente();
		objC.setIdcliente(0);
		objC.setRazonSocial(razSocial);
		objC.setNombreContacto(nomContacto);
		objC.setTelefono(telefono);
		objC.setCorreo(email);
		int i=clienteService.registraClienteJSON(objC);
		if(i!=-1) {
			mensaje="Se registro correctamente un nuevo cliente";
			session.put("MENSAJE", "Se registro correctamente un nuevo cliente");
		}else {
			mensaje="Error en el proceso";
			session.put("MENSAJE", "Error en el proceso");
		}		
		return "ok";
	}
	
	
	@SuppressWarnings("unchecked")
	@Action(value ="/mantenerCliente",results = {@Result(location ="listaCliente",name="ok",type = "redirect")})
	public String mantenerCliente() {
		System.out.println("HOLA"+cliente.getRazonSocial());
		int i=0;
		if(cliente.getIdcliente()==0) {
			listaCliente=(List<Cliente>)session.get("clientes");
			 for(Cliente cli: listaCliente) {
				 if(cliente.getDni().equals(cli.getDni())) {
					 session.put("ERROR", "Un cliente ya está registrado con este DNI");
					 return "ok";
				 }
				 /*else if(cliente.getRuc().equals(cli.getRuc())){
					 session.put("ERROR", "Un cliente ya está registrado con este RUC");
					 return "ok";
				 }*/
			 }
			if(i!=-1) {
				i=clienteService.registraCliente(cliente);
				if(cliente.getIdcliente()==0) {
					session.put("CORRECTO", "Se registro correctamente un nuevo cliente");
				}else {
					session.put("CORRECTO", "Se modifico correctamente el cliente");
				}
			}else {
				session.put("ERROR", "Error en el proceso");
			}
		}else {
			i=clienteService.modificaCliente(cliente);
			if(i!=-1) {
				session.put("CORRECTO", "Se modificó correctamente el cliente");
			}else {
				session.put("ERROR", "Error al modificar");
			}
		}
		
		return "ok";
	}
	
	@Action(value ="/modificaCliente",results = {@Result(location ="listaCliente",name="ok",type = "redirect")})
	public String modificaCliente() {
		int i=clienteService.modificaCliente(cliente);
		if(i!=-1) {
			session.put("CORRECTO", "Se modific� correctamente el cliente");
		}else {
			session.put("ERROR", "Error al modificar");
		}
		return "ok";
	}
	
	@Action(value = "/eliminaCliente",results = {@Result(location = "listaCliente",name = "ok",type = "redirect")})
	public String eliminaCliente() {
		int i=clienteService.eliminaCliente(codigo);
		if(i!=-1) {
			session.put("CORRECTO", "Se elimino correctamente el cliente");
		}else {
			session.put("ERROR", "Error al eliminar");
		}
		return "ok";
	}


	public String getMensaje() {
		return mensaje;
	}

	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public List<Cliente> getListaCliente() {
		return listaCliente;
	}


	public void setListaCliente(List<Cliente> listaCliente) {
		this.listaCliente = listaCliente;
	}


	public int getCodigo() {
		return codigo;
	}


	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}


	public Cliente getCliente() {
		return cliente;
	}


	public void setCliente(Cliente cliente) {
		this.cliente= cliente;
	}

	public String getRazSocial() {
		return razSocial;
	}

	public void setRazSocial(String razSocial) {
		this.razSocial = razSocial;
	}

	public String getNomContacto() {
		return nomContacto;
	}

	public void setNomContacto(String nomContacto) {
		this.nomContacto = nomContacto;
	}

	public String getTelefono() {
		return telefono;
	}

	public void setTelefono(String telefono) {
		this.telefono = telefono;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	
	
	
}
