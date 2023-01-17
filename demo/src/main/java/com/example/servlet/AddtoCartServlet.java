package com.example.servlet;

import com.example.Model.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/add-to-cart")
public class AddtoCartServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        PrintWriter out = resp.getWriter();
        ArrayList<Cart> cartList = new ArrayList<>();
        List<String> message = new ArrayList<>();
        int id = Integer.parseInt(req.getParameter("id"));
        Cart cart = new Cart();
        cart.setId(id);
        cart.setQuantity(1);

        HttpSession session = req.getSession();
        ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
        if (cart_list == null) {
            cartList.add(cart);
            session.setAttribute("cart-list", cartList);
            resp.sendRedirect("Home.jsp");
        } else {
            cartList = cart_list;
            boolean exist = false;
            for (Cart c : cartList) {
                if (c.getId() == id) {
                    exist = true;
//                    message.add("Item already exist in cart");
                    out.println("<h3 style='color:crimson; text-align:center'>Item already exist in cart.<a href='myCart.jsp'>Go to your cart</a></h3>");
//                    req.getSession().setAttribute("message",message);
//                    resp.sendRedirect("Home.jsp");
                }
            }
            if (!exist) {
                cartList.add(cart);
                resp.sendRedirect("Home.jsp");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {


    }
}
