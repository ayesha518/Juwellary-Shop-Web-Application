package cn.techtutorial.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbCon {
  private static Connection connection = null;

  public static  Connection getConnection()throws ClassNotFoundException{
	  if(connection==null) {

		  try {
			  Class.forName("com.mysql.cj.jdbc.Driver");
			  connection = DriverManager.getConnection(
					    "jdbc:mysql://localhost:3306/juwellary_cart", "root","");

		    System.out.print("connected");
		  } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	  }
	return connection;
  }
}

