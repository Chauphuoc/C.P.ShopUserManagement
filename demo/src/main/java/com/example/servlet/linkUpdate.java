package com.example.servlet;

import com.example.DatabaseConection.Database;
import com.example.Model.Product;
import com.example.dao.ProductDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/link-update-product")
public class linkUpdate extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        ProductDao productDao = null;
        try {
            productDao = new ProductDao(Database.getConnection());
            Product product = productDao.findProductByID(id);
            req.getSession().setAttribute("product",product);
            resp.sendRedirect("edit-product.jsp");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }
}
