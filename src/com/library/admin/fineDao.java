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
	            // ע�� JDBC ����
	            Class.forName("com.mysql.jdbc.Driver");
	        
	            // ������
	            conn = DriverManager.getConnection(DB_URL,USER,PWD);
	        
	            // ִ�в�ѯ
	            stmt = conn.createStatement();
	            String sql;
	            sql = "update systemchange set fine="+num+" where changeid ='20181013'";
//	            System.out.println(sql);
	            final  int result = stmt.executeUpdate(sql);
//	            System.out.println(result);
	            // ��ɺ�ر�
	            conn.setAutoCommit(true);
	            stmt.close();
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
	                if(stmt!=null) stmt.close();
	            }catch(SQLException se2){
	            	// ʲô������
	            }
	            try{
	                if(conn!=null) conn.close();
	            }catch(SQLException se){
	                se.printStackTrace();
	            }
	        }
	}
}
