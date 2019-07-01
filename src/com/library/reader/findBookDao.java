package com.library.reader;
import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class findBookDao {
	final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	final String DB_URL = "jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC";
	final String USER = "root";
	final String PWD = "123456";
	public boolean checkBook(String bookName) {
		Connection conn = null;
		Statement stmt = null;
		try{
            // ע�� JDBC ����
            Class.forName("com.mysql.cj.jdbc.Driver");
            // ������
            conn = DriverManager.getConnection(DB_URL,USER,PWD);
            // ִ�в�ѯ
            String sql;
            sql = "select bname from book";
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet result = pst.executeQuery();
            while(result.next()) {
            	if(bookName.equals(result.getString("bname"))) {
            		conn.setAutoCommit(true);
                    result.close();
                    pst.close();
//                    System.out.println("��ѯ�ɹ�");
                    return true;
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
