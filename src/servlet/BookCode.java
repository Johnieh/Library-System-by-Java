package servlet;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;

import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;

public class BookCode {

	    private BufferedImage image;
	    private int imageWidth = 450;  //ͼƬ�Ŀ��
	    private int imageHeight = 400; //ͼƬ�ĸ߶�
	    
		//����ͼƬ�ļ�
	    @SuppressWarnings("restriction")
	    public void createImage(String fileLocation) {
	        BufferedOutputStream bos = null;
	        if(image != null){
	            try {
	                FileOutputStream fos = new FileOutputStream(fileLocation);
	                bos = new BufferedOutputStream(fos);
	                 
	                JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(bos);
	                encoder.encode(image);
	                bos.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }finally{
	                if(bos!=null){//�ر������
	                    try {
	                        bos.close();
	                    } catch (IOException e) {
	                        e.printStackTrace();
	                    }
	                }
	            }
	        }
	    }
	 
	    public void graphicsGeneration(String id, String name, String author,String isbn,String location, String imgurl) {
	        int H_title = 30;     //ͷ���߶�
	        int H_mainPic = 200;  //�ֲ����߶�
	        int H_tip = 60;  //������ʾ��߶�
	        int H_btn = 25;  //��ť���ĸ߶�
	        int tip_2_top = (H_title+H_mainPic);
	        int btns_2_top = tip_2_top+H_tip+20;
	        int btn1_2_top = btns_2_top+10;
	        int btn2_2_top = btn1_2_top+H_btn;
	        int shops_2_top = btn2_2_top+H_btn+20;
	        int W_btn = 280;  //��ť���Ŀ��
	         
	        image = new BufferedImage(imageWidth, imageHeight, BufferedImage.TYPE_INT_RGB);
	        //����ͼƬ�ı���ɫ
	        Graphics2D main = image.createGraphics();
	        main.setColor(Color.white);
	        main.fillRect(0, 0, imageWidth, imageHeight);
	         
	        //***********************ҳ��ͷ��
	        Graphics title = image.createGraphics();
	        //����������ɫ
	        title.setColor(new Color(255, 120, 89));
	        //�������ȷ�������Сλ��
	        title.fillRect(0, 0, imageWidth, H_title);
	        //����������ɫ����������ɫ�����������
	        title.setColor(Color.white);
	        //��������
	        Font titleFont = new Font("����", Font.BOLD, 16);
	        title.setFont(titleFont);
	        title.drawString("Book ID Card", 180,(H_title)/2+5);
	 
	        //***********************�����м���ͼ
	        Graphics mainPic = image.getGraphics();
	        BufferedImage bimg = null;
	        try {
	           bimg = javax.imageio.ImageIO.read(new java.io.File(imgurl));
	        } catch (Exception e) {}
	     
	        if(bimg!=null){
	            mainPic.drawImage(bimg, 0, H_title, imageWidth, H_mainPic, null);
	            mainPic.dispose();
	        }
	        //***********************�����������ʾ��
	         
	        Graphics2D tip = image.createGraphics();
	        //����������ɫ
	        //tip.setColor(new Color(255, 120, 89));
	        tip.setColor(new Color(255, 120, 89));
	        //�������ȷ�������Сλ��
	        tip.fillRect(0, tip_2_top, imageWidth, H_tip*2);
	        //����������ɫ����������ɫ�����������
	        tip.setColor(Color.white);
	        //��������
	        Font tipFont = new Font("����", Font.BOLD, 20);
	        tip.setFont(tipFont);
	        /******��ȡBOOK��ID*******/
	        tip.drawString("ID:"+id, 160, tip_2_top+(H_tip)/2-10);
	        /******��ȡBOOK������*******/
	        tip.drawString("Name:"+name, 160, tip_2_top+(H_tip)/2+10);
	        /********��ȡBook������******/
	        tip.drawString("Author:"+author, 160, tip_2_top+(H_tip)/2+30);
	        /******��ȡBOOK��ISBN*******/
	        tip.drawString("ISBN:"+isbn, 160, tip_2_top+(H_tip)/2+50);
	        /*********��ȡbook��λ��******/
	        tip.drawString("Location:"+location,160, tip_2_top+(H_tip)/2+70);
	         
	        
	        createImage("D:/bookcode/"+id+".jpg");      
	    }
	    
//	    public static void main(String[] args) {
//	        BookCode cg = new BookCode();
//	        try {
//	            cg.graphicsGeneration("ewew", "1", "12", "D:/bookcode/11-11-111-11.jpg");
//	        } catch (Exception e) {
//	            e.printStackTrace();
//	        }
//	    }

}
