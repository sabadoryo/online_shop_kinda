package kz.bitlab.project.dao;
import kz.bitlab.project.entities.FavItem;
import kz.bitlab.project.entities.Users;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

public class UserDAOImpl implements UserDAO{
    @Autowired
    private SessionFactory sessionFactory;
    @Override
    public Users getUser(String email) {
        Session session = sessionFactory.openSession();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Users> query = builder.createQuery(Users.class);
        Root<Users> root = query.from(Users.class);
        Predicate predicate = builder.equal(root.get("email"), email);
        Users user = session.createQuery(query.where(predicate)).uniqueResult();
        session.close();
        return user;
    }
    @Autowired
    private PasswordEncoder passwordEncoder;
    @Override
    public void addUser(Users user){
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        session.save(user);
        transaction.commit();
        session.close();
    }

    @Override
    public List<Users> getAllUsers() {

        Session session = sessionFactory.openSession();
        List<Users> fi = session.createQuery("SELECT c FROM Users c").getResultList(); //HQL
        session.close();
        System.out.println(fi+"AOAOAOAOOAOAOAOAOA HUI MOCH");
        return fi;
    }
}