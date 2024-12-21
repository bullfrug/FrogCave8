package com.codingrecipe.member.service;

import com.codingrecipe.member.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ProductService {

    @Autowired
    private ProductRepository productRepository;

    public List<Map<String, Object>> getProductsByCategory(String category) {
        return productRepository.findProductsByCategory(category);
    }

    public void addToCart(int productId) {
        productRepository.addToCart(productId);
    }

    public void addToWishlist(int productId) {
        productRepository.addToWishlist(productId);
    }
}

/// 이건 재사용성과 MAp 등 유지보수를 위한 용도로 사용될 경우를 대비해 모델에 product를 넣었을때 아래로 바꾸면 됨.

//package com.codingrecipe.member.service;
//
//import com.codingrecipe.member.model.Product;
//import com.codingrecipe.member.repository.ProductRepository;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Service;
//
//import java.util.List;
//
//@Service
//public class ProductService {
//
//    @Autowired
//    private ProductRepository productRepository;
//
//    public List<Product> getProductsByCategory(String category) {
//        return productRepository.findProductsByCategory(category);
//    }
//
//    public void addToCart(int productId) {
//        productRepository.addToCart(productId);
//    }
//
//    public void addToWishlist(int productId) {
//        productRepository.addToWishlist(productId);
//    }
//}