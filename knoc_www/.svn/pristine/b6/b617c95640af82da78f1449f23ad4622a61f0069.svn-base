package kr.co.knoc.secure;

import com.ksign.securedb.api.SDBCrypto;
import com.ksign.securedb.api.util.SDBException;

public class SecureDBUtil {

	public static String db_ip="211.35.19.131";
	public static String server_ip="211.35.19.131";
	public static SDBCrypto crypto=null;
	  static{
		  try {
			crypto = SDBCrypto.getInstance(db_ip, 1521, server_ip , 8080, 5);
		} catch (SDBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
}
