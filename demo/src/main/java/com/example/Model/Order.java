package com.example.Model;

public class Order extends Product {
    private int orderId;
    private String uName;
    private String uAddress;
    private String uPhone;
    private int uID;
    private int quantity;
    private String date;

    public Order() {
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getuAddress() {
        return uAddress;
    }

    public void setuAddress(String uAddress) {
        this.uAddress = uAddress;
    }

    public String getuPhone() {
        return uPhone;
    }

    public void setuPhone(String uPhone) {
        this.uPhone = uPhone;
    }

    public Order(int orderId, int uID, int quantity, String date) {
        this.orderId = orderId;
        this.uID = uID;
        this.quantity = quantity;
        this.date = date;
    }

    public Order(int id, String name, String category,String uName,String uPhone,String address, double price, String image, int orderId, int uID, int quantity, String date) {
        super(id, name, category, price, image);
        this.orderId = orderId;
        this.uName = uName;
        this.uID = uID;
        this.uPhone = uPhone;
        this.uAddress = address;
        this.quantity = quantity;
        this.date = date;
    }

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public int getuID() {
        return uID;
    }

    public void setuID(int uID) {
        this.uID = uID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderId=" + orderId +
                ", uID=" + uID +
                ", quantity=" + quantity +
                ", date='" + date + '\'' +
                '}';
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
