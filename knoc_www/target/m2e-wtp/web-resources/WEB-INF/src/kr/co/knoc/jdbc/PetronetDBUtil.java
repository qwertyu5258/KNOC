package kr.co.knoc.jdbc;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import kr.co.knoc.util.EtcUtil;

public class PetronetDBUtil {
	private static String _dbpool = null;
	private static String sid = null;
    private static String ip = null;
    private static String user = null;
    private static String password = null;
	
	public PetronetDBUtil()
    {

    }

	public static Connection getConnection() throws SQLException
    {
		DataSource ds=null;
		Connection con = null;
		
		BufferedInputStream bfi = null;
		try {
			Properties p 		= new Properties();
			EtcUtil etc = new EtcUtil();
			bfi=new BufferedInputStream(new FileInputStream(etc.getFile("PetronetDB.properties")));
			p.load(bfi); 
			for(Enumeration e = p.propertyNames();e.hasMoreElements(); ) {
				String key = (String)e.nextElement();
				String[] values = p.getProperty(key," = ").split("=");
				if (key.equals("DBIp")) {
					ip = values[0];
				}
				if (key.equals("DBPasswd")) {
					password = values[0];
				}
				if (key.equals("DBUser")) {
					user = values[0];
				}
				if (key.equals("DBName")) {
					sid = values[0];
				}
				if (key.equals("DBPool")) {
					_dbpool = values[0];
				}				    
			}
		} catch(FileNotFoundException e ) {
			e.printStackTrace();
			System.out.println("DB property 화일이 없습니다.");
		} catch(java.io.IOException e) {
			e.printStackTrace();
			System.out.println("DB property 화일을 읽을 수가 없습니다.");
		} finally {
			if(bfi != null) { try {bfi.close(); }catch(java.io.IOException e){;} }
		}		
		 
		 String mysqlDriver = "com.mysql.jdbc.Driver";
		 
		 try {
	         Class.forName(mysqlDriver);
	     } catch (ClassNotFoundException e) {}
		 
	     String mysqlURL = "jdbc:mysql://" + ip+ ":3306/" + sid;		     	
	
	     try {
	         con = DriverManager.getConnection(mysqlURL, user, password);
	     } catch (SQLException e) {
	    	 e.printStackTrace();
	     }
	     return con;	      
    }
}
