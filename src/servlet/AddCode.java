package servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.Code;

public class AddCode {

	
	private static final String JPG = null;
	
	public void doCode(HttpServletResponse response,String id)
            throws Exception {
        // �����ļ�·��
	    /**Code qr =new Code();
		qr.createBarcode("110-23-33", new File("D:\\bookcode\\"+"hello"+".jpg"), "book1");**/
	    String filePath = "D:"+File.separator+"bookcode"+File.separator+id+".jpg";
        File file = new File(filePath);
        // ��ȡ�����
        OutputStream outputStream = response.getOutputStream();
        FileInputStream fileInputStream = new FileInputStream(file);
        // ������
        byte[] data = new byte[fileInputStream.available()];
        fileInputStream.read(data);
        fileInputStream.close();
		// ��д
        response.setContentType(JPG);
        outputStream.write(data);
        outputStream.flush();
        outputStream.close();
    }

}
