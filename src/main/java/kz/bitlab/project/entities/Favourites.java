package kz.bitlab.project.entities;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "favourites")
public class Favourites {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "fav_id")
    private Long id;

    @OneToMany(mappedBy = "fav", cascade = CascadeType.ALL, fetch = FetchType.EAGER)

    private List<FavItem> favItems;

    @OneToOne
    @JoinColumn(name = "customerId")
    private Users user;

    public Favourites() {
    }

    public Favourites(List<FavItem> favItems, Users user) {
        this.favItems = favItems;
        this.user = user;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public List<FavItem> getFavItems() {
        return favItems;
    }

    public void setFavItems(List<FavItem> favItems) {
        this.favItems = favItems;
    }

    public Users getUser() {
        return user;
    }

    public void setUser(Users user) {
        this.user = user;
    }
}