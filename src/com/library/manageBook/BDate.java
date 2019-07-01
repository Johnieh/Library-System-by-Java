package com.library.manageBook;
import java.text.SimpleDateFormat;
import java.util.*;
import java.io.IOException;

public class BDate {

	    private String dateTime;
	    private Calendar calendar=Calendar.getInstance();
	    public String getDateTime(){
	    java.util.Date currDate=Calendar.getInstance().getTime();
	    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd   HH:mm:ss");
	    dateTime=sdf.format(currDate);
	    
			return dateTime;
			  
	    }
	 
	   
}
