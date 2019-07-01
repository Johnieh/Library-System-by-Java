package com.library.reader;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class findBookDao {
	final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	final String DB_URL = "jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC";
	final String USER = "root";
	final String PWD = "123456";
	public boolean checkBook(String bookName) {
		Connection conn = null;
		Statement stmt = null;
		try{
            // 注册 JDBC 驱动
            Class.forName("com.mysql.cj.jdbc.Driver");
            // 打开链接
            conn = DriverManager.getConnection(DB_URL,USER,PWD);
            // 执行查询
            String sql;
            sql = "select bname from book";
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet result = pst.executeQuery();
            while(result.next()) {
            	if(bookName.equals(result.getString("bname"))) {
            		conn.setAutoCommit(true);
                    result.close();
                    pst.close();
//                    System.out.println("查询成功");
                    return true;
            	}
            }
            // 完成后关闭
            conn.setAutoCommit(true);
            result.close();
            pst.close();
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
//		System.out.println("未找到该书");
		return false;
	}
}
