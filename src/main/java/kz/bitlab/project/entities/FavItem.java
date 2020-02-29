package kz.bitlab.project.entities;

import javax.persistence.*;

@Entity
@Table(name = "favItem")
public class FavItem {

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name = "favItem_id")
    private long favItem_id;

    @ManyToOne//with cart
    @JoinColumn(name="cartId")//primaru key of cart
    private Favourites fav;

    @ManyToOne//with cartitem
    @JoinColumn(name="productId")
    private Items item;

    public FavItem() {
    }

    public FavItem(Favourites fav, Items item) {
        this.fav = fav;
        this.item = item;
    }

    public long getFavItem_id() {
        return favItem_id;
    }

    public void setFavItem_id(long favItem_id) {
        this.favItem_id = favItem_id;
    }

    public Favourites getFav() {
        return fav;
    }

    public void setFav(Favourites fav) {
        this.fav = fav;
    }

    public Items getItem() {
        return item;
    }

    public void setItem(Items item) {
        this.item = item;
    }
}
