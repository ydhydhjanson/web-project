package com.ydh.connection;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;

public class ConnectionManage {
	private Connection cn;
	private static String Driver, UserName, Password,Url;
	
	static{
		try {
			InputStream in = ConnectionManage.class.getClassLoader().getResourceAsStream("db.properties");
			Properties props = new Properties();
			props.load(in);
			 Url = props.getProperty("URL");
			 UserName = props.getProperty("UserName");
			 Password = props.getProperty("Password");
			 Driver = props.getProperty("Driver");
			 Class.forName(Driver);
		} catch (Exception e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
	}
	public  Connection getConnection(){
		try {
			if (cn == null || cn.isClosed()){
				 System.out.println("usr"+Url);
				cn = DriverManager.getConnection(Url,UserName, Password);
			}
		} catch (SQLException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
		}
		
		return cn;
	}
		
	public void close(){
		if (cn != null)
			try {
				cn.close();
			} catch (SQLException e) {
				// TODO 自动生成 catch 块
				e.printStackTrace();
			}
	}
	
	public static void main(String args[]){
		new ConnectionManage();
		
	}
}
