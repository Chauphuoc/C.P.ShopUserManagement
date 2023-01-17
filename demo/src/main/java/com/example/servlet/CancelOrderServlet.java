package com.example.servlet;

import com.example.DatabaseConection.Database;
import com.example.dao.OrderDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(urlPatterns = "/cancel-order")
public class CancelOrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try(PrintWriter out = resp.getWriter()) {
            String id = req.getParameter("id");
            if (id != null) {
                OrderDao orderDao = new OrderDao(Database.getConnection());
                orderDao.cancelOrder(Integer.parseInt(id));
            }
            resp.sendRedirect("orderWeb.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
