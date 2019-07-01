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
		//byte数组用于存放图片字节数据
		byte[] buff = new byte[i];
		inputStream.read(buff);
		//记得关闭输入流
		inputStream.close();
		//设置发送到客户端的响应内容类型
		response.setContentType("image/*");
		OutputStream out = response.getOutputStream();
		out.write(buff);
		//关闭响应输出流
		out.close();
        
		
		String imagePath = "D:\\bookcode\\hello.png";

        response.reset();

        OutputStream output = response.getOutputStream();// 得到输出流
        if (imagePath.toLowerCase().endsWith(".png"))// 使用编码处理文件流的情况：
        {
            response.setContentType(".png");// 设定输出的类型
            // 得到图片的真实路径

            // 得到图片的文件流
            InputStream imageIn = new FileInputStream(new File(imagePath));
            // 得到输入的编码器，将文件流进行jpg格式编码
            JPEGImageDecoder decoder = JPEGCodec.createJPEGDecoder(imageIn);
            // 得到编码后的图片对象
            BufferedImage image = decoder.decodeAsBufferedImage();
            // 得到输出的编码器
            JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(output);
            encoder.encode(image);// 对图片进行输出编码
            imageIn.close();// 关闭文件流
        }
        if (imagePath.toLowerCase().endsWith(".png"))// 不使用编码处理文件流的情况：
        {
            response.setContentType(".png");
            ServletContext context = getServletContext();// 得到背景对象
            InputStream imageIn = context.getResourceAsStream(imagePath);// 文件流
            BufferedInputStream bis = new BufferedInputStream(imageIn);// 输入缓冲流
            BufferedOutputStream bos = new BufferedOutputStream(output);// 输出缓冲流
            byte data[] = new byte[4096];// 缓冲字节数
            int size = 0;
            size = bis.read(data);
            while (size != -1) {
                bos.write(data, 0, size);
                size = bis.read(data);
            }
            bis.close();
            bos.flush();// 清空输出缓冲流
            bos.close();
        }
        output.close();
    }
          
}**/
	 public void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        // 本地文件路径
		    /**Code qr =new Code();
			qr.createBarcode("110-23-33", new File("D:\\bookcode\\"+"hello"+".jpg"), "book1");**/
		    String filePath = "C:"+File.separator+"bookcode"+File.separator+id+".jpg";
	        File file = new File(filePath);
	        // 获取输出流
	        OutputStream outputStream = response.getOutputStream();
	        FileInputStream fileInputStream = new FileInputStream(file);
	        // 读数据
	        byte[] data = new byte[fileInputStream.available()];
	        fileInputStream.read(data);
	        fileInputStream.close();
	        // 回写
	        response.setContentType(JPG);
	        outputStream.write(data);
	        outputStream.flush();
	        outputStream.close();
	    }
	    public void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        
	    }	
	
	
}
	