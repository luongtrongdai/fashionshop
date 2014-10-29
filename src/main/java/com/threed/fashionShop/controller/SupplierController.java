package com.threed.fashionShop.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;

import com.threed.fashionShop.DAO.SupplierDAO;
import com.threed.fashionShop.Utils.CommonUtil;
import com.threed.fashionShop.pojo.Supplier;

@Controller
public class SupplierController {
   
    private SupplierDAO supplierDAO = new SupplierDAO();

    @RequestMapping(value = "/supplier", method = RequestMethod.GET)
    public String list(Model model, HttpServletRequest request) {
    	CommonUtil.setCharacterEncoding(RequestContextHolder.getRequestAttributes());
    	String param =  request.getParameter("param");
    	System.out.println(param);
        List<Supplier> suppliers = supplierDAO.selectAllListSupplier();
        model.addAttribute("suppliers", suppliers);
        model.addAttribute("param123", param);
        return "/supplier";
    }
}