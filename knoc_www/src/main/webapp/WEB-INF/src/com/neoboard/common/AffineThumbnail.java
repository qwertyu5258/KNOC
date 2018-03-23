package com.neoboard.common;

import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.File;

import javax.imageio.ImageIO;



public class AffineThumbnail
{
	public AffineThumbnail(String srcFileName,String destFileName,int thumbNailSize) throws Exception
	{
		// Read in original image to create thumbnail from 
		File inFile = new File(srcFileName);
		BufferedImage bufferedImage = ImageIO.read(inFile);
		// Calculate scale so image fits in a square area of thumbNailSize - e.g. 160
		
		// 보안약점 조치 2016.03.21 ECJ
		int imageWidth  = 0;
		int imageHeight = 0;		
		if(bufferedImage != null){
			imageWidth  = bufferedImage.getWidth();
			imageHeight = bufferedImage.getHeight();
		}
		
		int componentWidth = thumbNailSize;
		int componentHeight = thumbNailSize;
		double scale = -1;
		if ( imageWidth == componentWidth && imageHeight == componentHeight){
			scale = 1;
		}
		else if ( imageWidth <= componentWidth && imageHeight <= componentHeight)
		{
			// set scale to 1 if we don't want to scale up - otherwise use code below...
			scale = 1;
			// double heightScale = ((double)componentWidth) / ((double)imageWidth);
			// double widthScale = ((double)componentHeight) / ((double)imageHeight);
			// if ( heightScale < widthScale ) scale = heightScale;
			// else scale = widthScale;
		}
		else if ( imageWidth > componentWidth && imageHeight <= componentHeight)
		{
			double heightScale = ((double)componentWidth) / ((double)imageWidth);
			scale = heightScale;
		}
		else if ( imageWidth <= componentWidth && imageHeight > componentHeight)
		{
			double widthScale = ((double)componentHeight) / ((double)imageHeight);
			scale = widthScale;
		}
		else
		{
			double heightScale = ((double)componentWidth) / ((double)imageWidth);
			int scaledHeight = (int)(((double)imageHeight) * heightScale);
			double widthScale = ((double)componentHeight) / ((double)imageHeight);
			int scaledWidth = (int)(((double)imageWidth) * widthScale);
			if ( scaledWidth <= componentWidth ) scale = widthScale;
			else scale = heightScale;
		}
		// Now create thumbnail
		AffineTransform affineTransform = AffineTransform.getScaleInstance(scale,scale);
		//int interpolationType: TYPE_NEAREST_NEIGHBOR, TYPE_BILINEAR.
		// RenderingHints hints: If no hints are specified (hints is null), the interpolation type is TYPE_NEAREST_NEIGHBOR.
		//VALUE_RENDER_QUALITY
		AffineTransformOp affineTransformOp = new AffineTransformOp(affineTransform,null);
		// AffineTransformOp affineTransformOp = new AffineTransformOp(affineTransform, 
		//													//new RenderingHints(RenderingHints.KEY_COLOR_RENDERING, RenderingHints.VALUE_RENDER_QUALITY)
		//													new RenderingHints(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON)
		//												);
		
		BufferedImage scaledBufferedImage = affineTransformOp.filter(bufferedImage,null);
		// Now do fix to get rid of silly spurious line
		
		int scaledWidth = scaledBufferedImage.getWidth();
		int scaledHeight = scaledBufferedImage.getHeight();
		
		int expectedWidth = (int)(imageWidth * scale);
		int expectedHeight = (int)(imageHeight * scale);
		if ( scaledWidth > expectedWidth || scaledHeight > expectedHeight )
		scaledBufferedImage = scaledBufferedImage.getSubimage(
		0,0,expectedWidth,expectedHeight);
		// Now write out scaled image to file
		ImageIO.write(scaledBufferedImage,"JPG",new File(destFileName));
	}

	public static void main(String[] args)
	{
		//args = new String[]{"/Adobe Albums/icon3_1600x1200.jpg", "affineTransformOpThumbnail-160.jpg", "160"};
		args = new String[]{"C:/aa/test.jpg", "C:/aa/test_small.jpg", "190"};
		
		if ( args.length < 3 )
		{
			System.err.println("Usage: imageTest srcFile DestFile size");
			System.exit(-1);
		}
		try
		{
			int size = 160;
			try
			{
				size = Integer.parseInt(args[2]);
			}
			catch (NumberFormatException numberFormatException) { }
			AffineThumbnail main1 = new AffineThumbnail(args[0],args[1],size);
		}
		catch (Exception exception)
		{
			System.out.println(exception);
			exception.printStackTrace();
		}
	}
} 

/////////////////////////
 


 
