package com.codingrecipe.member.service;

import com.codingrecipe.member.repository.OrderRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class OrderService {

    @Autowired
    private OrderRepository orderRepository;

    public List<Map<String, Object>> getOrderProducts() {
        return orderRepository.getOrderProducts();
    }

    public int getAvailablePoints(int userId) {
        return orderRepository.getAvailablePoints(userId);
    }

    public List<Map<String, Object>> getCoupons(int userId) {
        return orderRepository.getCoupons(userId);
    }

    public int saveOrder(String name, String phone, String address, String detailAddress,
                         String request, int originalPrice, int shippingFee, int usedPoints,
                         int couponDiscount, int finalAmount, String paymentMethod) {
        return orderRepository.saveOrder(name, phone, address, detailAddress, request, originalPrice,
                shippingFee, usedPoints, couponDiscount, finalAmount, paymentMethod);
    }

    public Map<String, Object> getOrderById(int orderId) {
        return orderRepository.getOrderById(orderId);
    }

    public List<Map<String, Object>> getOrderProductsByOrderId(int orderId) {
        return orderRepository.getOrderProductsByOrderId(orderId);
    }
}
