package kz.bitlab.project.dao;

import kz.bitlab.project.entities.Items;

import java.util.List;

public interface ItemsDAO {
    List<Items> getAllItems();
    public void editItem(Long id, String desc, String name, Double price);
    public void deleteItem(Items item);
    public Items getItem(Long id);
}

