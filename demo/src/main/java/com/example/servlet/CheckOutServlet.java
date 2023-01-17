package com.example.servlet;

import com.example.DatabaseConection.Database;
import com.example.Model.Cart;
import com.example.Model.Order;
import com.example.Model.User;
import com.example.dao.OrderDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(urlPatterns = "/cart-check-out")
public class CheckOutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        try(PrintWriter out = resp.getWriter()){
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();
            ArrayList<Cart> cart_list = (ArrayList<Cart>) req.getSession().getAttribute("cart-list");
            User user = (User) req.getSession().getAttribute("user");
            if(cart_list != null && user!=null) {
                for(Cart c:cart_list) {
                    Order order = new Order();
                    order.setId(c.getId());
                    order.setuID((int) user.getId());
                    order.setQuantity(c.getQuantity());
                    order.setDate(formatter.format(date));

                    OrderDao oDao = new OrderDao(Database.getConnection());
                    boolean result = oDao.insertOrder(order);


                    if(!result) break;
                }
                cart_list.clear();



                resp.sendRedirect("/order-now");
            }else {
                if(user==null) {
                    resp.sendRedirect("account.jsp");
                }
            }
        } catch (ClassNotFoundException|SQLException e) {

            e.printStackTrace();
        }
}}
