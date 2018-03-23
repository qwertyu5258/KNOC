package kr.co.knoc.util;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Properties;

public class FileProperties {
	protected static Object lock = new Object();
	protected static Properties props = new Properties();

	public FileProperties() {
		super();
	}
	
	/* (non-Javadoc)
	 * @see ccal.test.FileIO#readFromFile(java.lang.String)
	 */
	public void readFromFile(String filename) throws IOException {
		BufferedInputStream bfi=null;
		try{
			bfi=new BufferedInputStream(new FileInputStream(filename));
			props.load(bfi);
		}catch(Exception e){
			System.out.println(e);
		}finally{
			if(bfi!=null){
				try{
					bfi.close();
				}catch(Exception e){
				}
			}
		}
	}

	/* (non-Javadoc)
	 * @see ccal.test.FileIO#writeToFile(java.lang.String)
	 */
	public void writeToFile(String filename) throws IOException {
		FileOutputStream fos=null;
		try{
			fos=new FileOutputStream(filename);
			props.store(fos, "CCAL");
		}catch(Exception e){
		}finally{
			if(fos!=null){
				try{
					fos.close();
				}catch(Exception e){
				}
			}
		}
	}

	/* (non-Javadoc)
	 * @see ccal.test.FileIO#setValue(java.lang.String, java.lang.String)
	 */
	public void setValue(String key, String value) {
		props.setProperty(key, value);
	}

	/* (non-Javadoc)
	 * @see ccal.test.FileIO#getValue(java.lang.String)
	 */
	public String getValue(String key) {
		return props.getProperty(key);
	}
}
