package com.example.dao;

import com.example.Model.Cart;
import com.example.Model.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ProductDao {
    private Connection connection;
    private String query;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    public ProductDao(Connection connection) {
        this.connection = connection;
    }

    public List<Product> getAllProduct() {
        List<Product> products = new ArrayList<Product>();
        try {
            query = "select * from products";
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Product row = new Product();
                row.setId(resultSet.getInt("id"));
                row.setName(resultSet.getString("name"));
                row.setCategory(resultSet.getString("category"));
                row.setPrice(resultSet.getDouble("price"));
                row.setImage(resultSet.getString("image"));
                products.add(row);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    public List<Cart> getCartProducts(ArrayList<Cart> cartList) {
        List<Cart> products = new ArrayList<Cart>();
        try {
            if (cartList.size() > 0) {
                for (Cart item : cartList) {
                    query = "select * from products where id=?";
                    preparedStatement = connection.prepareStatement(query);
                    preparedStatement.setInt(1,item.getId());
                    resultSet = preparedStatement.executeQuery();
                    while (resultSet.next()) {
                        Cart row = new Cart();
                        row.setId(resultSet.getInt("id"));
                        row.setName(resultSet.getString("name"));
                        row.setCategory(resultSet.getString("category"));
                        row.setImage(resultSet.getString("image"));
                        row.setPrice(resultSet.getDouble("price"));
                        row.setQuantity(item.getQuantity());
                        products.add(row);

                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }

    public double getTotalCartPrice(ArrayList<Cart> cartList) {
        double sum = 0;
        try {
            if (cartList != null) {
                for (Cart item : cartList) {
                    query = "select price from products where id=?";
                    preparedStatement = connection.prepareStatement(query);
                    preparedStatement.setInt(1,item.getId());
                    resultSet = preparedStatement.executeQuery();
                    while (resultSet.next()) {
                        sum += resultSet.getDouble("price") * item.getQuantity();
                    }
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
            e.getMessage();
        }
        return sum;
    }

    public Product findProductByID(int id) {
        Product row = new Product();
        try {
            query = "select * from products where id=?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1,id);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                row.setId(resultSet.getInt("id"));
                row.setName(resultSet.getString("name"));
                row.setImage(resultSet.getString("image"));
                row.setCategory(resultSet.getString("category"));
                row.setPrice(resultSet.getDouble("price"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return row;
    }

    public void updateProduct(int id,Product product) {
        //update customer set name = ?,dateofbirth = ?, category = ?, price = ? , image = ? where id =?
        try {
            query = "update products set name = ?,  category = ?, price = ? , image = ? where id =?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1,product.getName());
            preparedStatement.setString(2,product.getCategory());
            preparedStatement.setDouble(3,product.getPrice());
            preparedStatement.setString(4,product.getImage());
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
