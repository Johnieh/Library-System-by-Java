package servlet;

import java.awt.Color;  
import java.awt.Font;  
import java.awt.FontMetrics;  
import java.awt.Graphics;  
import java.awt.image.BufferedImage;  
import java.io.File;  
import java.io.FileNotFoundException;  
import java.io.FileOutputStream;  
import java.io.IOException;  
import java.io.OutputStream;  
import java.util.ArrayList;  
import java.util.List;  
import org.jbarcode.JBarcode;  
import org.jbarcode.JBarcodeFactory;  
import org.jbarcode.encode.Code128Encoder;  
import org.jbarcode.encode.InvalidAtributeException;  
import org.jbarcode.paint.TextPainter;  
import org.jbarcode.util.ImageUtil;  

public class Code {
	 //����������߶�    
    private static final int BARCODE_HEIGHT = 40;    
    //����������Ĭ�Ϸֱ���    
    private static final int BARCODE_DPI = ImageUtil.DEFAULT_DPI;    
    //����������������ʽ    
    private static final String FONT_FAMILY = "console";    
    //���������������С    
    private static final int FONT_SIZE = 15;    
    //�����������ı�    
    public static String TEXT = "";    
    //����jbarcode    
    private static JBarcode jbc = null;    
        
    static JBarcode getJBarcode() throws InvalidAtributeException {    
     /**  
     * �ο�������ʽ��  
     *barcode.setEncoder(Code128Encoder.getInstance()); //���ñ��� 
     *barcode.setPainter(WidthCodedPainter.getInstance());// ����Painter 
     *barcode.setTextPainter(BaseLineTextPainter.getInstance()); //����TextPainter 
     *barcode.setBarHeight(17); //���ø߶� 
     *barcode.setWideRatio(Double.valueOf(30).doubleValue());// ���ÿ�ȱ��� 
     *barcode.setXDimension(Double.valueOf(2).doubleValue()); // ���óߴ磬��С �ܼ��̶� 
     *barcode.setShowText(true); //�Ƿ���ʾ�ı� 
      *barcode.setCheckDigit(true); //�Ƿ������� 
     *barcode.setShowCheckDigit(false); //�Ƿ���ʾ������� 
    */    
    if (jbc == null) {    
        //����code128    
        jbc = JBarcodeFactory.getInstance().createCode128();   
        jbc.setEncoder(Code128Encoder.getInstance());    
        jbc.setTextPainter(CustomTextPainter.getInstance());    
        jbc.setBarHeight(BARCODE_HEIGHT);    
        jbc.setXDimension(Double.valueOf(0.8).doubleValue());  
        jbc.setShowText(true);    
    }    
    return jbc;    
    }    
    
    /**  
     * @descript:�����������ļ�  
     * @param message  ����������  
     * @param file   �����ļ�  
     */    
    public void createBarcode(String message, File file,String text) {    
        try {    
            FileOutputStream fos = new FileOutputStream(file);    
            createBarcode(message, fos,text);    
            fos.close();    
        } catch (IOException e) {    
            throw new RuntimeException(e);    
        }    
    }    
    
    /**  
     * @descript:���������벢д��ָ�������  
     * @param message   ����������  
     * @param os   �����  
     */    
    public static void createBarcode(String message, OutputStream os,String text) {    
        try {    
            //�����������ı�  
            TEXT=text;  
            //�����������BufferedImageͼ��    
            BufferedImage image = getJBarcode().createBarcode(message);    
            ImageUtil.encodeAndWrite(image, ImageUtil.PNG, os, BARCODE_DPI, BARCODE_DPI);    
            os.flush();    
        } catch (Exception e) {    
            throw new RuntimeException(e);    
        }    
    }    
    
    /**  
     * ��̬�ڲ���  
     * �Զ���� TextPainter�� ���������壬��С���ı���  
     * �ο��ײ�ʵ�֣�BaseLineTextPainter.getInstance()  
     */    
    protected static class CustomTextPainter implements TextPainter {    
       private static CustomTextPainter instance =new CustomTextPainter();    
       public static CustomTextPainter getInstance() {    
            return instance;    
       }    
       public void paintText(BufferedImage barCodeImage, String text, int width) {    
            //��ͼ    
            Graphics g2d = barCodeImage.getGraphics();    
            //��������    
            Font font = new Font(FONT_FAMILY, Font.PLAIN, FONT_SIZE * width);    
            g2d.setFont(font);    
            FontMetrics fm = g2d.getFontMetrics();    
            int height = fm.getHeight();    
            int center = (barCodeImage.getWidth() - fm.stringWidth(text)) / 2;    
            g2d.setColor(Color.WHITE);    
            g2d.fillRect(0, 0, barCodeImage.getWidth(), barCodeImage.getHeight() * 1 / 20);    
            g2d.fillRect(0, barCodeImage.getHeight() - (height * 9 / 10), barCodeImage.getWidth(), (height * 9 / 10));    
            g2d.setColor(Color.BLACK);    
            //�����ı�    
            g2d.drawString(TEXT, 0, 145);    
            //����������    
            g2d.drawString(text, center, barCodeImage.getHeight() - (height / 10) - 2);    
        }    
    }    
    
    /**  
    public static void main(String[] args) throws FileNotFoundException, IOException {    
        List<String> list=new ArrayList<String>();    
        list.add("KJ4.1-0127-0001");    
        list.add("KJ4.1-0128-0001");       
        if(list!=null && list.size()>0){    
            for(String message:list){    
                Code.createBarcode(message, new File("D:\\bookcode\\"+message+".png"),"book");  
        
            }    
        }       
          
    }   **/ 
}
