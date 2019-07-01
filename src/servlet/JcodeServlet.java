package servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import servlet.Code;

public class JcodeServlet extends HttpServlet {
	

	private static final long serialVersionUID = -1L;
	private static final String JPG = null;
	  
	String id;

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	/**protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**String code = "hello world!";
		Code qr =new Code();
		qr.createBarcode("110-23-33", new File("D:\\bookcode\\"+code+".png"), "book1");
		FileInputStream inputStream = new FileInputStream("D:/bookcode/hello.png");
		int i = inputStream.available();
		//byte�������ڴ��ͼƬ�ֽ�����
		byte[] buff = new byte[i];
		inputStream.read(buff);
		//�ǵùر�������
		inputStream.close();
		//���÷��͵��ͻ��˵���Ӧ��������
		response.setContentType("image/*");
		OutputStream out = response.getOutputStream();
		out.write(buff);
		//�ر���Ӧ�����
		out.close();
        
		
		String imagePath = "D:\\bookcode\\hello.png";

        response.reset();

        OutputStream output = response.getOutputStream();// �õ������
        if (imagePath.toLowerCase().endsWith(".png"))// ʹ�ñ��봦���ļ����������
        {
            response.setContentType(".png");// �趨���������
            // �õ�ͼƬ����ʵ·��

            // �õ�ͼƬ���ļ���
            InputStream imageIn = new FileInputStream(new File(imagePath));
            // �õ�����ı����������ļ�������jpg��ʽ����
            JPEGImageDecoder decoder = JPEGCodec.createJPEGDecoder(imageIn);
            // �õ�������ͼƬ����
            BufferedImage image = decoder.decodeAsBufferedImage();
            // �õ�����ı�����
            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(output);
            encoder.encode(image);// ��ͼƬ�����������
            imageIn.close();// �ر��ļ���
        }
        if (imagePath.toLowerCase().endsWith(".png"))// ��ʹ�ñ��봦���ļ����������
        {
            response.setContentType(".png");
            ServletContext context = getServletContext();// �õ���������
            InputStream imageIn = context.getResourceAsStream(imagePath);// �ļ���
            BufferedInputStream bis = new BufferedInputStream(imageIn);// ���뻺����
            BufferedOutputStream bos = new BufferedOutputStream(output);// ���������
            byte data[] = new byte[4096];// �����ֽ���
            int size = 0;
            size = bis.read(data);
            while (size != -1) {
                bos.write(data, 0, size);
                size = bis.read(data);
            }
            bis.close();
            bos.flush();// ������������
            bos.close();
        }
        output.close();
    }
          
}**/
	 public void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        // �����ļ�·��
		    /**Code qr =new Code();
			qr.createBarcode("110-23-33", new File("D:\\bookcode\\"+"hello"+".jpg"), "book1");**/
		    String filePath = "C:"+File.separator+"bookcode"+File.separator+id+".jpg";
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
	    public void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        
	    }	
	
	
}
	