package com.codingrecipe.member.repository;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class ProductRepository {

    private final JdbcTemplate jdbcTemplate;

    public ProductRepository(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Map<String, Object>> findProductsByCategory(String category) {
        String sql = "SELECT * FROM product WHERE category = ?";
        return jdbcTemplate.queryForList(sql, category);
    }

    public void addToCart(int productId) {
        String sql = "INSERT INTO cart (product_id) VALUES (?)";
        jdbcTemplate.update(sql, productId);
    }

    public void addToWishlist(int productId) {
        String sql = "INSERT INTO wishlist (product_id) VALUES (?)";
        jdbcTemplate.update(sql, productId);
    }
}

/// 이건 재사용성과 MAp 등 유지보수를 위한 용도로 사용될 경우를 대비해 모델에 product를 넣었을때 아래로 바꾸면 됨.
//package com.codingrecipe.member.repository;
//
//import com.codingrecipe.member.model.Product;
//import org.springframework.jdbc.core.BeanPropertyRowMapper;
//import org.springframework.jdbc.core.JdbcTemplate;
//import org.springframework.stereotype.Repository;
//
//import java.util.List;
//
//@Repository
//public class ProductRepository {
//
//    private final JdbcTemplate jdbcTemplate;
//
//    public ProductRepository(JdbcTemplate jdbcTemplate) {
//        this.jdbcTemplate = jdbcTemplate;
//    }
//
//    public List<Product> findProductsByCategory(String category) {
//        String sql = "SELECT * FROM product WHERE category = ?";
//        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Product.class), category);
//    }
//
//    public void addToCart(int productId) {
//        String sql = "INSERT INTO cart (product_id) VALUES (?)";
//        jdbcTemplate.update(sql, productId);
//    }
//
//    public void addToWishlist(int productId) {
//        String sql = "INSERT INTO wishlist (product_id) VALUES (?)";
//        jdbcTemplate.update(sql, productId);
//    }
//}