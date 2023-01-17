package com.example.servlet;

import com.example.DatabaseConection.Database;
import com.example.Model.Cart;
import com.example.Model.Order;
import com.example.Model.User;
import com.example.dao.OrderDao;
import com.sun.org.apache.xpath.internal.operations.Or;

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

@WebServlet(urlPatterns = "/order-now")
public class OrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try (PrintWriter out = resp.getWriter()) {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            Date date = new Date();

            User user = (User) req.getSession().getAttribute("user");

            if (user != null) {
                int productId = Integer.parseInt(req.getParameter("id"));
                int productQuantity = Integer.parseInt(req.getParameter("quantity"));
                if (productQuantity <= 0) {
                    productQuantity = 1;
                }


                Order orderModel = new Order();
                orderModel.setId(productId);
                orderModel.setuID((int) user.getId());
                orderModel.setQuantity(productQuantity);
                orderModel.setDate(formatter.format(date));

                OrderDao orderDao = new OrderDao(Database.getConnection());
                boolean result = orderDao.insertOrder(orderModel);
//                Nếu order thành công thì sẽ remove product ra khỏi cart
                if (result) {
                    ArrayList<Cart> cart_list = (ArrayList<Cart>) req.getSession().getAttribute("cart-list");
                    if (cart_list != null) {
                        for (Cart c : cart_list) {
                            if (c.getId() == productId) {
                                cart_list.remove(cart_list.indexOf(c));
                                break;
                            }
                        }
                    }
                    resp.sendRedirect("orderWeb.jsp");
                } else {
                    out.println("order failed");
                }
            } else {
                resp.sendRedirect("account.jsp");
            }

        } catch (ClassNotFoundException|SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

//    private void ListOrderPagging(HttpServletRequest request, HttpServletResponse response) throws SQLException, ClassNotFoundException, IOException {
//        int page = 1;
//        int recordPerPage = 3;
//        OrderDao orderDao = new OrderDao(Database.getConnection());
//        User user = (User) request.getSession().getAttribute("user");
//        if (request.getParameter("page") != null) {
//            page = Integer.parseInt(request.getParameter("page"));
//        }
//        List<Order> orderList = orderDao.selectUserPagging((page - 1) * recordPerPage, recordPerPage, user);
//        int noOfRecords = orderDao.getNoOfRecords();
//        int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordPerPage);
//        request.getSession().setAttribute("orderlist",orderList);
//        request.getSession().setAttribute("noOfPages",noOfPages);
//        request.getSession().setAttribute("currentpage",page);
//        response.sendRedirect("orderWeb-pagging.jsp");
//
//    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
