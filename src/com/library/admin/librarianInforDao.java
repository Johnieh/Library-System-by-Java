package com.library.admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

public class librarianInforDao {
	final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	final String DB_URL = "jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC";
	final String USER = "root";
	final String PWD = "123456";
	final HashMap<String,String> librarian = new HashMap<String,String>();
	public HashMap<String,String> librarianInformation(String librarianName){
		Connection conn = null;
		try{
            // 注册 JDBC 驱动
            Class.forName("com.mysql.jdbc.Driver");
            // 打开链接
            conn = DriverManager.getConnection(DB_URL,USER,PWD);
            // 执行查询
            String sql;
            sql = "select * from librarian where lname="+"'"+librarianName+"'";
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet result = pst.executeQuery();
            //读取数据库信息
            result.next();
            String id = result.getString("lid");
//            System.out.println(id);
            String name = result.getString("lname");
            String password = result.getString("lpwd");
            String email = result.getString("lemail");
            String phone = result.getString("lphone");
            String priority = result.getString("lpriority");
            //将数据写入hashMap
            librarian.put("lid", id);
            librarian.put("lname", name);
            librarian.put("lpwd", password);
            librarian.put("lemail", email);
            librarian.put("lphone", phone);
            librarian.put("lpriority", priority);
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
//        	System.out.println("Error");
        }
		//返回hashMap--Book
		return librarian;
	}
}
