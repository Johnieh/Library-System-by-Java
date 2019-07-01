package email;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * 
 * @author Niejun
 * 两个时间相减得到时间的天数
 */

public class TimeAction {

	
	 public  void getfine(String nowtime,String outtime)
	{
		DateFormat h =new SimpleDateFormat("yyyy.MM.dd");
		try{
		Date t1 =h.parse(nowtime);
		Date t2 =h.parse(outtime);
		//这样得到的差值是微秒级别
		long diff = t1.getTime() - t2.getTime();
	    long days = diff / (1000 * 60 * 60 * 24);
	    System.out.println(days);
		}catch (Exception e)
	    {
			System.out.print("error!");
	    }
			
	}

}
