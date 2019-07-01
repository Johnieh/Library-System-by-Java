package com.library.admin;

import java.sql.*;
import java.util.HashMap;

import com.mysql.cj.protocol.Resultset;

public class systemDao {
	final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	final String DB_URL = "jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC";
	final String USER = "root";
	final String PWD = "123456";
	final HashMap<String,String> inform = new HashMap<String,String>();
	public HashMap<String,String> find(){
		Connection conn = null;
		PreparedStatement pst = null;
		try{
            // 注册 JDBC 驱动
            Class.forName("com.mysql.jdbc.Driver");
            // 打开链接
            conn = DriverManager.getConnection(DB_URL,USER,PWD);
            // 执行查询
            String sql;
            sql = "select * from systemchange";
            pst = (PreparedStatement) conn.prepareStatement(sql);
            Resultset result = (Resultset) pst.executeQuery(sql);
            while(((ResultSet) result).next()) {
            	inform.put("fine", ((ResultSet) result).getString("fine"));
            	inform.put("time", ((ResultSet) result).getString("day"));
            }
            // 完成后关闭
            conn.setAutoCommit(true);
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
                if(pst!=null) pst.close();
            }catch(SQLException se2){
            	// 什么都不做
            }
            try{
                if(conn!=null) conn.close();
            }catch(SQLException se){
                se.printStackTrace();
            }
        }
		return inform;
	}
}
