package com.codingrecipe.member.model;

public class Order {
    private String name;
    private String phone;
    private String address;
    private String detailAddress;
    private String request;

    // Getters and Setters
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getDetailAddress() { return detailAddress; }
    public void setDetailAddress(String detailAddress) { this.detailAddress = detailAddress; }

    public String getRequest() { return request; }
    public void setRequest(String request) { this.request = request; }
}
