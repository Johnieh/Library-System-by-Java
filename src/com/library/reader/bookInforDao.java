package com.library.reader;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;

public class bookInforDao {
	final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	final String DB_URL = "jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC";
	final String USER = "root";
	final String PWD = "123456";
	final HashMap<String,String> book = new HashMap<String,String>();
	public HashMap<String,String> bookInformation(String bookName){
		Connection conn = null;
		try{
            // ע�� JDBC ����
            Class.forName("com.mysql.jdbc.Driver");
            // ������
            conn = DriverManager.getConnection(DB_URL,USER,PWD);
            // ִ�в�ѯ
            String sql;
            sql = "select * from book where bname="+"'"+bookName+"'";
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet result = pst.executeQuery();
            //��ȡ���ݿ���Ϣ
            result.next();
            String id = result.getString("bid");
//            System.out.println(id);
            String name = result.getString("bname");
            String author = result.getString("bauthor");
            String isbn = result.getString("bisbn");
            String num = result.getString("bnum");
            //������д��hashMap
            book.put("id", id);
            book.put("name", name);
            book.put("author", author);
            book.put("isbn", isbn);
            book.put("num",num);
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
		return book;
	}
}
