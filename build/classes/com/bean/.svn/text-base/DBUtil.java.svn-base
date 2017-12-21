package com.bean;

import java.sql.*;

//Data Base Util Class for Getting and Closing Connection.
public class DBUtil {

	private static String url = "jdbc:oracle:thin:@172.24.137.13:1521:XE";
	private static String username = "EJ1370262";
	private static String password = "EJ1370262";
	private static Connection connection = null;
	
//Method to GET a Connection.
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
		
			Class.forName("oracle.jdbc.driver.OracleDriver");
			connection = DriverManager.getConnection( url,username, password);
		
		return connection;
	}

//Method to CLOSE a Connection.
	public static void closeConnection(Connection connection) throws SQLException{
		connection.close();
	}
	
	
}
