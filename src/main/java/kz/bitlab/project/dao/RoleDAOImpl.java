package kz.bitlab.project.dao;
import kz.bitlab.project.entities.Roles;
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
import java.util.Set;

@Component
public class RoleDAOImpl implements RolesDAO{
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public Roles getRole(Long id) {
        Session session = sessionFactory.openSession();
        Roles role = (Roles) session.createQuery("SELECT u FROM Roles u WHERE u.id = :idshka")
                .setParameter("idshka", id)
                .uniqueResult();
        session.close();
        return role;
    }
}