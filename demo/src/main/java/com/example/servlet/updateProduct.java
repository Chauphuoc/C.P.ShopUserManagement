//package com.example.servlet;
//
//import com.example.DatabaseConection.Database;
//import com.example.Model.Product;
//import com.example.dao.ProductDao;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.sql.SQLException;
//
//@WebServlet(urlPatterns = "/update-product")
//public class updateProduct extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.setContentType("text/html");
//        PrintWriter out = resp.getWriter();
//
//        try {
//            Product product = (Product) req.getSession().getAttribute("product");
//            String nameProduct = req.getParameter("productname");
//            String category = req.getParameter("category");
//            double price = Double.parseDouble(req.getParameter("price"));
//            String image = req.getParameter("image");
//
//
//            product.setName(nameProduct);
//            product.setCategory(category);
//            product.setPrice(price);
//            product.setImage(image);
//            productDao.updateProduct(id,product);
//            resp.sendRedirect("edit-product.jsp");
//
//        } catch (ClassNotFoundException e) {
//            throw new RuntimeException(e);
//        } catch (SQLException e) {
//            throw new RuntimeException(e);
//        }
//    }
//}
