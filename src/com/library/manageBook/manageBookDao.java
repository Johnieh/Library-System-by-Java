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

    
//	还书
	public void returnBook(String bookId,String readerId) {
		Connection conn = null;
		Statement statement =null;
		PreparedStatement pStatement= null;
		try{
//			System.out.println("进入陈工1");
            // 注册JDBC 驱动
            Class.forName("com.mysql.jdbc.Driver");     
            // 打开链接
            conn = DriverManager.getConnection(DB_URL,USER,PWD);     
            // 执行查询
            
//          执行更新为可借
            String bookSql = "update book set bable='1' where bid="+"'"+bookId+"'";
//          执行从当前列表查找该书信息
            String selectSql="select * from presentlist where pbid="+"'"+bookId+"'";
//          查看当前该图书馆的该书数量
            String selectNumSql = "select bnum from book where bid="+"'"+bookId+"'";
//            插入history
            pStatement=conn.prepareStatement(selectSql);
            ResultSet resultSet = pStatement.executeQuery();
            resultSet.next();
//            System.out.println("result成功");
            String hid = bookId+"date";
            String hbname= resultSet.getString("pbname");
            System.out.println(resultSet.getString("pbname"));
            String readerid = resultSet.getString("prid");
            String hfine = resultSet.getString("pfine");
            String outDate = resultSet.getString("poutdate");
            String inDate = time;
//            System.out.println("查询成功");
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
//            System.out.println("插入成功");
            pStatement.close();
//            删除presentList
            pStatement=conn.prepareStatement("delete from presentlist where pbid="+"'"+bookId+"'");
            pStatement.executeUpdate();
//            System.out.println("删除成功");
            pStatement.close();
//            设置book数据库中该书的信息
            pStatement=conn.prepareStatement("select bnum,bisbn from book where bid="+"'"+bookId+"'");
            ResultSet resultSet2 = pStatement.executeQuery();
            resultSet2.next();
            String isbn = resultSet2.getString("bisbn");
            String num = resultSet2.getString("bnum");
            int t =Integer.parseInt(num)+1;
            num = ""+t;
            resultSet2.close();
            pStatement.close();
//            System.out.println("更新成功1");
            pStatement=conn.prepareStatement("update book set bnum="+"'"+num+"'"+"where bisbn="+"'"+isbn+"'");
            pStatement.executeUpdate();
            pStatement.close();
//            System.out.println("更新成功2");
            pStatement=conn.prepareStatement("update book set bable= '1' where bid="+"'"+bookId+"'");
            pStatement.executeUpdate();
            pStatement.close();
//            System.out.println("更新成功3");

            conn.setAutoCommit(true);
            statement.close();
            conn.close();
        }catch(SQLException se){
            // 处理 JDBC 错误
            se.printStackTrace();
        }catch(Exception e){
            // 处理 Class.forName 错误
            e.printStackTrace();
        }finally{
            // 关闭资源
            try{
                if(pStatement!=null) pStatement.close();
            }catch(SQLException se2){
            	// 什么都不做
            }
            try{
                if(conn!=null) conn.close();
            }catch(SQLException se){
                se.printStackTrace();
            }
        }
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	借书
	public void lendBook(String bookId,String readerId) {
		Connection conn = null;
		Statement statement =null;
		PreparedStatement pStatement= null;
		try{
            // 注册 JDBC 驱动
            Class.forName("com.mysql.jdbc.Driver");     
            // 打开链接
            conn = DriverManager.getConnection(DB_URL,USER,PWD);     
            // 执行查询
            String bookSql = "update book set bable='0' where bid="+"'"+bookId+"'";
//            执行更新是否可借
            String selectSql="select * from book where bid="+"'"+bookId+"'";
//          执行查找该书信息
//            System.out.println("查询成功1");
            pStatement=conn.prepareStatement(selectSql);
            ResultSet resultSet = pStatement.executeQuery();
            resultSet.next();
            String id = resultSet.getString("bid");
            String name = resultSet.getString("bname");
            String num = resultSet.getString("bnum");
            String isbn = resultSet.getString("bisbn");
            resultSet.close();
            pStatement.close();
//            System.out.println("查询成功2");
            
            
            int t =Integer.parseInt(num)-1;
            num = ""+t;
//          执行更新该书数量
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
//            System.out.println("插入成功");
            pStatement=conn.prepareStatement(bookSql);
            pStatement.executeUpdate();
            pStatement.close();
//            System.out.println("更新成功");
            pStatement=conn.prepareStatement(numSql);
            pStatement.executeUpdate();
            pStatement.close();
            // 完成后关闭
            conn.setAutoCommit(true);
//            statement.close();
            conn.close();
        }catch(SQLException se){
            // 处理 JDBC 错误
            se.printStackTrace();
        }catch(Exception e){
            // 处理 Class.forName 错误
            e.printStackTrace();
        }finally{
            // 关闭资源
            try{
                if(pStatement!=null) pStatement.close();
            }catch(SQLException se2){
            	// 什么都不做
            }
            try{
                if(conn!=null) conn.close();
            }catch(SQLException se){
                se.printStackTrace();
            }
        }
	}
	//删除图书
		public void deleteBook(String bookId) {
			
		}
		
		
		
		
		
		
		
		
		public String  sBook(String bookId) {
			Connection conn = null;
			Statement statement =null;
			PreparedStatement pStatement= null;
			BDate date=new BDate();
			String asan=null;
			try{
	            // 注册 JDBC 驱动
	            Class.forName("com.mysql.jdbc.Driver");     
	            // 打开链接
	            conn = DriverManager.getConnection(DB_URL,USER,PWD);     
	            // 执行查询
//	            执行更新是否可借
	            String selectSql="select * from sbook where sbid="+"'"+bookId+"'";
//	          执行查找该书信息
//	            System.out.println("查询成功1");
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
		            long diff = d1.getTime() - d2.getTime();//这样得到的差值是微秒级别
		            long days = diff / (1000 * 60 * 60 * 24);
		            long hours = (diff-days*(1000 * 60 * 60 * 24))/(1000* 60 * 60);
		            long minutes = (diff-days*(1000 * 60 * 60 * 24)-hours*(1000* 60 * 60))/(1000* 60);		
		            System.out.println(days);
		            System.out.println(hours);
		            System.out.println(minutes);
		            if(days==0 && hours<2){
		            	return asan="asan";//想要借的这本书在别人的预约列表中而且预约时间在两个小时以内
		            }
		            else {
		            	//想要借的这本书在别人的预约列表中 但预约超时，先将书从预约列表里转到书的表，再借给这个人
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
	            // 处理 JDBC 错误
	            se.printStackTrace();
	        }catch(Exception e){
	            // 处理 Class.forName 错误
	            e.printStackTrace();
	        }finally{
	            // 关闭资源
	            try{
	                if(pStatement!=null) pStatement.close();
	            }catch(SQLException se2){
	            	// 什么都不做
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
        // 注册 JDBC 驱动
        Class.forName("com.mysql.jdbc.Driver");     
        // 打开链接
        conn = DriverManager.getConnection(DB_URL,USER,PWD);     
        // 执行查询
//        执行更新是否可借
        String selectSql="select * from sbook where sbid="+"'"+bookId+"'";
//      执行查找该书信息
//        System.out.println("查询成功1");
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
            long diff = d1.getTime() - d2.getTime();//这样得到的差值是微秒级别
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
            	return asan="asan";//想要借的这本书在别人的预约列表中而且预约时间在两个小时以内
            }
            else {
            	//想要借的这本书在别人的预约列表中 但预约超时，先将书从预约列表里转到书的表，再借给这个人
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
        // 处理 JDBC 错误
        se.printStackTrace();
    }catch(Exception e){
        // 处理 Class.forName 错误
        e.printStackTrace();
    }finally{
        // 关闭资源
        try{
            if(pStatement!=null) pStatement.close();
        }catch(SQLException se2){
        	// 什么都不做
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
















