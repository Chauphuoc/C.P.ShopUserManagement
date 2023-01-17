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
import java.util.Calendar;

@WebServlet(urlPatterns = "/quantity-inc-dec")
public class QuantityIncDecServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        try {
            String action = req.getParameter("action");
            int id = Integer.parseInt(req.getParameter("id"));
            ArrayList<Cart> cart_list = (ArrayList<Cart>) req.getSession().getAttribute("cart-list");
//            Condition cho action và id tồn tại
            if (action != null && id >= 1) {
                if (action.equals("inc")) {
                    for (Cart cart : cart_list) {
                        if (cart.getId() == id) {
                            int quantity = cart.getQuantity();
                            quantity++;
                            cart.setQuantity(quantity);
                            resp.sendRedirect("myCart.jsp");
                            break;
                        }
                    }
                }

                if (action.equals("dec")) {
                    for (Cart cart : cart_list) {
                        if (cart.getId() == id && cart.getQuantity() > 0) {
                            int quantity = cart.getQuantity();
                            quantity--;
                            cart.setQuantity(quantity);
                            resp.sendRedirect("myCart.jsp");
                            break;
                        }
                        else
                            resp.sendRedirect("myCart.jsp");
                    }
                }
            } else {
                resp.sendRedirect("myCart.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
