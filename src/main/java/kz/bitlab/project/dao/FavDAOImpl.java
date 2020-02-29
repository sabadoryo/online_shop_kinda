package kz.bitlab.project.dao;

import kz.bitlab.project.entities.FavItem;
import kz.bitlab.project.entities.Favourites;
import kz.bitlab.project.entities.Items;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.transaction.Transactional;
import java.util.List;

@Component
public class FavDAOImpl implements FavDAO {
    @Autowired
    SessionFactory sessionFactory;

    @Override
    public List<Favourites> getAllFavourites() {

        Session session = sessionFactory.openSession();
        List<Favourites> favs = session.createQuery("SELECT c FROM Favourites c").getResultList(); //HQL
        session.close();
        return favs;
    }

    @Override
    public void addCart(Favourites fav){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(fav);
        transaction.commit();
        session.close();
    }
}
