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
            // ע�� JDBC ����
            Class.forName("com.mysql.jdbc.Driver");
            // ������
            conn = DriverManager.getConnection(DB_URL,USER,PWD);
            // ִ�в�ѯ
            String sql;
            sql = "select * from librarian where lname="+"'"+librarianName+"'";
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet result = pst.executeQuery();
            //��ȡ���ݿ���Ϣ
            result.next();
            String id = result.getString("lid");
//            System.out.println(id);
            String name = result.getString("lname");
            String password = result.getString("lpwd");
            String email = result.getString("lemail");
            String phone = result.getString("lphone");
            String priority = result.getString("lpriority");
            //������д��hashMap
            librarian.put("lid", id);
            librarian.put("lname", name);
            librarian.put("lpwd", password);
            librarian.put("lemail", email);
            librarian.put("lphone", phone);
            librarian.put("lpriority", priority);
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
		return librarian;
	}
}
