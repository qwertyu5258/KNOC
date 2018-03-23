package com.neoboard;

import java.io.CharArrayReader;
import java.io.Reader;
import java.io.Writer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.neoboard.data.Authority;
import com.neoboard.data.Property;
import com.neoboard.jdbc.DBUtil;

public class SetupManager {
	/**
     * 테이블 생성
     * @param property
     * @param auth
     * @return
     */
    public boolean createTable() {
        Connection con = null;
		Statement stmt = null;
		PreparedStatement prestmt = null;
		ResultSet rs = null;
		
		StringBuffer queryBuf = new StringBuffer();
        try {
        	con = DBUtil.getConnection();
			con.setAutoCommit(false);
			
			stmt = con.createStatement();
			
			/* CREATE SCHEMA */
			queryBuf.setLength(0);
			queryBuf.append("CREATE TABLE NEOBOARDAUTHORITY (");
			queryBuf.append("BOARDID                     VARCHAR(8)       NOT NULL DEFAULT '',"); 
			queryBuf.append("LEVELLIST                   int(9) unsigned not null default '0',"); 
			queryBuf.append("LISTALLOWEDUSER             VARCHAR(255)     DEFAULT '',"); 
			queryBuf.append("LEVELVIEW                   int(9) unsigned not null default '0',"); 
			queryBuf.append("VIEWALLOWEDUSER             VARCHAR(255)      DEFAULT '',"); 
			queryBuf.append("LEVELREGISTRATION           int(9) unsigned not null default '0',"); 
			queryBuf.append("REGISTRATIONALLOWEDUSER     VARCHAR(255)      DEFAULT '',"); 
			queryBuf.append("LEVELREPLY                  int(9) unsigned not null default '0',"); 
			queryBuf.append("REPLYALLOWEDUSER            VARCHAR(255)      DEFAULT '',"); 
			queryBuf.append("LEVELEDIT                   int(9) unsigned not null default '0',"); 
			queryBuf.append("EDITALLOWEDUSER             VARCHAR(255)      DEFAULT '',"); 
			queryBuf.append("LEVELDELETE                 int(9) unsigned not null default '0',"); 
			queryBuf.append("DELETEALLOWEDUSER           VARCHAR(255)      DEFAULT '',"); 
			queryBuf.append("LEVELCOMMENTWRITE           int(9) unsigned not null default '0',"); 
			queryBuf.append("COMMENTWRITEALLOWEDUSER     VARCHAR(255)      DEFAULT '',"); 
			queryBuf.append("LEVELCOMMENTDELETE          int(9) unsigned not null default '0',"); 
			queryBuf.append("COMMENTDELETEALLOWEDUSER    VARCHAR(255)      DEFAULT '',"); 
			queryBuf.append("MASTER                      VARCHAR(255)      DEFAULT '',"); 
			queryBuf.append("LEVELNOTICE                 int(9) unsigned not null default '0',"); 
			queryBuf.append("NOTICEALLOWEDUSER           VARCHAR(255)      DEFAULT '',"); 
			queryBuf.append("LEVELDOWN                   int(9) unsigned not null default '0',"); 
			queryBuf.append("DOWNALLOWEDUSER             VARCHAR(255)      DEFAULT '',");
			queryBuf.append("PRIMARY KEY (BOARDID),");
			queryBuf.append("KEY NO (BOARDID)");
			queryBuf.append(")");
			stmt.executeUpdate(queryBuf.toString());			
			
			queryBuf.setLength(0);
			queryBuf.append("CREATE TABLE NEOBOARDCOMMON (");
			queryBuf.append("NO             int(9) unsigned not null default '0',"); 
			queryBuf.append("COMGUBUN       VARCHAR(10)      NOT NULL DEFAULT '',"); 
			queryBuf.append("COMNAME        VARCHAR(100)     NOT NULL DEFAULT '',"); 
			queryBuf.append("COMID          VARCHAR(50)      NOT NULL DEFAULT '',"); 
			queryBuf.append("REGDATETIME    CHAR(14)          NOT NULL DEFAULT '',");
			queryBuf.append("PRIMARY KEY (NO),");
			queryBuf.append("KEY NO (NO)");
			queryBuf.append(")"); 			
			stmt.executeUpdate(queryBuf.toString());
			
			queryBuf.setLength(0);
			queryBuf.append("CREATE TABLE NEOBOARDGROUP (");
			queryBuf.append("BOARDID        VARCHAR(8)      NOT NULL DEFAULT '',"); 
			queryBuf.append("GRP            VARCHAR(12)     NOT NULL DEFAULT '',"); 
			queryBuf.append("GRPNAME        VARCHAR(50)     NOT NULL DEFAULT '',"); 
			queryBuf.append("REGDATETIME    CHAR(14)         NOT NULL DEFAULT '',");
			queryBuf.append("PRIMARY KEY (BOARDID),");
			queryBuf.append("KEY NO (BOARDID)");
			queryBuf.append(")"); 			
			stmt.executeUpdate(queryBuf.toString());
			
			
			queryBuf.setLength(0);
			queryBuf.append("CREATE TABLE NEOBOARDLOG (");
			queryBuf.append("BOARDID     VARCHAR(8)      NOT NULL DEFAULT '',"); 
			queryBuf.append("BNO         int(9) unsigned not null default '0',"); 
			queryBuf.append("LOGNO       int(9) unsigned not null default '0',"); 
			queryBuf.append("LOGQUERY    CHAR(1)          NOT NULL DEFAULT '',");
			queryBuf.append("USERID      VARCHAR(12)         NULL DEFAULT '',");
			queryBuf.append("USERNAME    VARCHAR(32)         NULL DEFAULT '',");
			queryBuf.append("LOGREGDT    datetime NOT NULL,");
			queryBuf.append("IP          VARCHAR(20)     NOT NULL,");
			queryBuf.append("PRIMARY KEY (BOARDID),");
			queryBuf.append("KEY NO (BOARDID)");
			queryBuf.append(")"); 			
			stmt.executeUpdate(queryBuf.toString());
			
			queryBuf.setLength(0);
			queryBuf.append("CREATE TABLE NEOBOARDPROPERTY (");
			queryBuf.append("BOARDID              VARCHAR(8)        NOT NULL DEFAULT '',"); 
			queryBuf.append("CATEGORYID           VARCHAR(32)       NOT NULL DEFAULT '',"); 
			queryBuf.append("CATEGORYNAME         VARCHAR(64)       NOT NULL DEFAULT '',"); 
			queryBuf.append("BOARDNAME            VARCHAR(64)       NOT NULL DEFAULT '',");
			queryBuf.append("SKINNAME             VARCHAR(64)       NOT NULL DEFAULT '',");
			queryBuf.append("SKINID               VARCHAR(32)       NOT NULL DEFAULT '',");
			queryBuf.append("MAXSUBJECTLENGTH     int(9) default '0',");
			queryBuf.append("LISTPERPAGE          int(9) default '0',");
			queryBuf.append("PAGEPERBLOCK         int(9) default '0',");
			queryBuf.append("TOPINCLUDEFILE       VARCHAR(64)       DEFAULT '',");
			queryBuf.append("TOPINCLUDETEXT       TEXT,");
			queryBuf.append("BOTTOMINCLUDEFILE    VARCHAR(64)       DEFAULT '',");
			queryBuf.append("BOTTOMINCLUDETEXT    TEXT,");
			queryBuf.append("USEREGISTRATION      CHAR(1)            DEFAULT '',");
			queryBuf.append("USEREPLY             CHAR(1)            DEFAULT '',");
			queryBuf.append("USEEDIT              CHAR(1)            DEFAULT '',");
			queryBuf.append("USEDELETE            CHAR(1)            DEFAULT '',");
			queryBuf.append("USECOMMENT           CHAR(1)            DEFAULT '',");
			queryBuf.append("USEIMAGEVIEW         CHAR(1)            DEFAULT '',");
			queryBuf.append("USEAUTH              CHAR(1)            DEFAULT '',");
			queryBuf.append("ALLOWEDEXTENSION     VARCHAR(100)       DEFAULT '',");
			queryBuf.append("MAXUPLOAD            int(9) default '0',");
			queryBuf.append("MAXFILEATTACH        int(9) default '0',");
			queryBuf.append("USESECRET            CHAR(1)            DEFAULT '',");
			queryBuf.append("USENOTICE            CHAR(1)            DEFAULT '',");
			queryBuf.append("USEGROUP             CHAR(1)            DEFAULT '',");
			queryBuf.append("USENEW               CHAR(1)            DEFAULT '',");
			queryBuf.append("NEWLIMIT             int(9) default '0',");
			queryBuf.append("USECOOL              CHAR(1)            DEFAULT '',");
			queryBuf.append("COOLLIMIT            int(9) default '0',");
			queryBuf.append("USEMAILING           VARCHAR(3)        DEFAULT '',");
			queryBuf.append("MAILTEMPLATE         TEXT,");
			queryBuf.append("MAILFROM             VARCHAR(100)       DEFAULT '',");
			queryBuf.append("MAILTO               VARCHAR(100)       DEFAULT '',");
			queryBuf.append("MAILSERVER           VARCHAR(100)       DEFAULT '',");
			queryBuf.append("MAILACCOUNT          VARCHAR(50)        DEFAULT '',");
			queryBuf.append("MAILPASSWD           VARCHAR(50)        DEFAULT '',");
			queryBuf.append("USEDOUBLE            CHAR(1)            DEFAULT '',");
			queryBuf.append("USERSS               CHAR(1)            DEFAULT '',");
			queryBuf.append("STATUS               CHAR(1)            DEFAULT '',");
			queryBuf.append("USEMOVIE             CHAR(1)            DEFAULT '',");
			queryBuf.append("BOARDTYPE            VARCHAR(64)        DEFAULT '',");
			queryBuf.append("PRIMARY KEY (BOARDID),");
			queryBuf.append("KEY NO (BOARDID)");
			queryBuf.append(")");
			stmt.executeUpdate(queryBuf.toString());
						
			con.commit();					
			
			stmt.close(); stmt = null;
			return true;
		} catch (Exception e) {
		    e.printStackTrace();
		    try{
		        con.rollback();
		    }catch(Exception ex) {}
		    return false;
		} finally {
			try {   con.setAutoCommit(true); } catch (Exception e) {}
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
    }
}
