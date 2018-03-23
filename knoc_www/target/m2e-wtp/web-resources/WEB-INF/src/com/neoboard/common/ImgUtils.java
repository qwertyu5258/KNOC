package com.neoboard.common;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.awt.image.ConvolveOp;
import java.awt.image.Kernel;
import java.lang.InterruptedException;

import javax.imageio.ImageIO;
import javax.swing.ImageIcon;

import com.mortennobel.imagescaling.AdvancedResizeOp;
import com.mortennobel.imagescaling.ResampleOp;
import com.neoboard.data.Property;
/*import com.sun.image.codec.jpeg.*;*/
import Acme.JPM.Encoders.GifEncoder;

public final class ImgUtils {

    /** Creates a new instance of ImgUtils */
    public ImgUtils() {
    }

    private static void saveJPEG(BufferedImage bi, String newImg) throws InterruptedException, IOException{
        FileOutputStream fos = null;
        try{
            fos = new FileOutputStream(newImg);
            /*JPEGImageEncoder jpeg = JPEGCodec.createJPEGEncoder(fos);
            JPEGEncodeParam jep = jpeg.getDefaultJPEGEncodeParam(bi);
            jep.setQuality(1, false);
            jpeg.encode(bi, jep);*/
       }finally{
            if(fos != null) fos.close();
       }
    }

    private static void saveGIF(BufferedImage bi, String newImg) throws IOException{
        FileOutputStream fos = null;
        try{
            fos = new FileOutputStream(newImg);
            GifEncoder gif = new GifEncoder(bi, fos);
            gif.encode();
        }finally{
            if(fos != null) fos.close();
        }

    }

    public static void createThumbnail(Image oldImg, String newImg, int targetW, boolean useSharpen) throws InterruptedException, IOException{
        int oldW = oldImg.getWidth(null);
        int oldH = oldImg.getHeight(null);

        int newW = targetW;
        int newH = (targetW * oldH) / oldW;

        String imgExt = getExtension(newImg);

        Image imgTarget = oldImg.getScaledInstance(newW, newH, Image.SCALE_FAST);
        ImageIcon imgIcon = new ImageIcon(imgTarget);

          //int pixels[] = new int[newW * newH];

          //PixelGrabber pg = new PixelGrabber(imgTarget, 0, 0, newW, newH, pixels, 0, newW);
          //pg.grabPixels();

        BufferedImage bi = new BufferedImage(newW, newH, BufferedImage.TYPE_INT_RGB);
          //bi.setRGB(0, 0, newW, newH, pixels, 0, newW);
        bi.createGraphics().drawImage(imgTarget, 0,0, imgIcon.getImageObserver());
        /**
         * 2016.3.21 JSM
         * 보안약점 조치
         */
        if(imgExt!=null){
	        if(imgExt.equals("jpg")){
	            if(useSharpen) bi = sharpen(bi);
	            saveJPEG(bi, newImg);
	        }else if(imgExt.equals("gif"))
	            saveGIF(bi, newImg);
        }
    }

    /**
     * 기존 썸네일의 이미지가 깨지는 관계로 새로운 라이브러리 적용
     * @param oldImg
     * @param newImg
     * @param targetW
     * @throws Exception
     */
    public static void createThumbnailNew(String oldImg, String newImg, int targetW) throws Exception{

    	ImageIcon imgIcon = new ImageIcon(oldImg);

    	int oldW = imgIcon.getImage().getWidth(null);
        int oldH = imgIcon.getImage().getHeight(null);

        int newW = targetW;
        int newH = (targetW * oldH) / oldW;

        String imgExt = getExtension(newImg);

    	BufferedImage orgImage = new BufferedImage(oldW, oldH, BufferedImage.TYPE_INT_RGB);
        orgImage.createGraphics().drawImage(imgIcon.getImage(), 0,0, imgIcon.getImageObserver());

        ResampleOp resampleOp = new ResampleOp(newW, newH);
		resampleOp.setUnsharpenMask(AdvancedResizeOp.UnsharpenMask.Soft);
		BufferedImage rescaledImage = resampleOp.filter(orgImage, null);

		File destFile = new File(newImg);
		ImageIO.write(rescaledImage, imgExt, destFile);

    }

    public static void createThumbnail(String oldimg, String newImg, int targetW, boolean useSharpen) throws InterruptedException, IOException{
       ImageIcon imgIcon = new ImageIcon(oldimg);
       createThumbnail(imgIcon.getImage(), newImg, targetW, useSharpen);
    }

    private static BufferedImage sharpen(BufferedImage srcImg){
        float[] SHARPEN3x3 = {0.f, -1.f, 0.f,
                                         -1.f, 5.0f, -1.f,
                                          0.f, -1.f, 0.f};
        BufferedImage dstbimg = new BufferedImage(srcImg.getWidth(),srcImg.getHeight(),BufferedImage.TYPE_INT_RGB);
        Kernel kernel = new Kernel(3,3,SHARPEN3x3);
        ConvolveOp cop = new ConvolveOp(kernel, ConvolveOp.EDGE_NO_OP, null);
        return cop.filter(srcImg,dstbimg);
    }

    private static String getExtension(String filename) {
	if(filename != null) {
	    int i = filename.lastIndexOf('.');
	    if(i>0 && i<filename.length()-1) {
		return filename.substring(i+1).toLowerCase();
	    };
	}
	return null;
    }

    public static void main(String args[]) {
        long start = System.currentTimeMillis();
        long end = 0;
        try{
            createThumbnail("D:\\AV001(1).jpg", "D:\\AV001(2).jpg", 130, true);
            end = System.currentTimeMillis();
            /**
             * 2016.3.21 JSM
             * 보안약점 조치
             */            
            //System.out.println(end-start);
        }catch(InterruptedException e){
            System.out.println(e.toString());
        }catch(IOException e){
            System.out.println(e.toString());
        }
    }

}
