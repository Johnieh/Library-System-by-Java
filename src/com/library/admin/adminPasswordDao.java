package com.library.admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.*;

public class adminPasswordDao {
	final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	final String DB_URL = "jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC";
	final String USER = "root";
	final String PWD = "123456";
	public boolean getAdmin(String aId,String aPwd) {
		Connection conn = null;
		Statement stmt = null;
		try{
            // ע�� JDBC ����
            Class.forName("com.mysql.jdbc.Driver");
            // ������
            conn = DriverManager.getConnection(DB_URL,USER,PWD);
            // ִ�в�ѯ
            String sql;
            sql = "select adminId,adminPassword from systemchange";
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet result = pst.executeQuery();
            while(result.next()) {
            	if(aId.equals(result.getString("adminId"))&&aPwd.equals(result.getString("adminPassword"))) {
            		conn.setAutoCommit(true);
                    result.close();
                    pst.close();
                    System.out.println("��ѯ�ɹ�");
                    return true;
            	}else {
            		continue;
            	}
            }
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
//		System.out.println("δ�ҵ�����");
		return false;
	}
}
