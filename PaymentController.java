package com.codingrecipe.member.controller;

import com.codingrecipe.member.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Map;

@Controller
public class PaymentController {

    @Autowired
    private OrderService orderService;

    @GetMapping("/emotioncastle/payment")
    public String showPaymentPage(Model model) {
        model.addAttribute("orderProducts", orderService.getOrderProducts());
        model.addAttribute("availablePoints", orderService.getAvailablePoints(1)); // 예: 유저 ID 1
        model.addAttribute("coupons", orderService.getCoupons(1)); // 예: 유저 ID 1
        return "payment"; // JSP 파일
    }

    @PostMapping("/emotioncastle/payment")
    public String processPayment(
            String name, String phone, String address, String detailAddress,
            String request, int originalPrice, int shippingFee, int usedPoints,
            int couponDiscount, int finalAmount, String paymentMethod,
            Model model) {

        // 주문 저장
        int orderId = orderService.saveOrder(name, phone, address, detailAddress, request, originalPrice,
                shippingFee, usedPoints, couponDiscount, finalAmount, paymentMethod);

        // 결제 완료 페이지로 리다이렉트
        return "redirect:/emotioncastle/payment-complete?orderId=" + orderId;
    }
}
