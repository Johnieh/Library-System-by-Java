package com.library.admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class fineDao {
	final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	final String DB_URL = "jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC";
	final String USER = "root";
	final String PWD = "123456";
	public void changeFine(String num) {
		Connection conn = null;
		Statement stmt = null;
		 try{
	            // 注册 JDBC 驱动
	            Class.forName("com.mysql.jdbc.Driver");
	        
	            // 打开链接
	            conn = DriverManager.getConnection(DB_URL,USER,PWD);
	        
	            // 执行查询
	            stmt = conn.createStatement();
	            String sql;
	            sql = "update systemchange set fine="+num+" where changeid ='20181013'";
//	            System.out.println(sql);
	            final  int result = stmt.executeUpdate(sql);
//	            System.out.println(result);
	            // 完成后关闭
	            conn.setAutoCommit(true);
	            stmt.close();
	            conn.close();
	        }catch(SQLException se){
	            // 处理 JDBC 错误
	            se.printStackTrace();
	        }catch(Exception e){
	            // 处理 Class.forName 错误
	            e.printStackTrace();
	        }finally{
	            // 关闭资源
	            try{
	                if(stmt!=null) stmt.close();
	            }catch(SQLException se2){
	            	// 什么都不做
	            }
	            try{
	                if(conn!=null) conn.close();
	            }catch(SQLException se){
	                se.printStackTrace();
	            }
	        }
	}
}
