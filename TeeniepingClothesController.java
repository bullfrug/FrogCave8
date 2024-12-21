package com.codingrecipe.member.controller;

import com.codingrecipe.member.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/emotioncastle/teenieping_clothes")
public class TeeniepingClothesController {

    @Autowired
    private ProductService productService;

    @GetMapping
    public String showClothesPage(Model model) {
        model.addAttribute("products", productService.getProductsByCategory("clothes"));
        return "TeeniepingClothes"; // JSP 이름
    }

/// 이건 재사용성과 MAp 등 유지보수를 위한 용도로 사용될 경우를 대비해 모델에 product를 넣었을때 아래로 바꾸면 됨.
//@GetMapping
//public String showClothesPage(Model model) {
//    List<Product> products = productService.getProductsByCategory("clothes");
//    model.addAttribute("products", products);
//    return "teeniepingClothes";
//}

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
