package com.neoboard.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import oracle.jdbc.pool.OracleDataSource;

public class DBUtil {
	public DBUtil()
    {
    }

	public static Connection getConnection() throws SQLException
    {		
    	
		//OracleDataSource ds=null;
		Connection con=null;
		DataSource ds = null;
		 
	 
		 Context envContext = null;	
		try {
			Context ctx = new InitialContext();		
			//ds = (OracleDataSource) ctx.lookup( "jdbc/oracle_knoc" );
			envContext = (Context)ctx.lookup("java:/comp/env/"); 
			ds = (DataSource)envContext.lookup("jdbc/oracle_knoc");
 
				/*Context initContext = new InitialContext();
		      Context envContext = (Context) initContext.lookup("java:/comp/env/");
		     OracleDataSource ds = (OracleDataSource) envContext.lookup("jdbc/knoc");*/
			
			if( ds != null ) {
				con = ds.getConnection();
			}
			
			
		} catch (NamingException e) {
			e.printStackTrace();
		}
		
		return con;		    	      
    }
    
}