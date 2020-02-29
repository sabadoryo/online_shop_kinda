package kz.bitlab.project.dao;

import kz.bitlab.project.entities.FavItem;
import kz.bitlab.project.entities.Favourites;

import java.util.List;

public interface FavDAO {
    List<Favourites> getAllFavourites();
    public void addCart(Favourites fav);
}
