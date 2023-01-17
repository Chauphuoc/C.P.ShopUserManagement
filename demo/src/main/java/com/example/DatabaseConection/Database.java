package com.example.DatabaseConection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
    private static Connection connection = null;
    protected static String jdbcURL = "jdbc:mysql://localhost:3306/caseStudy_Module3";
    protected static String jdbcUsername = "root";
    protected static String jdbcPassword = "cronaldo";

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        if (connection == null) {
            Connection connection = null;
            try {
                Class.forName("com.mysql.jdbc.Driver");
                connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (ClassNotFoundException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            return connection;
        }
        return connection;
    }

    public static void closeConnection(Connection c) {
        try {
            if (c != null) {
                c.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
