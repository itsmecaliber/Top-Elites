package com.DB;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {    
    private static Connection conn;

    public static Connection getConn() {
        try {
            // Load the MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Get database connection details from environment variables
            String dbHost = System.getenv("mysql.railway.internal"); // e.g., your-database-name.up.railway.app
            String dbPort = System.getenv("3306"); // e.g., 3306
            String dbName = System.getenv("railway"); // e.g., top-elites
            String dbUsername = System.getenv("root"); // e.g., root
            String dbPassword = System.getenv("vYLMJBsqMTioPIDvnPQnBacvCukPtccj"); // e.g., your-password

            // Construct the connection URL
            String url = "jdbc:mysql://" + dbHost + ":" + dbPort + "/" + dbName;

            // Get the connection
            conn = DriverManager.getConnection(url, dbUsername, dbPassword);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
}
