package com.codingrecipe.member.controller;

import com.codingrecipe.member.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/emotioncastle/teenieping_world")
public class TeeniepingWorldController {

    @Autowired
    private ProductService productService;

    @GetMapping
    public String showWorldPage(Model model) {
        model.addAttribute("products", productService.getProductsByCategory("world"));
        return "teeniepingworld"; // JSP 이름
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
