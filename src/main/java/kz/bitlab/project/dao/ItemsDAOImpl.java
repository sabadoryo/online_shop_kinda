package kz.bitlab.project.dao;

import kz.bitlab.project.entities.Items;
import kz.bitlab.project.entities.ItemsInQueue;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class ItemsDAOImpl implements ItemsDAO {
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Items> getAllItems() {

        Session session = sessionFactory.openSession();
        List<Items> items = session.createQuery("SELECT c FROM Items c").getResultList(); //HQL
        session.close();
        return items;
    }
    @Override
    public void editItem(Long id, String desc, String name, Double price) {
        Session session = sessionFactory.openSession();
        Transaction tr = session.beginTransaction();
        Query query = session.createQuery("UPDATE Items SET description=:content, name=:name, price=:price where id = :id");
        query.setParameter("content", desc);
        query.setParameter("name", name);
        query.setParameter("price", price);
        query.setParameter("id", id);
        int result = query.executeUpdate();
        session.close();
    }
    @Override
    public Items getItem(Long id) {
        Session session = sessionFactory.openSession();
        Items item = (Items) session.createQuery("SELECT c FROM Items c WHERE c.id = :idshka")
                .setParameter("idshka", id)
                .uniqueResult();
        session.close();
        return item;
    }
    @Override
    public void deleteItem(Items item) {
        Session session = sessionFactory.openSession();
        Transaction tr = session.beginTransaction();
        session.delete(item);
        tr.commit();
        session.close();
    }
}
