package email;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
/**
 * 
 * @author Niejun
 * ����ʱ������õ�ʱ�������
 */

public class TimeAction {

	
	 public  void getfine(String nowtime,String outtime)
	{
		DateFormat h =new SimpleDateFormat("yyyy.MM.dd");
		try{
		Date t1 =h.parse(nowtime);
		Date t2 =h.parse(outtime);
		//�����õ��Ĳ�ֵ��΢�뼶��
		long diff = t1.getTime() - t2.getTime();
	    long days = diff / (1000 * 60 * 60 * 24);
	    System.out.println(days);
		}catch (Exception e)
	    {
			System.out.print("error!");
	    }
			
	}

}
