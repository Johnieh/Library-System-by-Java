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
 
public class ChartGraphics {
    private BufferedImage image;
    private int imageWidth = 450;  //图片的宽度
    private int imageHeight = 350; //图片的高度
    
	//生成图片文件
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
                if(bos!=null){//关闭输出流
                    try {
                        bos.close();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }
 
    public void graphicsGeneration(String id, String name, String imgurl) {
        int H_title = 30;     //头部高度
        int H_mainPic = 200;  //轮播广告高度
        int H_tip = 60;  //上网提示框高度
        int H_btn = 25;  //按钮栏的高度
        int tip_2_top = (H_title+H_mainPic);
        int btns_2_top = tip_2_top+H_tip+20;
        int btn1_2_top = btns_2_top+10;
        int btn2_2_top = btn1_2_top+H_btn;
        int shops_2_top = btn2_2_top+H_btn+20;
        int W_btn = 280;  //按钮栏的宽度
         
        image = new BufferedImage(imageWidth, imageHeight, BufferedImage.TYPE_INT_RGB);
        //设置图片的背景色
        Graphics2D main = image.createGraphics();
        main.setColor(Color.white);
        main.fillRect(0, 0, imageWidth, imageHeight);
         
        //***********************页面头部
        Graphics title = image.createGraphics();
        //设置区域颜色
        title.setColor(new Color(143, 0, 0));
        //填充区域并确定区域大小位置
        title.fillRect(0, 0, imageWidth, H_title);
        //设置字体颜色，先设置颜色，再填充内容
        title.setColor(Color.white);
        //设置字体
        Font titleFont = new Font("宋体", Font.BOLD, 16);
        title.setFont(titleFont);
        title.drawString("Reader Card", 160,(H_title)/2+5);
 
        //***********************插入中间广告图
        Graphics mainPic = image.getGraphics();
        BufferedImage bimg = null;
        try {
           bimg = javax.imageio.ImageIO.read(new java.io.File(imgurl));
        } catch (Exception e) {}
     
        if(bimg!=null){
            mainPic.drawImage(bimg, 0, H_title, imageWidth, H_mainPic, null);
            mainPic.dispose();
        }
        //***********************设置下面的提示框
         
        Graphics2D tip = image.createGraphics();
        //设置区域颜色
        //tip.setColor(new Color(255, 120, 89));
        tip.setColor(new Color(143, 0, 0));
        //填充区域并确定区域大小位置
        tip.fillRect(0, tip_2_top, imageWidth, H_tip);
        //设置字体颜色，先设置颜色，再填充内容
        tip.setColor(Color.white);
        //设置字体
        Font tipFont = new Font("宋体", Font.BOLD, 20);
        tip.setFont(tipFont);
        /******获取用户的ID*******/
        tip.drawString("ID:"+id, 160, tip_2_top+(H_tip)/2-10);
        /******获取用户的姓名*******/
        tip.drawString("Name:"+name, 160, tip_2_top+(H_tip)/2+10);
         
         
         
        //***********************设置下面的按钮块
        //设置字体颜色，先设置颜色，再填充内容
//        tip.setColor(Color.black);
//        tip.drawString("您可以选择的操作：", 20, btns_2_top);
//        tip.drawString("下面的小图标：", 20, shops_2_top);
//        //***********************按钮
//        Font btnFont = new Font("宋体", Font.BOLD, 14);
//        Graphics2D btn1 = image.createGraphics();
//        btn1.setColor(new Color(41,192 , 50));//#29C65A
//        btn1.fillRect(10, btn1_2_top, W_btn, H_btn);
//        btn1.setColor(Color.BLACK);
//        btn1.drawRect(10, btn1_2_top, W_btn, H_btn);
//        //btn1 文本
//        btn1.setColor(Color.white);
//        btn1.setFont(btnFont);
//        btn1.drawString("单击我啊", 120, btn1_2_top+(H_btn/2)+5);
//         
//        Graphics2D btn2 = image.createGraphics();
//        btn2.setColor(new Color(141,120 , 22));//#29C65A
//        btn2.fillRect(10, btn2_2_top, W_btn, H_btn);
//        btn2.setColor(Color.BLACK);
//        btn2.drawRect(10, btn2_2_top, W_btn, H_btn);
//        //btn2文本
//        btn2.setColor(Color.white);
//        btn2.setFont(btnFont);
//        btn2.drawString("单击我啊", 120, btn2_2_top+(H_btn/2)+5);
     
        createImage("D:/bookcode/"+id+".jpg");
         
    }
 
//    public static void main(String[] args) {
//        ChartGraphics cg = new ChartGraphics();
//        try {
//            cg.graphicsGeneration("ewew", "1", "12", "D:/bookcode/11-11-111-11.jpg");
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
}
