package com.example.servlet;

import com.example.DatabaseConection.Database;
import com.example.Model.Order;
import com.example.Model.User;
import com.example.dao.OrderDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(urlPatterns = "/show-order-paging")
public class showOrderPaging extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user = (User) req.getSession().getAttribute("user");
        int page = 1;
        int recordPerPage = 3;
        OrderDao orderDao = null;
        try {
            orderDao = new OrderDao(Database.getConnection());
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        if (req.getParameter("page") != null) {
            page = Integer.parseInt(req.getParameter("page"));
        }
        List<Order> orderList = orderDao.selectOrderPagging((page - 1) * recordPerPage, recordPerPage, user);
        int noOfRecords = orderDao.getNoOfRecords();
        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordPerPage);
        req.getSession().setAttribute("orderlist",orderList);
        req.getSession().setAttribute("noOfPages",noOfPages);
        req.getSession().setAttribute("currentpage",page);
        resp.sendRedirect("orderWeb-pagging.jsp");
    }
}
