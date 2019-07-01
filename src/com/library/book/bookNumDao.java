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
            // ע�� JDBC ����
            Class.forName("com.mysql.jdbc.Driver");     
            // ������
            conn = DriverManager.getConnection(DB_URL,USER,PWD);     
            // ִ�в�ѯ
            String sql = "select * from book where bisbn="+"'"+bookIsbn+"'";
            pStatement = conn.prepareStatement(sql);
            ResultSet result = pStatement.executeQuery();
            result.last();
            int count = result.getRow()+1;
            bookCount = bookCount+count;
            // ��ɺ�ر�
            conn.setAutoCommit(true);
            result.close();
            pStatement.close();
            conn.close();
        }catch(SQLException se){
            // ���� JDBC ����
            se.printStackTrace();
        }catch(Exception e){
            // ���� Class.forName ����
            e.printStackTrace();
        }finally{
            // �ر���Դ
            try{
                if(pStatement!=null) pStatement.close();
            }catch(SQLException se2){
            	// ʲô������
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
