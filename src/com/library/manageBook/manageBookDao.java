package com.library.manageBook;

import java.sql.*;
import java.util.*;
import java.text.*;
import com.library.manageBook.*;
import javax.servlet.*;
public class manageBookDao {
	final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	final String DB_URL = "jdbc:mysql://localhost:3306/library?useSSL=false&serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
	final String USER = "root";
	final String PWD = "123456";
	final Getdate getdate = new Getdate();
	final String time = getdate.getdate();
    ServletRequest request=null;

    
//	����
	public void returnBook(String bookId,String readerId) {
		Connection conn = null;
		Statement statement =null;
		PreparedStatement pStatement= null;
		try{
//			System.out.println("����¹�1");
            // ע��JDBC ����
            Class.forName("com.mysql.jdbc.Driver");     
            // ������
            conn = DriverManager.getConnection(DB_URL,USER,PWD);     
            // ִ�в�ѯ
            
//          ִ�и���Ϊ�ɽ�
            String bookSql = "update book set bable='1' where bid="+"'"+bookId+"'";
//          ִ�дӵ�ǰ�б���Ҹ�����Ϣ
            String selectSql="select * from presentlist where pbid="+"'"+bookId+"'";
//          �鿴��ǰ��ͼ��ݵĸ�������
            String selectNumSql = "select bnum from book where bid="+"'"+bookId+"'";
//            ����history
            pStatement=conn.prepareStatement(selectSql);
            ResultSet resultSet = pStatement.executeQuery();
            resultSet.next();
//            System.out.println("result�ɹ�");
            String hid = bookId+"date";
            String hbname= resultSet.getString("pbname");
            System.out.println(resultSet.getString("pbname"));
            String readerid = resultSet.getString("prid");
            String hfine = resultSet.getString("pfine");
            String outDate = resultSet.getString("poutdate");
            String inDate = time;
//            System.out.println("��ѯ�ɹ�");
            resultSet.close();
            pStatement.close();
            String historySql = "insert into historylist (hid,hbid,hbname,hrid,houtdate,hindate,hfine) values(?,?,?,?,?,?,?)";
            pStatement=conn.prepareStatement(historySql);
            pStatement.setString(1, hid);
            pStatement.setString(2, bookId);
            pStatement.setString(3, hbname);
            pStatement.setString(4, readerId);
            pStatement.setString(5, outDate);
            pStatement.setString(6, inDate);
            pStatement.setString(7, hfine);
            pStatement.executeUpdate();
//            System.out.println("����ɹ�");
            pStatement.close();
//            ɾ��presentList
            pStatement=conn.prepareStatement("delete from presentlist where pbid="+"'"+bookId+"'");
            pStatement.executeUpdate();
//            System.out.println("ɾ���ɹ�");
            pStatement.close();
//            ����book���ݿ��и������Ϣ
            pStatement=conn.prepareStatement("select bnum,bisbn from book where bid="+"'"+bookId+"'");
            ResultSet resultSet2 = pStatement.executeQuery();
            resultSet2.next();
            String isbn = resultSet2.getString("bisbn");
            String num = resultSet2.getString("bnum");
            int t =Integer.parseInt(num)+1;
            num = ""+t;
            resultSet2.close();
            pStatement.close();
//            System.out.println("���³ɹ�1");
            pStatement=conn.prepareStatement("update book set bnum="+"'"+num+"'"+"where bisbn="+"'"+isbn+"'");
            pStatement.executeUpdate();
            pStatement.close();
//            System.out.println("���³ɹ�2");
            pStatement=conn.prepareStatement("update book set bable= '1' where bid="+"'"+bookId+"'");
            pStatement.executeUpdate();
            pStatement.close();
//            System.out.println("���³ɹ�3");

            conn.setAutoCommit(true);
            statement.close();
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
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	����
	public void lendBook(String bookId,String readerId) {
		Connection conn = null;
		Statement statement =null;
		PreparedStatement pStatement= null;
		try{
            // ע�� JDBC ����
            Class.forName("com.mysql.jdbc.Driver");     
            // ������
            conn = DriverManager.getConnection(DB_URL,USER,PWD);     
            // ִ�в�ѯ
            String bookSql = "update book set bable='0' where bid="+"'"+bookId+"'";
//            ִ�и����Ƿ�ɽ�
            String selectSql="select * from book where bid="+"'"+bookId+"'";
//          ִ�в��Ҹ�����Ϣ
//            System.out.println("��ѯ�ɹ�1");
            pStatement=conn.prepareStatement(selectSql);
            ResultSet resultSet = pStatement.executeQuery();
            resultSet.next();
            String id = resultSet.getString("bid");
            String name = resultSet.getString("bname");
            String num = resultSet.getString("bnum");
            String isbn = resultSet.getString("bisbn");
            resultSet.close();
            pStatement.close();
//            System.out.println("��ѯ�ɹ�2");
            
            
            int t =Integer.parseInt(num)-1;
            num = ""+t;
//          ִ�и��¸�������
            String numSql="update book set bnum="+"'"+num+"'"+"where bisbn="+"'"+isbn+"'";
            String pid =id+'-'+time;
            String outDate =time;
            String ptime = "30";
            String presentSql = "insert into presentlist (pid,pbid,pbname,prid,poutdate,ptime,pfine) values(?,?,?,?,?,?,?)";
            pStatement =conn.prepareStatement(presentSql);
            pStatement.setString(1, pid);
//            System.out.println("1");
            pStatement.setString(2, bookId);
//            System.out.println("2");
            pStatement.setString(3, name);
//            System.out.println("3");
            pStatement.setString(4, readerId);
            pStatement.setString(5, outDate);
            pStatement.setString(6, ptime);
            pStatement.setString(7, "0");
            pStatement.executeUpdate();
            pStatement.close();
//            System.out.println("����ɹ�");
            pStatement=conn.prepareStatement(bookSql);
            pStatement.executeUpdate();
            pStatement.close();
//            System.out.println("���³ɹ�");
            pStatement=conn.prepareStatement(numSql);
            pStatement.executeUpdate();
            pStatement.close();
            // ��ɺ�ر�
            conn.setAutoCommit(true);
//            statement.close();
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
	}
	//ɾ��ͼ��
		public void deleteBook(String bookId) {
			
		}
		
		
		
		
		
		
		
		
		public String  sBook(String bookId) {
			Connection conn = null;
			Statement statement =null;
			PreparedStatement pStatement= null;
			BDate date=new BDate();
			String asan=null;
			try{
	            // ע�� JDBC ����
	            Class.forName("com.mysql.jdbc.Driver");     
	            // ������
	            conn = DriverManager.getConnection(DB_URL,USER,PWD);     
	            // ִ�в�ѯ
//	            ִ�и����Ƿ�ɽ�
	            String selectSql="select * from sbook where sbid="+"'"+bookId+"'";
//	          ִ�в��Ҹ�����Ϣ
//	            System.out.println("��ѯ�ɹ�1");
	            pStatement=conn.prepareStatement(selectSql);
	            System.out.println( pStatement);
	            
	            if(pStatement != null){
	            	ResultSet resultSet = pStatement.executeQuery();
		            resultSet.next();
		            String id = resultSet.getString("sbid");
		            String name = resultSet.getString("sbname");
		            String num = resultSet.getString("sbnum");
		            String isbn = resultSet.getString("sbisbn");
		            String author = resultSet.getString("sbauthor");
		            String location = resultSet.getString("sblocation");
		            String clas = resultSet.getString("sbclass");
		            String able = resultSet.getString("sbable");
		            String stime = resultSet.getString("stime");
		            resultSet.close();
		            pStatement.close();
		            String ntime=date.getDateTime();
		            DateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		            java.util.Date d1=df.parse(ntime);
		            java.util.Date d2=df.parse(stime);
		            long diff = d1.getTime() - d2.getTime();//�����õ��Ĳ�ֵ��΢�뼶��
		            long days = diff / (1000 * 60 * 60 * 24);
		            long hours = (diff-days*(1000 * 60 * 60 * 24))/(1000* 60 * 60);
		            long minutes = (diff-days*(1000 * 60 * 60 * 24)-hours*(1000* 60 * 60))/(1000* 60);		
		            System.out.println(days);
		            System.out.println(hours);
		            System.out.println(minutes);
		            if(days==0 && hours<2){
		            	return asan="asan";//��Ҫ����Ȿ���ڱ��˵�ԤԼ�б��ж���ԤԼʱ��������Сʱ����
		            }
		            else {
		            	//��Ҫ����Ȿ���ڱ��˵�ԤԼ�б��� ��ԤԼ��ʱ���Ƚ����ԤԼ�б���ת����ı��ٽ�������
		            	  String presentSql = "update book set bable = '1' where bid ="+"'"+bookId+"'";
		                  pStatement =conn.prepareStatement(presentSql);
	
		                  pStatement.executeUpdate();
		                  pStatement.close();
		                  String booksql="delete from sbook where sbid="+"'"+bookId+"'";
		                  pStatement=conn.prepareStatement(booksql);
		  	              pStatement.executeUpdate();
		  	              pStatement.close();
		  	          
		  	              return asan;
		  	          
		            }

	            }
	          
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
			
			return asan;
		}





public String  sBook1(String bookId) {
	Connection conn = null;
	Statement statement =null;
	PreparedStatement pStatement= null;
	BDate date=new BDate();
	String asan=null;
	try{
        // ע�� JDBC ����
        Class.forName("com.mysql.jdbc.Driver");     
        // ������
        conn = DriverManager.getConnection(DB_URL,USER,PWD);     
        // ִ�в�ѯ
//        ִ�и����Ƿ�ɽ�
        String selectSql="select * from sbook where sbid="+"'"+bookId+"'";
//      ִ�в��Ҹ�����Ϣ
//        System.out.println("��ѯ�ɹ�1");
        pStatement=conn.prepareStatement(selectSql);
        
        if( pStatement != null ){
        	ResultSet resultSet = pStatement.executeQuery();
            resultSet.next();
            String id = resultSet.getString("sbid");
            String name = resultSet.getString("sbname");
            String num = resultSet.getString("sbnum");
            String isbn = resultSet.getString("sbisbn");
            String author = resultSet.getString("sbauthor");
            String location = resultSet.getString("sblocation");
            String clas = resultSet.getString("sbclass");
            String able = resultSet.getString("sbable");
            String stime = resultSet.getString("stime");
            resultSet.close();
            pStatement.close();
            String ntime=date.getDateTime();
            DateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            java.util.Date d1=df.parse(ntime);
            java.util.Date d2=df.parse(stime);
            long diff = d1.getTime() - d2.getTime();//�����õ��Ĳ�ֵ��΢�뼶��
            long days = diff / (1000 * 60 * 60 * 24);
            long hours = (diff-days*(1000 * 60 * 60 * 24))/(1000* 60 * 60);
            long minutes = (diff-days*(1000 * 60 * 60 * 24)-hours*(1000* 60 * 60))/(1000* 60);	
            System.out.println(days);
            System.out.println(hours);
            System.out.println(minutes);
            if(days==0&&hours<2){
            	  String presentSql = "update book set bable = '1' where bid ="+"'"+bookId+"'";;
                  pStatement =conn.prepareStatement(presentSql);
                  pStatement.executeUpdate();
                  pStatement.close();
                  String booksql="delete from sbook where sbid="+"'"+bookId+"'";
                  pStatement=conn.prepareStatement(booksql);
  	              pStatement.executeUpdate();
  	              pStatement.close();
            	return asan="asan";//��Ҫ����Ȿ���ڱ��˵�ԤԼ�б��ж���ԤԼʱ��������Сʱ����
            }
            else {
            	//��Ҫ����Ȿ���ڱ��˵�ԤԼ�б��� ��ԤԼ��ʱ���Ƚ����ԤԼ�б���ת����ı��ٽ�������
            	  String presentSql = "update book set bable = '1' where bid ="+"'"+bookId+"'";
                  pStatement =conn.prepareStatement(presentSql);
                  pStatement.executeUpdate();
                  pStatement.close();
                  String booksql="delete from sbook where sbid="+"'"+bookId+"'";
                  pStatement=conn.prepareStatement(booksql);
  	              pStatement.executeUpdate();
  	              pStatement.close();
  	           
  	              return asan="asan";
  	           
            }

        }
      
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
	return asan;
}
}
















