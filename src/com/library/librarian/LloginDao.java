package com.library.librarian;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class LloginDao {
	final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	final String DB_URL = "jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC";
	final String USER = "root";
	final String PWD = "123456";
	public boolean getUser(String lId,String lPwd) {
		Connection conn = null;
		Statement stmt = null;
		try{
            // ע�� JDBC ����
            Class.forName("com.mysql.jdbc.Driver");
            // ������
            conn = DriverManager.getConnection(DB_URL,USER,PWD);
            // ִ�в�ѯ
            String sql;
            sql = "select lid,lpwd from librarian";
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet result = pst.executeQuery();
            while(result.next()) {
            	if(lId.equals(result.getString("lid"))&&lPwd.equals(result.getString("lpwd"))) {
            		conn.setAutoCommit(true);
                    result.close();
                    pst.close();
//                    System.out.println("��ѯ�ɹ�");
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
