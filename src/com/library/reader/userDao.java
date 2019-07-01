package com.library.reader;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

public class userDao {
	final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	final String DB_URL = "jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC";
	final String USER = "root";
	final String PWD = "123456";
	final HashMap<String,String> user = new HashMap<String,String>();
	public HashMap<String,String> userInformation(String userId){
		Connection conn = null;
		try{
            // 注册 JDBC 驱动
            Class.forName("com.mysql.jdbc.Driver");
            // 打开链接
            conn = DriverManager.getConnection(DB_URL,USER,PWD);
            // 执行查询
            String sql;
            sql = "select * from reader where rid="+"'"+userId+"'";
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet result = pst.executeQuery();
            //读取数据库信息
            result.next();
            String id = result.getString("rid");
            String name = result.getString("rname");
            String pwd = result.getString("rpwd");
            String email = result.getString("remail");
            String phone = result.getString("rphone");
            String account = result.getString("raccount");
            //将数据写入hashMap
            user.put("id", id);
            user.put("name", name);
            user.put("pwd", pwd);
            user.put("email", email);
            user.put("num",phone);
            user.put("account",account);
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
		return user;
	}
}
