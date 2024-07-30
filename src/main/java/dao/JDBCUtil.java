package dao;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBCUtil {
  public static Connection getConnection() {
    Connection c = null;
    try {
      DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
      String url = "jdbc:mySQL://localhost:3306/jsp_banking";
      String username = "root";
      String password = "Zuka03@*";
      c = DriverManager.getConnection(url, username, password);
    } catch (Exception e) {
      e.printStackTrace();
    }
    return c;
  }

  public static void closeConnection(Connection c) {
    try {
      if (c!=null)
      {
        c.close();
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  public static void printInfo(Connection c) {
    try {
      if(c!=null) {
        DatabaseMetaData mtdt = c.getMetaData();
        System.out.println(mtdt.getDatabaseProductName());
        System.out.println(mtdt.getDatabaseProductVersion());
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
}