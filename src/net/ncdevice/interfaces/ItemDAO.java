package net.ncdevice.interfaces;

import java.util.List;

import net.ncdevice.entidad.Item;

public interface ItemDAO {
	public int nuevoItem(Item bean);
	public int modificaItem(Item bean);
	public int eliminaItem(int codigo);
	public List<Item> listaItem();
	public List<Item> listaItemXName(String nombre);
	public Item buscarItemXID(String cod);
	public Item buscarItemXName(String nombre);
}
