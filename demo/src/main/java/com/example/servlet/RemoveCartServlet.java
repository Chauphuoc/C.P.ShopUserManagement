package com.example.servlet;

import com.example.Model.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(urlPatterns = "/remove-from-cart")
public class RemoveCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (PrintWriter out = resp.getWriter()){
            String id = req.getParameter("id");
            if (id != null) {
                ArrayList<Cart> cart_list = (ArrayList<Cart>) req.getSession().getAttribute("cart-list");
                if (cart_list != null) {
                    for (Cart c : cart_list) {
                        if (c.getId() == Integer.parseInt(id)) {
                            cart_list.remove(cart_list.indexOf(c));
                            break;
                        }
                    }
                    resp.sendRedirect("myCart.jsp");
                }
            } else {
                resp.sendRedirect("myCart.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
