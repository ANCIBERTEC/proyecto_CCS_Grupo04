package net.ncdevice.service;

import java.util.List;

import net.ncdevice.dao.MySqlItemDAO;
import net.ncdevice.entidad.Item;

public class ItemService {
	MySqlItemDAO itemDAO;
	
	public ItemService() {
		itemDAO=new MySqlItemDAO();
	}
	

	public int nuevoItem(Item bean) {
		return itemDAO.nuevoItem(bean);
	}
	public int modificaItem(Item bean){
		return itemDAO.modificaItem(bean);
	}
	public int eliminaItem(int codigo){
		return itemDAO.eliminaItem(codigo);
	}
	public List<Item> listaItem(){
		return itemDAO.listaItem();
	}
	public List<Item> listaItemXName(String nombre){
		return itemDAO.listaItemXName(nombre);
	}
	public Item buscarItemXID(String cod){
		return itemDAO.buscarItemXID(cod);
	}
	public Item buscarItemXName(String nombre){
		return itemDAO.buscarItemXName(nombre);
	}
}
