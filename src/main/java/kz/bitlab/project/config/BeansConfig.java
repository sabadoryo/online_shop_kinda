package kz.bitlab.project.config;
import kz.bitlab.project.dao.UserDAO;
import kz.bitlab.project.dao.UserDAOImpl;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
@Configuration
@Scope("singleton")
public class BeansConfig {
    @Bean
    public UserDAO userDAO(){
        return new UserDAOImpl();
    }
}