package com.codingrecipe.member.controller;

import com.codingrecipe.member.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class PaymentcompleteController {

    @Autowired
    private OrderService orderService;

    @GetMapping("/emotioncastle/payment-complete")
    public String showPaymentCompletePage(@RequestParam("orderId") int orderId, Model model) {
        // 주문 정보를 조회
        Map<String, Object> order = orderService.getOrderById(orderId);

        // 모델에 데이터 추가
        model.addAttribute("orderNumber", order.get("order_number"));
        model.addAttribute("orderItems", orderService.getOrderProductsByOrderId(orderId));
        model.addAttribute("receiverName", order.get("name"));
        model.addAttribute("receiverPhone", order.get("phone"));
        model.addAttribute("deliveryAddress", order.get("address") + " " + order.get("detail_address"));
        model.addAttribute("deliveryRequest", order.get("request"));
        model.addAttribute("originalPrice", order.get("original_price"));
        model.addAttribute("shippingFee", order.get("shipping_fee"));
        model.addAttribute("usedPoints", order.get("used_points"));
        model.addAttribute("couponDiscount", order.get("coupon_discount"));
        model.addAttribute("finalAmount", order.get("final_amount"));
        model.addAttribute("paymentMethod", order.get("payment_method"));

        return "Paymentcomplete"; // JSP 파일 이름
    }
}
