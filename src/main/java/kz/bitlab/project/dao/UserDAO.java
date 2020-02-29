package kz.bitlab.project.dao;
import kz.bitlab.project.entities.Users;

import java.util.List;

public interface UserDAO {
    Users getUser(String email);
    void addUser(Users user);
    public List<Users> getAllUsers();
}