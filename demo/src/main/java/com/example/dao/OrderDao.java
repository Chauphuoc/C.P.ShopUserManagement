package com.example.dao;

import com.example.DatabaseConection.Database;
import com.example.Model.Order;
import com.example.Model.Product;
import com.example.Model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {
    private Connection connection;
    private String query;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    public OrderDao(Connection con) {
        this.connection = con;
    }

    private int noOfRecords;

    public boolean insertOrder(Order model) {
        boolean result = false;
        try {
            query = "insert into orders (p_id,u_id,o_quantity,o_date) values(?,?,?,?)";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, model.getId());
            preparedStatement.setInt(2, model.getuID());
            preparedStatement.setInt(3, model.getQuantity());
            preparedStatement.setString(4, model.getDate());
            preparedStatement.executeUpdate();
            result = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public List<Order> userOrders(int id, User user) {
        List<Order> list = new ArrayList<>();
        try {
            query = "select * from orders where u_id=? order by orders.o_id desc";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                Order order = new Order();
                ProductDao productDao = new ProductDao(Database.getConnection());
                int pID = resultSet.getInt("p_id");

                Product product = productDao.findProductByID(pID);
                order.setId(product.getId());
                order.setName(product.getName());
                order.setuName(user.getName());
                order.setOrderId(resultSet.getInt("o_id"));
                order.setuID(resultSet.getInt("u_id"));
                order.setPrice(product.getPrice() * resultSet.getInt("o_quantity"));
                order.setQuantity(resultSet.getInt("o_quantity"));
                order.setDate(resultSet.getString("o_date"));
                list.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public void cancelOrder(int id) {
        try {
            query = "delete from orders where o_id=?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e.getMessage());
        }
    }

    public List<Order> selectOrderPagging(int offset, int noOfRecord, User user) {

            query =  "select SQL_CALC_FOUND_ROWS * from orders  limit "
                    +offset+", "+ noOfRecord;
            List<Order> orderList = new ArrayList<>();
            Order order = null;
            Statement sttm = null;
            try {
                sttm = connection.createStatement();
                resultSet = sttm.executeQuery(query);
                while (resultSet.next()) {
                    order = new Order();
                    ProductDao productDao = new ProductDao(Database.getConnection());
                    int pID = resultSet.getInt("p_id");
                    Product product = productDao.findProductByID(pID);
                    order.setId(product.getId());
                    order.setName(product.getName());
                    order.setuName(user.getName());
                    order.setOrderId(resultSet.getInt("o_id"));
                    order.setuID(resultSet.getInt("u_id"));
                    order.setPrice(product.getPrice() * resultSet.getInt("o_quantity"));
                    order.setQuantity(resultSet.getInt("o_quantity"));
                    order.setDate(resultSet.getString("o_date"));
                    orderList.add(order);
                }
                resultSet.close();
                resultSet = sttm.executeQuery("SELECT  found_rows() ");
                if (resultSet.next()) {
                    noOfRecords = resultSet.getInt(1);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
            finally {
                try {
                    if (sttm != null) {
                        sttm.close();
                    }
                    if (connection != null) {
                        connection.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        return orderList;
    }

    public int getNoOfRecords() {
        return noOfRecords;
    }
}
