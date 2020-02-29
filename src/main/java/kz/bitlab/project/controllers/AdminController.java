package kz.bitlab.project.controllers;
import kz.bitlab.project.dao.ItemsDAO;
import kz.bitlab.project.dao.ItemsQDAO;
import kz.bitlab.project.dao.UserDAO;
import kz.bitlab.project.entities.Items;
import kz.bitlab.project.entities.ItemsInQueue;
import kz.bitlab.project.entities.Users;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {
    @Autowired
    UserDAO userDAO;
    @Autowired
    ItemsDAO itemsDAO;
    @Autowired
    ItemsQDAO itemsQDAO;
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public ModelAndView index(){
        ModelAndView mw = new ModelAndView("admin/index");
        List<Users> users = userDAO.getAllUsers();
        int total_users = users.size();
        List<Items> items = itemsDAO.getAllItems();
        int total_items = items.size();
        List<ItemsInQueue> itemsQ = itemsQDAO.getAllItems();
        int total_itemsQ = itemsQ.size();
        mw.addObject("itemsQ",itemsQ);
        mw.addObject("total_itemsQ",total_itemsQ);
        mw.addObject("items",items);
        mw.addObject("total_items",total_items);
        mw.addObject("total_users",total_users);
        mw.addObject("users",users);
        mw.addObject("user", getUserData());
        return mw;
    }
    public Users getUserData(){
        Users user = null;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if(!(authentication instanceof AnonymousAuthenticationToken)){
            User ud = (User)authentication.getPrincipal();
            user = userDAO.getUser(ud.getUsername());
        }
        return user;
    }
}