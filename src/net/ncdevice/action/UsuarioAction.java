package net.ncdevice.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.dispatcher.SessionMap;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import net.ncdevice.entidad.Mensaje;
import net.ncdevice.entidad.Menu;
import net.ncdevice.entidad.Usuario;
import net.ncdevice.service.DocumentoService;
import net.ncdevice.service.MensajeService;
import net.ncdevice.service.UsuarioService;

@SuppressWarnings("serial")
@ParentPackage("dawi")
public class UsuarioAction extends ActionSupport{
	
	private List<Usuario> listaUsua;
	private String codigo,clave;
	private Usuario usuario;
	private int cargo;
	private Map<String, Object> session=ActionContext.getContext().getSession();
	//MENSAJE
	private String emisor,receptor,asunto,contenido,mensaje;
	private UsuarioService serviceUsuario;
	private MensajeService mensajeService;
	
	public UsuarioAction() {
		serviceUsuario=new UsuarioService();
		mensajeService=new MensajeService();
	}
	
	@Action(value = "/listaTrabajador",results = {@Result(name="ok",type="redirect",location = "/listaTrabajador.jsp")})
	public String listaTrabajador() {
		listaUsua=serviceUsuario.listaUsuario();
		session.put("usuarios",listaUsua);
		return "ok";
	}	
	
	@Action(value = "/listaTrabajadorAtCargo",results = {@Result(name="ok",type="redirect",location = "/listaTrabajador.jsp")})
	public String listaTrabajadorAtCargo() {
		listaUsua=serviceUsuario.listaTrabajadoresXCargo(cargo);
		session.put("usuarios",listaUsua);
		return "ok";
	}	
	
	@Action(value = "/buscarUsuarioXCodigo",results = {@Result(name="ok",type="json")})
	public String buscarUsuarioXCodigo() {
		usuario=serviceUsuario.buscarUsuarioXID(codigo);
		return "ok";
	}
	@Action(value = "/listaPersonalAdministrativo",results = {@Result(name="ok",type="json")})
	public String listaPersonalAdministrativo() {
		listaUsua=serviceUsuario.listaPersonalAdministrativo();
		session.put("usuarios",listaUsua);
		return "ok";
	}
	@Action(value = "/listaPersonalObrero",results = {@Result(name="ok",type="json")})
	public String listaPersonalObrero() {
		listaUsua=serviceUsuario.listaPersonalObrero();
		session.put("usuarios",listaUsua);
		return "ok";
	}
	@Action(value = "/listaComboPersonal",results = {@Result(name="ok",type="json")})
	public String listaComboPersonal() {
		listaUsua=serviceUsuario.listaComboUsuario();
		session.put("usuarios",listaUsua);
		return "ok";
	}
	@Action(value = "/listaAllUsuarioJson",results = {@Result(name="ok",type="json")})
	public String listaAllUsuarioJson() {
		listaUsua=serviceUsuario.listaUsuario();
		session.put("usuarios",listaUsua);
		return "ok";
	}
	
	@Action(value = "/editarPerfil",results = {@Result(name="ok",type="redirect",location = "/perfil.jsp")})
	public String editarPerfil() {
		Usuario bean=(Usuario)session.get("usuarioLogin");
		usuario=serviceUsuario.buscarUsuarioXID(bean.getIdusuario());
		session.put("usuario",usuario);
		return "ok";
	}	
	
	@Action(value = "/registraMensaje",results = {@Result(name="ok",type="json")})
	public String registraMensaje() {
		Mensaje men=new Mensaje();
		men.setCodEmi(emisor);
		men.setCodRec(receptor);
		men.setAsunto(asunto);
		men.setContenido(contenido);
		int i=mensajeService.insertMensaje(men);
		if(i!=-1) {
			mensaje= "Se envió correctamente su mensaje";
		}else {
			mensaje="Error al enviar el mensaje";
		}
		return "ok";
	}
	
	@Action(value = "/cambiarClave",results = {@Result(name="ok",type="redirect",location = "/editarPerfil")})
	public String cambiarClave() {
		int i=serviceUsuario.cambiarClave(usuario);
		if(i!=-1)
			session.put("MENSAJE", "Se cambio su clave satisfactoriamente");
		else
			session.put("MENSAJE", "Error al cambiar la clave");
		return "ok";
	}	
	
	@Action(value = "/actualizaPerfil",results = {@Result(name="ok",type="redirect",location = "/editarPerfil")})
	public String actualizaPerfil() {
		int i=serviceUsuario.modificaUsuario(usuario);
		if(i!=-1)
			session.put("MENSAJE", "Se actualizo correctamente sus datos");
		else
			session.put("MENSAJE", "Error al actualizar sus datos");
		return "ok";
	}
	/*
	 * 
	@Action(value = "/registraCot",results = {@Result(name="ok",type="redirect",location = "/listaTrabajador")})
	public String registraCot() {
		return "ok";
	}*/
	
	
	@SuppressWarnings("unchecked")
	@Action(value = "/saveUsuarios",results = {@Result(name="ok",type="redirect",
			location = "/listaTrabajador")})

    public String saveUsuarios()  throws Exception {
		 int resu;		
		 if(usuario.getIdusuario().equals("0")){
			 listaUsua=(List<Usuario>) session.get("usuarios");
			 for(Usuario usu: listaUsua) {
				 if(usuario.getDni().equals(usu.getDni())) {
					 session.put("ERROR", "Un usuario ya está registrado con este DNI");
					 return "ok";
				 }else if(usuario.getRuc().equals(usu.getRuc())){
					 session.put("ERROR", "Un usuario ya está registrado con este RUC");
					 return "ok";
				 }
			 }
			 resu=serviceUsuario.nuevoUsuario(usuario);
			 if(resu!=-1)
				 session.put("CORRECTO", "Registro guardado correctamente");
			 else
				 session.put("ERROR", "Error en el registro");
		 }else {
		     resu=serviceUsuario.modificaUsuario(usuario);
			 if(resu!=-1)
				 session.put("CORRECTO", "Se realizo la actualizacion correctamente"); 
			 else
				 session.put("ERROR", "Error en la actualización");
		  }

       return "ok";
    }

	
	@Action(value = "/deleteUsuario",results = {@Result(name="ok",type="redirect",location = "/listaTrabajador")})
	public String deleteUsuario() {
		int resu;
		resu=serviceUsuario.eliminaUsuario(codigo);
		if(resu!=-1)
			session.put("CORRECTO", "Registro eliminado correctamente");
		else
			session.put("ERROR", "Error en la eliminación");
		
		
		return "ok";
	}
	
	@Action(value = "/login", results = { @Result(type="redirect",location = "/menuPrincipal.jsp", name="ok"),
			@Result(type="redirect",location = "/index.jsp", name="error")})
	public String login() {
		//System.out.println("INICIANDO SESION...");
		Usuario bean=new Usuario();
		bean.setIdusuario(codigo);
		bean.setPassword(clave);
		System.out.println(codigo+":"+clave);
		DocumentoService documentoService=new DocumentoService();
		Usuario usu=serviceUsuario.iniciarSesion(bean);
		if(usu==null) {
			session.put("MENSAJE","Usuario y/o clave incorrecta");
			return "error";
		}else {
			List<Menu> enlaces=serviceUsuario.listarMenuUsuario(usu.getIdusuario());
			String notify=documentoService.cantidadDocsRecibidosAtUsuario(usu.getIdusuario())+"";
			session.put("notify", notify);
			session.put("usuarioLogin", usu);
			session.put("usuarioEnlaces", enlaces);
			return "ok";
		}
	}
	
	@SuppressWarnings("rawtypes")
	@Action(value = "/logout",results = {@Result(name="ok",location = "/index.jsp")})
	public String logout() {
		SessionMap sessionActual=(SessionMap) ActionContext.getContext().getSession();
		sessionActual.invalidate();		
		return "ok";
	}

	public List<Usuario> getListaUsua() {
		return listaUsua;
	}

	public void setListaUsua(List<Usuario> listaUsua) {
		this.listaUsua = listaUsua;
	}

	public String getCodigo() {
		return codigo;
	}

	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public String getClave() {
		return clave;
	}

	public void setClave(String clave) {
		this.clave = clave;
	}

	public int getCargo() {
		return cargo;
	}

	public void setCargo(int cargo) {
		this.cargo = cargo;
	}

	public String getEmisor() {
		return emisor;
	}

	public void setEmisor(String emisor) {
		this.emisor = emisor;
	}

	public String getReceptor() {
		return receptor;
	}

	public void setReceptor(String receptor) {
		this.receptor = receptor;
	}

	public String getAsunto() {
		return asunto;
	}

	public void setAsunto(String asunto) {
		this.asunto = asunto;
	}

	public String getContenido() {
		return contenido;
	}

	public void setContenido(String contenido) {
		this.contenido = contenido;
	}

	public String getMensaje() {
		return mensaje;
	}

	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}

	


	
	
}
