package com.threed.fashionShop.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/template")
public class Template {
   

  @RequestMapping(method = RequestMethod.GET)
  public String list(Model model) { 
	
	System.out.println("DANG DUC DUNG");
    /*List<Pizza> pizzas = pizzaDAO.findAll();
    model.addAttribute("pizzas", pizzas);*/
    return "jsp/template";
  }
}