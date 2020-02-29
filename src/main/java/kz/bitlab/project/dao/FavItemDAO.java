package kz.bitlab.project.dao;

import kz.bitlab.project.entities.FavItem;
import kz.bitlab.project.entities.Favourites;

import java.util.List;

public interface FavItemDAO {
    void addItemToFav(FavItem item);
    List<FavItem> getAllFavItems();
    void deleteItemFromFav(Long id);
}
