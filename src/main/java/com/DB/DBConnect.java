package com.DB;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect {    
    private static Connection conn;

    public static Connection getConn() {
        try {
            // Load the MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Get the database connection details from Railway environment variables
            String dbHost = System.getenv("MYSQL_HOST"); // Railway internal MySQL host
            String dbPort = System.getenv("MYSQL_PORT"); // Port for MySQL, usually 3306
            String dbName = System.getenv("MYSQL_DATABASE"); // Name of the database (e.g., top-elites)
            String dbUsername = System.getenv("MYSQL_USER"); // Username (e.g., root)
            String dbPassword = System.getenv("MYSQL_PASSWORD"); // Password for the MySQL instance

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
