package com.neoboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;
import java.util.Hashtable;
import java.util.Vector;

import com.neoboard.data.Property;
import com.neoboard.jdbc.*;


/**
 * @author <a href="mailto:seagull@mcat.co.kr">Seagull Lee</a> MCAT Lab.
 * @version 1.0
 */
public class TopViewer {
    private static Hashtable factory = new Hashtable();
    private static Hashtable factoryLastAccess = new Hashtable();
    private static Object lock = new Object();

    public static void resetTime(String boardID) {
        if(boardID == null) return;
        synchronized(factoryLastAccess){
            factoryLastAccess.put(boardID,new Long(0));
        }
    }
    public static Vector getList(String boardID , int num) {
        return getList(boardID,num,false);
    }
    /**
     * 게시판의 최근 게시물 얻어오기
     * 5분 간격으로 DB 로부터 리로딩한다. 결과는 메모리로부터 가져감.
     * @param boardID : 게시판 아이디
     * @param num : 게시물 개수
     * @param reload : DB 로부터 리로딩 할지 여부
     * @return
     */
    public static Vector getList(String boardID , int num, boolean reload) {
        long timeMilis = new Date().getTime();
        if(reload) {
            Vector v = getTop(boardID, num);
            if(v.size() == 0 ) return v;
            synchronized(factory) {
                factory.put(boardID,v);
            }
            synchronized(factoryLastAccess) {
                factoryLastAccess.put(boardID,new Long(timeMilis));
            }
            return v;
        }
        Long millis = (Long)factoryLastAccess.get(boardID);
        if(millis != null) {
	        if(timeMilis - millis.longValue() > 1000 * 60 * 5) {
	            Vector v = getTop(boardID, num);
	            if(v.size() == 0 ) return v;
	            synchronized(factory) {
	                factory.put(boardID,v);
	            }
	            synchronized(factoryLastAccess) {
	                factoryLastAccess.put(boardID,new Long(timeMilis));
	            }
	            return v;
	        }
	        Vector list = (Vector)factory.get(boardID);
	        if(list != null) { return (Vector)list.clone(); }
	        else {
	            Vector v = getTop(boardID, num);
	            if(v.size() == 0 ) return v;
	            synchronized(factory) {
	                factory.put(boardID,v);
	            }
	            synchronized(factoryLastAccess) {
	                factoryLastAccess.put(boardID,new Long(timeMilis));
	            }
	            return v;
	        }
        }
        else {
            Vector v = getTop(boardID, num);
            if(v.size() == 0 ) return v;
            synchronized(factory) {
                factory.put(boardID,v);
            }
            synchronized(factoryLastAccess) {
                factoryLastAccess.put(boardID,new Long(timeMilis));
            }
            return v;
        }
    }

    synchronized private static Vector getTop(String boardID, int num) {
    	Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		String tableName = Property.TABLE_PREFIX + boardID.toUpperCase();

        StringBuffer queryBuf = new StringBuffer();
        queryBuf.append(" select no, subject, regdate from ");
        queryBuf.append(tableName);
        queryBuf.append(" order by no desc limit 0, " + (new Integer(num)).toString());

        Vector v = new Vector();
		try {
			con = DBUtil.getConnection();

			stmt = con.createStatement();

			/**
			 * 2016. 03. 21 / MYM
			 * 보안약점 조치
			 */
			String strQuery = "";
			if(queryBuf != null) { strQuery = queryBuf.toString(); }
			if(queryBuf == null) { strQuery = ""; }

			rs = stmt.executeQuery(strQuery);
			int index = 1;
			int topseq = 1;
			while(rs.next()) {
			    index = 1;
			    TopViewData article = new TopViewData();
			    article.setNo(rs.getInt(index++));
			    article.setSubject(rs.getString(index++));
			    article.setRegDateString("yyyy-MM-dd HH:mm:ss", rs.getString(index++));
			    v.add(article);
			}
			rs.close(); rs = null;
			stmt.close(); stmt = null;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (stmt != null) stmt.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
        return v;
    }
}
