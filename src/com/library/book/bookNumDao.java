package com.library.book;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class bookNumDao {
	final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	final String DB_URL = "jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC";
	final String USER = "root";
	final String PWD = "123456";
	public String count(String bookIsbn){
		String bookCount = "";
		Connection conn = null;
		PreparedStatement pStatement = null;
		try{
            // 注册 JDBC 驱动
            Class.forName("com.mysql.jdbc.Driver");     
            // 打开链接
            conn = DriverManager.getConnection(DB_URL,USER,PWD);     
            // 执行查询
            String sql = "select * from book where bisbn="+"'"+bookIsbn+"'";
            pStatement = conn.prepareStatement(sql);
            ResultSet result = pStatement.executeQuery();
            result.last();
            int count = result.getRow()+1;
            bookCount = bookCount+count;
            // 完成后关闭
            conn.setAutoCommit(true);
            result.close();
            pStatement.close();
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
                if(pStatement!=null) pStatement.close();
            }catch(SQLException se2){
            	// 什么都不做
            }
            try{
                if(conn!=null) conn.close();
            }catch(SQLException se){
                se.printStackTrace();
            }
        }
		return bookCount;
	}
}
