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
            // ע�� JDBC ����
            Class.forName("com.mysql.jdbc.Driver");
            // ������
            conn = DriverManager.getConnection(DB_URL,USER,PWD);
            // ִ�в�ѯ
            String sql;
            sql = "select * from reader where rid="+"'"+userId+"'";
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet result = pst.executeQuery();
            //��ȡ���ݿ���Ϣ
            result.next();
            String id = result.getString("rid");
            String name = result.getString("rname");
            String pwd = result.getString("rpwd");
            String email = result.getString("remail");
            String phone = result.getString("rphone");
            String account = result.getString("raccount");
            //������д��hashMap
            user.put("id", id);
            user.put("name", name);
            user.put("pwd", pwd);
            user.put("email", email);
            user.put("num",phone);
            user.put("account",account);
            // ��ɺ�ر�
            conn.setAutoCommit(true);
            result.close();
            pst.close();
            conn.close();
        }catch(SQLException se){
            // ���� JDBC ����
            se.printStackTrace();
        }catch(Exception e){
            // ���� Class.forName ����
            e.printStackTrace();
        }finally{
//        	System.out.println("Error");
        }
		//����hashMap--Book
		return user;
	}
}
