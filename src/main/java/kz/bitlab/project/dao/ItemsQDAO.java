package kz.bitlab.project.dao;

import kz.bitlab.project.entities.Items;
import kz.bitlab.project.entities.ItemsInQueue;

import java.util.List;

public interface ItemsQDAO {
    List<ItemsInQueue> getAllItems();
    public void editItem(Long id, String desc, String name, Double price);
    public void deleteItem(ItemsInQueue item);
    public ItemsInQueue getItem(Long id);
    public void addItem(ItemsInQueue item);

}

