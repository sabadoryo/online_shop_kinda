package kz.bitlab.project.dao;

import kz.bitlab.project.entities.FavItem;
import kz.bitlab.project.entities.Favourites;
import kz.bitlab.project.entities.Items;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Component
public class FavItemDAOImpl implements FavItemDAO {
    @Autowired
    SessionFactory sessionFactory;
    @Override

    public void addItemToFav(FavItem item) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.save(item);
        transaction.commit();
        session.close();
    }
    @Override
    public List<FavItem> getAllFavItems() {

        Session session = sessionFactory.openSession();
        List<FavItem> fi = session.createQuery("SELECT c FROM FavItem c").getResultList(); //HQL
        session.close();
        System.out.println(fi+"AOAOAOAOOAOAOAOAOA HUI MOCH");
        return fi;
    }

    @Override
    public void deleteItemFromFav(Long id) {
        FavItem fi = new FavItem();
        fi.setFavItem_id(id);
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        session.delete(fi);
        transaction.commit();
        session.close();

    }

}
