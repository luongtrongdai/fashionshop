package com.threed.fashionShop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.threed.fashionShop.DAO.PizzaDAO;
import com.threed.fashionShop.pojo.Pizza;

@Controller
public class PizzaController {
   
    @Autowired
    private PizzaDAO pizzaDAO;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String list(Model model) {
        List<Pizza> pizzas = null;
        model.addAttribute("pizzas", pizzas);
        model.addAttribute("Hello", "Hello ThreeD :D");
        return "/index";
    }

    @RequestMapping(value = "/hello", method = RequestMethod.GET)
    public String sayHello(Model model) {
        model.addAttribute("Hello", "Hello ThreeD :D");
        return "/hello";
    }
}