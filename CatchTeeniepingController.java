package com.codingrecipe.member.controller;

import com.codingrecipe.member.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/emotioncastle/catch_teenieping")
public class CatchTeeniepingController {

    @Autowired
    private ProductService productService;

    @GetMapping
    public String showCatchPage(Model model) {
        model.addAttribute("products", productService.getProductsByCategory("catch"));
        return "CatchTinniping"; // JSP 이름
    }

    @PostMapping("/addToCart")
    @ResponseBody
    public String addToCart(@RequestParam int productId) {
        productService.addToCart(productId);
        return "SUCCESS";
    }

    @PostMapping("/addToWishlist")
    @ResponseBody
    public String addToWishlist(@RequestParam int productId) {
        productService.addToWishlist(productId);
        return "SUCCESS";
    }
}
