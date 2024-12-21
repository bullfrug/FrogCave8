package com.codingrecipe.member.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class OrderRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    public List<Map<String, Object>> getOrderProducts() {
        String sql = "SELECT product_id, name, option, price, quantity, image_url FROM order_products";
        return jdbcTemplate.queryForList(sql);
    }

    public int getAvailablePoints(int userId) {
        String sql = "SELECT points FROM users WHERE user_id = ?";
        return jdbcTemplate.queryForObject(sql, new Object[]{userId}, Integer.class);
    }

    public List<Map<String, Object>> getCoupons(int userId) {
        String sql = "SELECT id, name, discount FROM coupons WHERE user_id = ?";
        return jdbcTemplate.queryForList(sql, userId);
    }

    public int saveOrder(String name, String phone, String address, String detailAddress,
                         String request, int originalPrice, int shippingFee, int usedPoints,
                         int couponDiscount, int finalAmount, String paymentMethod) {

        String sql = "INSERT INTO orders (name, phone, address, detail_address, request, original_price, " +
                "shipping_fee, used_points, coupon_discount, final_amount, payment_method) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        jdbcTemplate.update(sql, name, phone, address, detailAddress, request, originalPrice,
                shippingFee, usedPoints, couponDiscount, finalAmount, paymentMethod);

        return jdbcTemplate.queryForObject("SELECT LAST_INSERT_ID()", Integer.class);
    }

    public Map<String, Object> getOrderById(int orderId) {
        String sql = "SELECT * FROM orders WHERE order_id = ?";
        return jdbcTemplate.queryForMap(sql, orderId);
    }

    public List<Map<String, Object>> getOrderProductsByOrderId(int orderId) {
        String sql = "SELECT product_id, name, option, price, quantity, image_url " +
                "FROM order_products WHERE order_id = ?";
        return jdbcTemplate.queryForList(sql, orderId);
    }
}
