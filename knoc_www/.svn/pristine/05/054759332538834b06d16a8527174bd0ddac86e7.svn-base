package com.neoboard.common;

import java.awt.Container;
import java.awt.Graphics2D;
import java.awt.MediaTracker;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.awt.image.ConvolveOp;
import java.awt.image.Kernel;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import Acme.JPM.Encoders.GifEncoder;

/*import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGEncodeParam;
import com.sun.image.codec.jpeg.JPEGImageEncoder;*/

public class Thumbnail {

	//	   작은 이미지를 만든다.
	public static void createThumbnail(String orig, String thumb, int maxDim) {
		BufferedOutputStream os = null;
		try {
			//	   Get the image from a file.
			BufferedImage inImage = javax.imageio.ImageIO.read(new java.io.File(orig));
			/**
			 * 2016. 03. 21 / MYM
			 * 보안약점 조치
			 */
			if(inImage != null) {
				MediaTracker mediaTracker = new MediaTracker(new Container());
				mediaTracker.addImage(inImage,0);
				mediaTracker.waitForID(0);
				int w,h;
				w = inImage.getWidth(null);
				h = inImage.getHeight(null);
				double scale;
				if(w>h){
					scale =  (double)maxDim/(double)w;
				}
				else {
					scale = (double)maxDim/(double)h;
				}
				int scaledW = (int) (scale * (double)w);
				int scaledH = (int) (scale * (double)h);

				BufferedImage outImage =getScaledInstance(inImage, scaledW, scaledH,
			            RenderingHints.VALUE_INTERPOLATION_BILINEAR, true,false);

				os = new BufferedOutputStream(new FileOutputStream(new File(thumb)));
				String ext=orig.substring(orig.lastIndexOf(".")+1);//입력받은 파일의 확장자
				if(ext.toLowerCase().equals("jpg")||ext.toLowerCase().equals("jpeg")){
					/*JPEGImageEncoder encoder = JPEGCodec.createJPEGEncoder(os);

					JPEGEncodeParam param = encoder.getDefaultJPEGEncodeParam(outImage);
					param.setQuality((float)95.0 / 100.0f, false);
					encoder.setJPEGEncodeParam(param);
					encoder.encode(outImage);*/
				}else if(ext.toLowerCase().equals("gif")){
					GifEncoder encoder = new GifEncoder(outImage, os);
					encoder.encode();
				}
			}
		}
		catch (IOException e) {
			System.out.println("Exception");
		}
		catch (Exception e) {
			System.out.println("Exception");
		} finally{

			try {
				os.close();
			} catch (IOException e) {
				System.out.println("Exception");
			}
		}
	}

	/**
     * Convenience method that returns a scaled instance of the
     * provided {@code BufferedImage}.
     *
     * @param img the original image to be scaled
     * @param targetWidth the desired width of the scaled instance,
     *    in pixels
     * @param targetHeight the desired height of the scaled instance,
     *    in pixels
     * @param hint one of the rendering hints that corresponds to
     *    {@code RenderingHints.KEY_INTERPOLATION} (e.g.
     *    {@code RenderingHints.VALUE_INTERPOLATION_NEAREST_NEIGHBOR},
     *    {@code RenderingHints.VALUE_INTERPOLATION_BILINEAR},
     *    {@code RenderingHints.VALUE_INTERPOLATION_BICUBIC})
     * @param higherQuality if true, this method will use a multi-step
     *    scaling technique that provides higher quality than the usual
     *    one-step technique (only useful in down-scaling cases, where
     *    {@code targetWidth} or {@code targetHeight} is
     *    smaller than the original dimensions, and generally only when
     *    the {@code BILINEAR} hint is specified)
     * @return a scaled version of the original {@codey BufferedImage}
     */
    public static BufferedImage getScaledInstance(BufferedImage img,
                                                  int targetWidth,
                                                  int targetHeight,
                                                  Object hint,
                                                  boolean higherQuality,
                                                  boolean useBlur)
    {

    	int type = img.getType();
        BufferedImage ret = (BufferedImage)img;
        int w, h;

        if (higherQuality) {
            // Use multi-step technique: start with original size, then
            // scale down in multiple passes with drawImage()
            // until the target size is reached
            w = img.getWidth();
            h = img.getHeight();
        } else {
            // Use one-step technique: scale directly from original
            // size to target size with a single drawImage() call
            w = targetWidth;
            h = targetHeight;
        }

        BufferedImage tmp = null;

        if (useBlur) {
            // Setup blur convolve before resizing
            float weight = 1.0f/9.0f;
            float[] elements = new float[9];
            for (int i = 0; i < 9; i++) {
                elements[i] = weight;
            }
            Kernel blurKernel = new Kernel(3, 3, elements);
            ConvolveOp blur = new ConvolveOp(blurKernel);
            tmp = new BufferedImage(w, h, type);
            blur.filter(ret, tmp);
            ret = tmp;
        }

        do {
            if (higherQuality && w > targetWidth) {
                w /= 2;
                if (w < targetWidth) {
                    w = targetWidth;
                }
            }

            if (higherQuality && h > targetHeight) {
                h /= 2;
                if (h < targetHeight) {
                    h = targetHeight;
                }
            }

            tmp = new BufferedImage(w, h, type);
            Graphics2D g2 = tmp.createGraphics();
            g2.setRenderingHint(RenderingHints.KEY_INTERPOLATION, hint);
            g2.drawImage(ret, 0, 0, w, h, null);
            g2.dispose();

            ret = tmp;
        } while (w != targetWidth || h != targetHeight);

        return ret;
    }
}
