package com.example.servlet;

import com.example.DatabaseConection.Database;
import com.example.Model.User;
import com.example.Util.validateUtil;
import com.example.dao.UserDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = "/register")
public class registerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            User user = new User();
            List<String> message = new ArrayList<>();
            List<String> errors = new ArrayList<>();
            validateFullName(req,errors,user);
            user.setPhone(req.getParameter("phonenumber"));
            valiDateEmail(req,errors,user);
            user.setAddress(req.getParameter("address"));
            valiDatePassword(req,errors,user);


            if (errors.size() != 0) {
                req.getSession().setAttribute("errors",errors);
            }else{
                message.add("Register successfull");
                req.getSession().setAttribute("message",message );
                UserDao userDao = new UserDao(Database.getConnection());
                boolean result = userDao.insertUser(user);
                if (result) {
                    req.getSession().setAttribute("user",user);
                }
            }
            resp.sendRedirect("account.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void validateFullName(HttpServletRequest req, List<String> errors, User user) {
        String fullName = req.getParameter("fullname");
        if (!validateUtil.isFulllNameValid(fullName)) {
            errors.add("FullName has 8-10 letters");
        }
        user.setName(fullName);
    }

    private void valiDateEmail(HttpServletRequest req, List<String> errors, User user) {
        String email = req.getParameter("username");
        if (!validateUtil.isEmailValid(email)) {
            errors.add("Email is not valid");
        }
        user.setEmail(email);
    }

    private void valiDatePassword(HttpServletRequest req, List<String> errors, User user) {
        String password = req.getParameter("password");
        if (!validateUtil.isPasswordValid(password)) {
            errors.add("Password is not valid");
        }
        user.setPassword(password);
    }
}
