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
            // ע�� JDBC ����
            Class.forName("com.mysql.jdbc.Driver");
            // ������
            conn = DriverManager.getConnection(DB_URL,USER,PWD);
            // ִ�в�ѯ
            String sql;
            sql = "select * from systemchange";
            pst = (PreparedStatement) conn.prepareStatement(sql);
            Resultset result = (Resultset) pst.executeQuery(sql);
            while(((ResultSet) result).next()) {
            	inform.put("fine", ((ResultSet) result).getString("fine"));
            	inform.put("time", ((ResultSet) result).getString("day"));
            }
            // ��ɺ�ر�
            conn.setAutoCommit(true);
            pst.close();
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
                if(pst!=null) pst.close();
            }catch(SQLException se2){
            	// ʲô������
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
