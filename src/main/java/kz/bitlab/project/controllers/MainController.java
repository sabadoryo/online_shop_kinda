package kz.bitlab.project.controllers;
import com.mysql.cj.conf.url.FailoverConnectionUrl;
import kz.bitlab.project.dao.*;
import kz.bitlab.project.entities.*;
import org.dom4j.rule.Mode;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping(value = "/")
public class MainController {
    @Autowired
    UserDAO userDAO;
    @Autowired
    ItemsDAO itemsDAO;

    @Autowired
    FavDAO favsDAO;

    @Autowired
    FavItemDAO favItemDAO;
    @Autowired
    ItemsQDAO itemsQDAO;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView index() {
        ModelAndView mw = new ModelAndView("index");
        mw.addObject("user", getUserData());
        return mw;
    }

    public Users getUserData() {
        Users user = null;
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            User ud = (User) authentication.getPrincipal();
            user = userDAO.getUser(ud.getUsername());
        }
        return user;
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView login() {
        ModelAndView mw = new ModelAndView("login");
        return mw;
    }
    @RequestMapping(value = "/admin/itemsList_page", method = RequestMethod.GET)
    public ModelAndView itemsListPage() {
        ModelAndView mw = new ModelAndView("admin/itemsList");
        List<Items> items = itemsDAO.getAllItems();
        int total = 0;
        for(Items i:items){
            total++;
        }
        mw.addObject("items",items);
        mw.addObject("total",total);
        return mw;
    }

    @RequestMapping(value = "/admin/itemsQList_page", method = RequestMethod.GET)
    public ModelAndView itemsQListPage() {
        ModelAndView mw = new ModelAndView("admin/itemsQList");
        List<ItemsInQueue> items = itemsQDAO.getAllItems();
        int total = 0;
        for(ItemsInQueue i:items){
            total++;
        }
        mw.addObject("items",items);
        mw.addObject("total",total);
        return mw;
    }
    @RequestMapping(value = "/admin/usersList_page", method = RequestMethod.GET)
    public ModelAndView usersListPage() {
        ModelAndView mw = new ModelAndView("admin/usersList");
        List<Items> items = itemsDAO.getAllItems();
        List<Users> users = userDAO.getAllUsers();
        int counter = 0;
        List<Integer> total = new ArrayList<>();
        int total_users = 0;

//        for(Users i:users){
//            for(Items j: items){
//                if(i.getId().equals(j.getUser().getId())){
//                    total.add
//                }
//            }
//        }
        mw.addObject("users",users);
        mw.addObject("total",total_users);
        return mw;
    }

    @RequestMapping(value = "/addItem_page", method = RequestMethod.GET)
    public ModelAndView addItem_page() {
        ModelAndView mw = new ModelAndView("profile/addItem");
        return mw;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public ModelAndView register() {
        ModelAndView mw = new ModelAndView("registration");
        return mw;
    }

    @Autowired
    RolesDAO rolesDAO;

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String signUpAuth(@RequestParam(name = "user_email") String email,
                             @RequestParam(name = "user_password") String password,
                             @RequestParam(name = "user_fullname") String fullname) {
        Set<Roles> roles = new HashSet<>();
        Roles r = rolesDAO.getRole(2L);
        roles.add(r);
        Favourites f = new Favourites();
        List<FavItem> fi = new ArrayList<>();
        Users user = new Users(email, password, fullname, roles);
        userDAO.addUser(user);
        List<Users> refresh_users = userDAO.getAllUsers();
        Users user1 = new Users();
        for (Users u : refresh_users) {
            if (u.getEmail().equals(email)) {
                user1 = u;
                break;
            }

        }

        favsDAO.addCart(new Favourites(fi, user1));
        return "redirect:/profile/index";

    }

    @RequestMapping(value = "/favourites_page", method = RequestMethod.GET)
    public ModelAndView favourites() {
        ModelAndView mw = new ModelAndView("profile/favourites");
        List<Favourites> favs = favsDAO.getAllFavourites();
        List<Items> items = new ArrayList<>();
        List<FavItem> favItems = new ArrayList<>();
        Users cur_user = getUserData();
        for (Favourites f : favs) {
            if (f.getUser().getId().equals(cur_user.getId())) {
                favItems = f.getFavItems();
            }
        }
        double total = 0;
        for (FavItem f : favItems) {
            total += f.getItem().getPrice();
        }
        mw.addObject("favs", favItems);
        mw.addObject("total", total);
        return mw;
    }

    @RequestMapping(value = "/myItems_page", method = RequestMethod.GET)
    public ModelAndView userItems() {
        ModelAndView mw = new ModelAndView("profile/myItems");
        List<Items> items = itemsDAO.getAllItems();
        Users cur_user = getUserData();
        Set<Long> us = new HashSet<>();
        List<Items> user_items = new ArrayList<>();
        int total = 0;
        for (Items i : items) {
            if (i.getUser().getId().equals(cur_user.getId())) {
                user_items.add(i);
                total++;
            }
        }
        int total_count = 0;
        List<FavItem> allFavItems = favItemDAO.getAllFavItems();
        for (FavItem f : allFavItems) {
            for (Items i : user_items) {
                if (f.getItem().getId().equals(i.getId())) {
                    us.add(f.getFav().getId());
                }
            }
        }
        total_count = us.size();
        mw.addObject("total", total);
        mw.addObject("total_count", total_count);
        mw.addObject("items", user_items);
        return mw;
    }

    @RequestMapping(value = "/more/{id}", method = RequestMethod.GET)
    public ModelAndView moreInfo(@PathVariable(name = "id") Long id) {
        ModelAndView mw = new ModelAndView("profile/product-details");
        List<Items> items = itemsDAO.getAllItems();
        for (Items i : items) {
            if (i.getId().equals(id)) {
                mw.addObject("items", i);
                break;
            }
        }
        return mw;
    }

    @RequestMapping(value = "/add_to_fav", method = RequestMethod.POST)
    public String add_to_fav(@RequestParam(name = "id") Long id) {
        List<Favourites> favs = favsDAO.getAllFavourites();
        List<Items> items = itemsDAO.getAllItems();
        Items item = new Items();
        List<FavItem> favItems = new ArrayList<>();
        Favourites user_cart = new Favourites();
        for (Items i : items) {
            if (id.equals(i.getId())) {
                item = i;
            }
        }
        Users cur_user = getUserData();
        for (Favourites f : favs) {
            if (f.getUser().getId().equals(cur_user.getId())) {
                user_cart = f;
                break;
            }
        }

        favItemDAO.addItemToFav(new FavItem(user_cart, item));
        System.out.println("ADDED");
        return "redirect:/favourites_page";
    }

    @RequestMapping(value = "/deleteItemFromFav", method = RequestMethod.POST)
    public String delete_from_fav(@RequestParam(name = "id") Long id) {
        List<Favourites> favs = favsDAO.getAllFavourites();
        List<Items> items = itemsDAO.getAllItems();
        Items item = new Items();
        List<FavItem> favItems = favItemDAO.getAllFavItems();
        Favourites user_cart = new Favourites();
        Users cur_user = getUserData();
        long idOfDelItem = 0;
        for (Favourites f : favs) {
            if (f.getUser().getId().equals(cur_user.getId())) {
                user_cart = f;
            }
        }
        for (FavItem f : favItems) {
            if (f.getItem().getId().equals(id) && f.getFav().getId().equals(user_cart.getId())) {
                idOfDelItem = f.getFavItem_id();
            }
        }

        favItemDAO.deleteItemFromFav(idOfDelItem);
        return "redirect:/favourites_page";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView updateNote(@PathVariable(name = "id") Long id) {
        ModelAndView mw = new ModelAndView("profile/editItem");
        List<Items> items = itemsDAO.getAllItems();
        for (Items i : items) {
            if (i.getId().equals(id)) {
                mw.addObject("item", i);
                break;
            }
        }
        return mw;
    }

    @RequestMapping(value = "/editItem", method = RequestMethod.POST)
    public String editItem(@RequestParam(name = "id") Long id,
                          @RequestParam(name = "desc") String desc,
                          @RequestParam(name = "name") String name,
                          @RequestParam(name = "price") Double price) throws IOException {
        itemsDAO.editItem(id, desc, name, price);
        return "redirect:/myItems_page";
    }
    @RequestMapping(value = "/addItem", method = RequestMethod.POST)
    public String addItem(@RequestParam(name = "desc") String desc,
                          @RequestParam(name = "name") String name,
                          @RequestParam(name = "price") Double price) throws IOException {
        Users cur_user = getUserData();
        String image="";
        itemsQDAO.addItem(new ItemsInQueue(cur_user,name,desc,price,image));
        return "redirect:/myItems_page";
    }

    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String deleteNote(@PathVariable(name = "id") Long id) {
        Items i = itemsDAO.getItem(id);
        List<FavItem> favItems = favItemDAO.getAllFavItems();
        for(FavItem f:favItems){
            if(f.getItem().equals(i)){
                favItemDAO.deleteItemFromFav(f.getFavItem_id());
            }
        }
        itemsDAO.deleteItem(i);
        return "redirect:/myItems_page";
    }
}