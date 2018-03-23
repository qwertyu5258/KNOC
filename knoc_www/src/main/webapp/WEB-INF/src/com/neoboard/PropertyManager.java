package com.neoboard;

import java.io.CharArrayReader;
import java.io.File;
import java.io.Reader;
import java.io.Writer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;
import java.util.ArrayList;

import com.neoboard.common.CommonConstants;
import com.neoboard.data.Authority;
import com.neoboard.data.Common;
import com.neoboard.data.Group;
import com.neoboard.data.Property;
import com.neoboard.jdbc.*;
import com.neoboard.util.*;


/**
 * @author <a href="mailto:seagull@mcat.co.kr">Seagull Lee</a> MCAT Lab.
 * @version 1.0
 */
public class PropertyManager {
 
 String lastErrorMessage = "";
 public String getLastError(){ return lastErrorMessage; }
 public void setLastError(Exception e) { this.lastErrorMessage = e.getMessage(); }
 public void setLastError(String msg) { this.lastErrorMessage = msg; };
 
 
    /** 게시판 생성 실패 ( 중복되는 아이디 ) */
    public static final int ERR_DUPLICATED = 1;
    /** 게시판 생성 실패 ( DB 에러 ) */
    public static final int ERR_DB = 2;
    /** 게시판 생성 서옹 */
    public static final int SUCCESS = 0;

    /** 
     * 게시판 삭제
     * @param boardID
     * @return
     */
    public boolean deleteBoard(String boardID) {
     Connection con = null;
  Statement stmt = null;
  PreparedStatement prestmt = null;
  
  StringBuffer queryBuf = new StringBuffer();
        try {
         con = DBUtil.getConnection();
   con.setAutoCommit(false);
   
   queryBuf.append("delete from NEOBOARDPROPERTY where boardid = ? ");
   
   prestmt = con.prepareStatement(queryBuf.toString());
   
   prestmt.setString(1,boardID);
   prestmt.executeUpdate();
   
   prestmt.close();
   prestmt = null;
   
   queryBuf.setLength(0);
   queryBuf.append("delete from NEOBOARDAUTHORITY ");
   queryBuf.append("where BOARDID = ? ");
   
   prestmt = con.prepareStatement(queryBuf.toString());
   prestmt.setString(1, boardID);
   prestmt.executeUpdate();
   
   prestmt.close(); prestmt = null;
   con.commit();
      
   queryBuf.setLength(0);
   queryBuf.append("delete from NEOBOARDGROUP ");
   queryBuf.append("where BOARDID = ? ");
   
   prestmt = con.prepareStatement(queryBuf.toString());
   prestmt.setString(1, boardID);
   prestmt.executeUpdate();
   
   prestmt.close(); prestmt = null;
   con.commit();
   
   stmt = con.createStatement();
   queryBuf.setLength(0);
   queryBuf.append("drop table " + Property.TABLE_PREFIX + boardID.toUpperCase());
   stmt.executeUpdate(queryBuf.toString());
   queryBuf.setLength(0);
   queryBuf.append("drop table " + Property.TABLE_PREFIX + boardID.toUpperCase() + "CMT");
   stmt.executeUpdate(queryBuf.toString());
   queryBuf.setLength(0);
   queryBuf.append("drop table " + Property.TABLE_PREFIX + boardID.toUpperCase() + "FILE");
   stmt.executeUpdate(queryBuf.toString());
   con.commit();
   
   /* 파일 삭제 */
   File dir = new File(Property.ROOT_DIR + "/" + boardID);
   File[] files = dir.listFiles();
   if(files != null) {
       for(int i = 0 ; i < files.length ; i++) {
           if(files[i].isFile() && files[i].exists()) {
               files[i].delete();
           }
       }
   }
   return true;
  } catch (Exception e) {
      e.printStackTrace();
      try{
          con.rollback();
      }catch(Exception ex) {}
      return false;
  } finally {
   try {   con.setAutoCommit(true);} catch (Exception e) {}
   try {  if (stmt != null) stmt.close(); } catch (Exception e) {}
   try {  if (prestmt != null) prestmt.close(); } catch (Exception e) {}
   try {  if (con != null) con.close(); } catch (Exception e) {}
  }
    }
    /**
     * 게시판 변경
     * @param property
     * @param auth
     * @return
     */
    public boolean updateBoard(Property property, Authority auth) {
        Connection con = null;
  PreparedStatement prestmt = null;
  ResultSet rs = null;
  StringBuffer queryBuf = new StringBuffer();
        try {
         con = DBUtil.getConnection();
   con.setAutoCommit(false);
   
   queryBuf.append("update NEOBOARDPROPERTY ");
   queryBuf.append("set boardName = ?, ");
   queryBuf.append("boardType = ?, ");
   queryBuf.append("CategoryID = ?, ");
   queryBuf.append("CategoryName = ?, ");
   queryBuf.append("skinID = ?,");
   queryBuf.append("skinName = ?,");
   queryBuf.append("maxsubjectlength = ?,");
   queryBuf.append("listperpage= ?,");
   queryBuf.append("pageperblock = ?,");
   queryBuf.append("topincludetext = ?,");
   queryBuf.append("bottomincludetext = ?,");
   queryBuf.append("useRegistration = ?,");
   queryBuf.append("useReply = ?,");
   queryBuf.append("useEdit = ?,");
   queryBuf.append("useDelete = ?,");
   queryBuf.append("useComment = ?,");
   queryBuf.append("useImageView = ?,");
   queryBuf.append("useAUth = ?,");
   queryBuf.append("allowedExtension = ?,");
   queryBuf.append("maxUpload = ?,");
   queryBuf.append("maxFileAttach = ?,");
   queryBuf.append("useSecret = ?,");
   queryBuf.append("useNotice = ?,");
   queryBuf.append("useGroup = ?,");
   queryBuf.append("useNew = ?,");
   if(property.getUseNew().equals("1")) {
    queryBuf.append("newLimit = ?,");
   }
   queryBuf.append("useCool = ?,");
   if(property.getUseCool().equals("1")) {
    queryBuf.append("coolLimit = ?,");
   }
   queryBuf.append("useMailing = ?,");
   if(property.getUseMailing().indexOf("E")>-1 || property.getUseMailing().indexOf("W")>-1 || property.getUseMailing().indexOf("R")>-1) {
    queryBuf.append("mailTemplate = ?,");
    queryBuf.append("mailFrom= ?,");
    queryBuf.append("mailTo = ?,");
    queryBuf.append("mailServer = ?,");
    queryBuf.append("mailAccount = ?,");
    queryBuf.append("mailPasswd = ?,");
   }
   queryBuf.append("useDouble = ?,");
   queryBuf.append("useRss = ?,");
   queryBuf.append("status = ?,");
   queryBuf.append("useMovie = ?,");
   queryBuf.append("banwd = ?,");
   queryBuf.append("banip = ?,");
   queryBuf.append("pageurl = ?,");
   queryBuf.append("useSearch = ?,");
   queryBuf.append("useSms = ?,");
   queryBuf.append("smsText = ?,");
   queryBuf.append("smsNumber = ?");
   queryBuf.append(" where boardid = ?");
   
   int index = 1;
   prestmt = con.prepareStatement(queryBuf.toString());
   
   
   
   String boardName = property.getBoardName();
   String categoryID = property.getCategoryID();
   String categoryName = property.getCategoryName();
   String skinName = property.getSkinName();
   String topIncludeText = property.getTopIncludeText();
   String bottomIncludeText = property.getBottomIncludeText();
   String banwd = property.getBanwd();
   String smsText = property.getSmsText(); 
   
   if(!CommonConstants.IS_DEV){
	   //String boardName = property.getBoardName();
	   try{  boardName = new String(boardName.getBytes("8859_1"),"EUC-KR"); } catch (Exception e) { }
	   
	   //String categoryID = property.getCategoryID();
	   try{  categoryID = new String(categoryID.getBytes("8859_1"),"EUC-KR"); } catch (Exception e) { }
	   
	   //String categoryName = property.getCategoryName();
	   try{  categoryName = new String(categoryName.getBytes("8859_1"),"EUC-KR"); } catch (Exception e) { }
	   
	   //String skinName = property.getSkinName();
	   try{  skinName = new String(skinName.getBytes("8859_1"),"EUC-KR"); } catch (Exception e) { }   
	
	   //String topIncludeText = property.getTopIncludeText();
	   try{  topIncludeText = new String(topIncludeText.getBytes("8859_1"),"EUC-KR"); } catch (Exception e) { }
	
	   //String bottomIncludeText = property.getBottomIncludeText();
	   try{  bottomIncludeText = new String(bottomIncludeText.getBytes("8859_1"),"EUC-KR"); } catch (Exception e) { }
	
	   //String banwd = property.getBanwd();
	   try{  banwd = new String(banwd.getBytes("8859_1"),"EUC-KR"); } catch (Exception e) { }
	
	   //String smsText = property.getSmsText(); 
	   try{  smsText = new String(smsText.getBytes("8859_1"),"EUC-KR"); } catch (Exception e) { }
   
   }
   
  
   

   
   prestmt.setString(index++, boardName);
   prestmt.setString(index++, property.getBoardType());
   prestmt.setString(index++, categoryID);
   prestmt.setString(index++, categoryName);
   prestmt.setString(index++, property.getSkinID());
   prestmt.setString(index++, skinName);
   prestmt.setInt(index++,property.getMaxSubjectLength());
   prestmt.setInt(index++,property.getListPerPage());
   prestmt.setInt(index++,property.getPagePerBlock());
   prestmt.setString(index++,topIncludeText);
   prestmt.setString(index++,bottomIncludeText);
   prestmt.setString(index++,property.getUseRegistration());
   prestmt.setString(index++,property.getUseReply());
   prestmt.setString(index++,property.getUseEdit());
   prestmt.setString(index++,property.getUseDelete());
   prestmt.setString(index++,property.getUseComment());
   prestmt.setString(index++,property.getUseImageView());
   prestmt.setString(index++,property.getUseAuth());
   prestmt.setString(index++,property.getAllowedExtension());
   prestmt.setInt(index++,property.getMaxUpload());
   prestmt.setInt(index++,property.getMaxFileAttach());
   prestmt.setString(index++, property.getUseSecret());
   prestmt.setString(index++, property.getUseNotice()); 
   prestmt.setString(index++, property.getUseGroup());
   prestmt.setString(index++, property.getUseNew());
   if(property.getUseNew().equals("1")) {
    prestmt.setInt(index++,property.getNewLimit());
   }
   prestmt.setString(index++,property.getUseCool());
   if(property.getUseCool().equals("1")) {
    prestmt.setInt(index++,property.getCoolLimit());
   }
   prestmt.setString(index++,property.getUseMailing());
   if(property.getUseMailing().indexOf("E")>-1 || property.getUseMailing().indexOf("W")>-1 || property.getUseMailing().indexOf("R")>-1) {
    
    prestmt.setString(index++,property.getMailTemplate());
    prestmt.setString(index++,property.getMailFrom());
    prestmt.setString(index++,property.getMailTo());
    prestmt.setString(index++,property.getMailServer());
    prestmt.setString(index++,property.getMailAccount());
    prestmt.setString(index++,property.getMailPasswd());
   }
   prestmt.setString(index++,property.getUseDouble());
   prestmt.setString(index++,property.getUseRss());
   prestmt.setString(index++,property.getStatus());
   prestmt.setString(index++,property.getUseMovie());
   prestmt.setString(index++,banwd);
   prestmt.setString(index++,property.getBanIp());
   prestmt.setString(index++,property.getPageUrl());
   prestmt.setString(index++,property.getUseSearch());
   prestmt.setString(index++,property.getUseSms());
   prestmt.setString(index++,smsText);
   prestmt.setString(index++,property.getSmsNumber());
   prestmt.setString(index++,property.getBoardID());   
   prestmt.executeUpdate();
   prestmt.close(); prestmt = null;
      
   
   queryBuf.setLength(0);
   queryBuf.append("update NEOBOARDAUTHORITY set ");
   queryBuf.append("LEVELLIST = ?,");
   queryBuf.append("LISTALLOWEDUSER = ?,");
   queryBuf.append("LEVELVIEW = ?,");
   queryBuf.append("VIEWALLOWEDUSER = ?,");
   queryBuf.append("LEVELREGISTRATION = ?,");
   queryBuf.append("REGISTRATIONALLOWEDUSER = ?,");
   queryBuf.append("LEVELREPLY = ?,");
   queryBuf.append("REPLYALLOWEDUSER = ?,");
   queryBuf.append("LEVELEDIT = ?,");
   queryBuf.append("EDITALLOWEDUSER = ?,");
   queryBuf.append("LEVELDELETE = ?,");
   queryBuf.append("DELETEALLOWEDUSER = ?,");
   queryBuf.append("LEVELCOMMENTWRITE = ?,");
   queryBuf.append("COMMENTWRITEALLOWEDUSER = ?,");
   queryBuf.append("LEVELCOMMENTDELETE = ?,");
   queryBuf.append("COMMENTDELETEALLOWEDUSER = ?,");
   queryBuf.append("MASTER = ?, ");
   queryBuf.append("LEVELNOTICE = ?, ");
   queryBuf.append("NOTICEALLOWEDUSER = ?, ");
   queryBuf.append("LEVELDOWN = ?, ");
   queryBuf.append("DOWNALLOWEDUSER = ? ");
   queryBuf.append("where BOARDID = ? ");
   
   index = 1;
   prestmt = con.prepareStatement(queryBuf.toString());
   prestmt.setInt(index++,auth.getLevelList());
   prestmt.setString(index++,auth.getListAllowedUser());
   prestmt.setInt(index++,auth.getLevelView());
   prestmt.setString(index++,auth.getViewAllowedUser());
   prestmt.setInt(index++,auth.getLevelRegistration());
   prestmt.setString(index++,auth.getRegistrationAllowedUser());
   prestmt.setInt(index++,auth.getLevelReply());
   prestmt.setString(index++,auth.getReplyAllowedUser());
   prestmt.setInt(index++,auth.getLevelEdit());
   prestmt.setString(index++,auth.getEditAllowedUser());
   prestmt.setInt(index++,auth.getLevelDelete());
   prestmt.setString(index++,auth.getDeleteAllowedUser());
   prestmt.setInt(index++,auth.getLevelCommentWrite());
   prestmt.setString(index++,auth.getCommentWriteAllowedUser());
   prestmt.setInt(index++,auth.getLevelCommentDelete());
   prestmt.setString(index++,auth.getCommentDeleteAllowedUser());
   prestmt.setString(index++,auth.getMaster());
   prestmt.setInt(index++,auth.getLevelNotice());
   prestmt.setString(index++,auth.getNoticeAllowedUser());
   prestmt.setInt(index++,auth.getLevelDown());
   prestmt.setString(index++,auth.getDownAllowedUser());
   prestmt.setString(index++,auth.getBoardID());
   prestmt.executeUpdate();
   
   prestmt.close(); prestmt = null;
   con.commit();
   
   return true;
  } catch (Exception e) {
      e.printStackTrace();
      try{
          con.rollback();
      }catch(Exception ex) {}
      return false;
  } finally {
   try {   con.setAutoCommit(true); } catch (Exception e) {}
   try {  if (rs != null) rs.close(); } catch (Exception e) {}
   try {  if (prestmt != null) prestmt.close(); } catch (Exception e) {}
   try {  if (con != null) con.close(); } catch (Exception e) {}
  }
    }
    /**
     * 게시판 생성
     * @param property
     * @param auth
     * @return
     */
    public boolean createBoard(Property property,Authority auth) {
        Connection con = null;
  Statement stmt = null;
  PreparedStatement prestmt = null;
  ResultSet rs = null;
  
  StringBuffer queryBuf = new StringBuffer();
        try {
         con = DBUtil.getConnection();
   con.setAutoCommit(false);
   
   queryBuf.append("insert into ");
         queryBuf.append("NEOBOARDPROPERTY");
         queryBuf.append(" (boardid, categoryid, categoryname, boardname, boardtype, skinname, skinid, maxsubjectlength" +
           ", listperpage, pageperblock, topincludefile, topincludetext, bottomincludefile, bottomincludetext" +
           ", useRegistration, usereply, useedit, usedelete, usecomment, useimageview, useauth, allowedextension" +
           ", maxupload, maxfileattach ,usesecret, usenotice, usegroup, usenew" +
           ", newlimit, usecool, coollimit, usemailing, mailtemplate, mailfrom, mailto, mailserver, mailaccount" +
           ", mailpasswd, usedouble, userss, status, useMovie, banwd, banip, pageurl, useSearch, useSms, smsText, smsNumber ) ");
         queryBuf.append("values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
         
   int index = 1;
   prestmt = con.prepareStatement(queryBuf.toString()); 
   
   String boardName = property.getBoardName();
   try{  boardName = new String(boardName.getBytes("8859_1"),"EUC-KR"); } catch (Exception e) { }
   
   String categoryID = property.getCategoryID();
   try{  categoryID = new String(categoryID.getBytes("8859_1"),"EUC-KR"); } catch (Exception e) { }
   
   String categoryName = property.getCategoryName();
   try{  categoryName = new String(categoryName.getBytes("8859_1"),"EUC-KR"); } catch (Exception e) { }
   
   String skinName = property.getSkinName();
   try{  skinName = new String(skinName.getBytes("8859_1"),"EUC-KR"); } catch (Exception e) { }   

   String topIncludeText = property.getTopIncludeText();
   try{  topIncludeText = new String(topIncludeText.getBytes("8859_1"),"EUC-KR"); } catch (Exception e) { }

   String bottomIncludeText = property.getBottomIncludeText();
   try{  bottomIncludeText = new String(bottomIncludeText.getBytes("8859_1"),"EUC-KR"); } catch (Exception e) { }

   String banwd = property.getBanwd();
   try{  banwd = new String(banwd.getBytes("8859_1"),"EUC-KR"); } catch (Exception e) { }

   String smsText = property.getSmsText();
   try{  smsText = new String(smsText.getBytes("8859_1"),"EUC-KR"); } catch (Exception e) { }

   
   prestmt.setString(index++, property.getBoardID().toUpperCase());
   prestmt.setString(index++, categoryID);
   prestmt.setString(index++, categoryName);
   prestmt.setString(index++, boardName);
   prestmt.setString(index++, property.getBoardType());
   prestmt.setString(index++, skinName);
   prestmt.setString(index++, property.getSkinID());
   prestmt.setInt(index++,property.getMaxSubjectLength());
   prestmt.setInt(index++,property.getListPerPage());
   prestmt.setInt(index++,property.getPagePerBlock());
   prestmt.setString(index++, property.getTopIncludeFile());
   prestmt.setString(index++, topIncludeText);
   prestmt.setString(index++, property.getBottomIncludeFile());
   prestmt.setString(index++, bottomIncludeText);
   prestmt.setString(index++, property.getUseRegistration());
   prestmt.setString(index++, property.getUseReply());
   prestmt.setString(index++, property.getUseEdit());
   prestmt.setString(index++, property.getUseDelete());
   prestmt.setString(index++, property.getUseComment());
   prestmt.setString(index++, property.getUseImageView());
   prestmt.setString(index++, property.getUseAuth());
   prestmt.setString(index++, property.getAllowedExtension());
   prestmt.setInt(index++,property.getMaxUpload());
   prestmt.setInt(index++,property.getMaxFileAttach());
   prestmt.setString(index++, property.getUseSecret());
   prestmt.setString(index++, property.getUseNotice());
   prestmt.setString(index++, property.getUseGroup());
   prestmt.setString(index++, property.getUseNew());
   prestmt.setInt(index++,property.getNewLimit());
   prestmt.setString(index++, property.getUseCool());
   prestmt.setInt(index++,property.getCoolLimit());
   prestmt.setString(index++, property.getUseMailing());
   prestmt.setString(index++, property.getMailTemplate()); 
   prestmt.setString(index++, property.getMailFrom());
   prestmt.setString(index++, property.getMailTo());
   prestmt.setString(index++, property.getMailServer());
   prestmt.setString(index++, property.getMailAccount());
   prestmt.setString(index++, property.getMailPasswd());
   prestmt.setString(index++, property.getUseDouble());
   prestmt.setString(index++, property.getUseRss());
   prestmt.setString(index++, property.getStatus());
   prestmt.setString(index++, property.getUseMovie());
   prestmt.setString(index++, banwd);
   prestmt.setString(index++, property.getBanIp());
   prestmt.setString(index++, property.getPageUrl());
   prestmt.setString(index++, property.getUseSearch());
   prestmt.setString(index++, property.getUseSms());
   prestmt.setString(index++, smsText);
   prestmt.setString(index++, property.getSmsNumber());
   prestmt.executeUpdate();
   
   prestmt.close();
   prestmt = null;
   
   
   queryBuf.setLength(0);
   queryBuf.append("insert into ");
         queryBuf.append("NEOBOARDAUTHORITY");
         queryBuf.append(" (boardid, levellist, listallowedUser, levelView, viewAllowedUser," +
           "levelRegistration, registrationAllowedUser, levelReply, replyAllowedUser," +
           "leveledit, editAllowedUser, leveldelete, deleteAllowedUser, " +
           "levelCommentWrite, commentWriteAllowedUser, levelCommentDelete, commentDeleteAllowedUser," +
           "master , levelNotice, noticeAllowedUser, levelDown, downAllowedUser) ");
         queryBuf.append("values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
         
         index = 1;
   prestmt = con.prepareStatement(queryBuf.toString());
   prestmt.setString(index++, auth.getBoardID());
   prestmt.setInt(index++,auth.getLevelList());
   prestmt.setString(index++, auth.getListAllowedUser());
   prestmt.setInt(index++,auth.getLevelView());
   prestmt.setString(index++, auth.getViewAllowedUser());
   prestmt.setInt(index++,auth.getLevelRegistration());
   prestmt.setString(index++, auth.getRegistrationAllowedUser());
   prestmt.setInt(index++,auth.getLevelReply());
   prestmt.setString(index++, auth.getReplyAllowedUser());
   prestmt.setInt(index++,auth.getLevelEdit());
   prestmt.setString(index++, auth.getEditAllowedUser());
   prestmt.setInt(index++,auth.getLevelDelete());
   prestmt.setString(index++, auth.getDeleteAllowedUser());
   prestmt.setInt(index++,auth.getLevelCommentWrite());
   prestmt.setString(index++, auth.getCommentWriteAllowedUser());
   prestmt.setInt(index++,auth.getLevelCommentDelete());
   prestmt.setString(index++, auth.getCommentDeleteAllowedUser());
   prestmt.setString(index++, auth.getMaster());
   prestmt.setInt(index++,auth.getLevelNotice());
   prestmt.setString(index++, auth.getNoticeAllowedUser());
   prestmt.setInt(index++,auth.getLevelDown());
   prestmt.setString(index++, auth.getDownAllowedUser());
   prestmt.executeUpdate();
   
   prestmt.close(); prestmt = null;
   stmt = con.createStatement();
   /* CREATE SCHEMA */
   queryBuf.setLength(0);/*
   queryBuf.append("CREATE TABLE " + Property.TABLE_PREFIX + property.getBoardID().toUpperCase() + " (");
   queryBuf.append("NO int(9) unsigned not null default '0',");
   queryBuf.append("REF int(10) unsigned not null default '0',");
   queryBuf.append("REFSTEP int(10) not null default '0',");
   queryBuf.append("REFLEVEL int(10) not null default '0',");
   queryBuf.append("ID CHAR(32) DEFAULT '',");
   queryBuf.append("NAME CHAR(32) DEFAULT '',");
   queryBuf.append("PASSWD CHAR(64) DEFAULT '',");
   queryBuf.append("SUBJECT VARCHAR(255) NOT NULL DEFAULT '',");
   queryBuf.append("EMAIL VARCHAR(255) DEFAULT '',");
   queryBuf.append("CONTENT TEXT,");
   queryBuf.append("IP CHAR(15) NOT NULL DEFAULT '',");
   queryBuf.append("REGDATE datetime NOT NULL,");
   queryBuf.append("HITCNT int(9) unsigned not null default '0',");
   queryBuf.append("CMTCNT int(9) unsigned not null default '0',");
   queryBuf.append("FILECNT int(9) unsigned not null default '0',");
   queryBuf.append("DOWNCNT int(9) unsigned not null default '0',");
   queryBuf.append("HTML CHAR(1) NOT NULL DEFAULT '',");
   queryBuf.append("NOTICE CHAR(1) NOT NULL DEFAULT '',");
   queryBuf.append("SECRET CHAR(1) NOT NULL DEFAULT '',"); 
   queryBuf.append("GRP VARCHAR(32) DEFAULT '',");
   queryBuf.append("EDITDATE datetime,");
   queryBuf.append("ANSDATE datetime,");
   queryBuf.append("PHONE VARCHAR(15) DEFAULT '',");
   queryBuf.append("ZIPCODE CHAR(6) DEFAULT '',");
   queryBuf.append("ADDR1 VARCHAR(255) DEFAULT '',");
   queryBuf.append("ADDR2 VARCHAR(255) DEFAULT '',");
   queryBuf.append("IS_DELETE CHAR(1) DEFAULT 'N',");
   queryBuf.append("RSS_YN CHAR(1) DEFAULT 'N',");
   queryBuf.append("MOVE_BID VARCHAR(8) DEFAULT '',");
   queryBuf.append("URL VARCHAR(255) DEFAULT '',");
   queryBuf.append("VIRTUALNO VARCHAR(50) DEFAULT '',");
   queryBuf.append("PRIMARY KEY (NO),");
   queryBuf.append("KEY NO (NO),");
   queryBuf.append("KEY REF (REF,REFSTEP)");
   queryBuf.append(") ENGINE=MyISAM DEFAULT CHARSET=euckr;");
   
   stmt.executeUpdate(queryBuf.toString());
      
   queryBuf.setLength(0);
   queryBuf.append("CREATE TABLE " + Property.TABLE_PREFIX + property.getBoardID().toUpperCase() + "CMT ( ");
   queryBuf.append("NO int(9) unsigned not null default '0',");
   queryBuf.append("BNO int(9) unsigned not null default '0',");
   queryBuf.append("ID VARCHAR(64) DEFAULT '',");
   queryBuf.append("NAME VARCHAR(64) NOT NULL DEFAULT '',");
   queryBuf.append("PASSWD VARCHAR(64) DEFAULT '',");
   queryBuf.append("COMENT TEXT,");
   queryBuf.append("IP VARCHAR(15) NOT NULL DEFAULT '',");
   queryBuf.append("REGDATE datetime NOT NULL,");
   queryBuf.append("PRIMARY KEY (NO),");
   queryBuf.append("KEY NO (NO)");
   queryBuf.append(") ENGINE=MyISAM DEFAULT CHARSET=euckr");
   
   stmt.executeUpdate(queryBuf.toString());
      
   queryBuf.setLength(0);
   queryBuf.append("CREATE TABLE " + Property.TABLE_PREFIX + property.getBoardID().toUpperCase() +"FILE (");
   queryBuf.append("NO int(9) unsigned not null default '0',");
   queryBuf.append("BNO int(9) unsigned not null default '0',");
   queryBuf.append("FILENAME VARCHAR(255) NOT NULL DEFAULT '',");
   queryBuf.append("FILESIZE int(9) unsigned not null default '0',");
   queryBuf.append("DOWNCNT int(9) unsigned not null default '0',");
   queryBuf.append("REGDATE datetime NOT NULL,");
   queryBuf.append("STATE CHAR(1) DEFAULT '1',");
   queryBuf.append("FOLDER VARCHAR(100) NOT NULL DEFAULT '',");
   queryBuf.append("NEW_FILENAME VARCHAR(255) NOT NULL DEFAULT '',");
   queryBuf.append("BUN VARCHAR(2) DEFAULT '',");
   queryBuf.append("PRIMARY KEY (NO),");
   queryBuf.append("KEY NO (NO)");
   queryBuf.append(") ENGINE=MyISAM DEFAULT CHARSET=euckr");
   */
   queryBuf.append("CREATE TABLE " + Property.TABLE_PREFIX + property.getBoardID().toUpperCase() + " (");
   queryBuf.append("NO NUMBER  default 0 not null ,");
   queryBuf.append("REF NUMBER  default 0 not null ,");
   queryBuf.append("REFSTEP NUMBER  default 0 not null ,");
   queryBuf.append("REFLEVEL NUMBER  default 0 not null ,");
   queryBuf.append("ID CHAR(32) DEFAULT '',");
   queryBuf.append("NAME CHAR(32) DEFAULT '',");
   queryBuf.append("PASSWD CHAR(64) DEFAULT '',");
   queryBuf.append("SUBJECT VARCHAR(255) DEFAULT '' NOT NULL  ,");
   queryBuf.append("EMAIL VARCHAR(255) DEFAULT '',");
   queryBuf.append("CONTENT CLOB,");
   queryBuf.append("IP CHAR(15)  DEFAULT '' NOT NULL,");
   queryBuf.append("REGDATE DATE NOT NULL,");
   queryBuf.append("HITCNT NUMBER  default 0 not null,");
   queryBuf.append("CMTCNT NUMBER  default 0 not null,");
   queryBuf.append("FILECNT NUMBER  default 0 not null,");
   queryBuf.append("DOWNCNT NUMBER  default 0 not null,");
   queryBuf.append("HTML CHAR(1)DEFAULT ''  NOT NULL ,");
   queryBuf.append("NOTICE CHAR(1) DEFAULT ''  NOT NULL ,");
   queryBuf.append("SECRET CHAR(1) DEFAULT ''  NOT NULL,"); 
   queryBuf.append("GRP VARCHAR(32) DEFAULT '',");
   queryBuf.append("EDITDATE DATE,");
   queryBuf.append("ANSDATE DATE,");
   queryBuf.append("PHONE VARCHAR(15) DEFAULT '',");
   queryBuf.append("ZIPCODE CHAR(6) DEFAULT '',");
   queryBuf.append("ADDR1 VARCHAR(255) DEFAULT '',");
   queryBuf.append("ADDR2 VARCHAR(255) DEFAULT '',");
   queryBuf.append("IS_DELETE CHAR(1) DEFAULT 'N',");
   queryBuf.append("RSS_YN CHAR(1) DEFAULT 'N',");
   queryBuf.append("MOVE_BID VARCHAR(8) DEFAULT '',");
   queryBuf.append("URL VARCHAR(255) DEFAULT '',");
   queryBuf.append("VIRTUALNO VARCHAR(50) DEFAULT '',");
   queryBuf.append("CONSTRAINT PK"+  Property.TABLE_PREFIX +property.getBoardID().toUpperCase()+" PRIMARY KEY ( NO)");
   queryBuf.append(")");
   
   stmt.executeUpdate(queryBuf.toString());
    
   
   queryBuf.setLength(0);
   queryBuf.append(" CREATE INDEX "+  Property.TABLE_PREFIX +property.getBoardID().toUpperCase()+"_REF_REFSTEP_IDX ON " + Property.TABLE_PREFIX + property.getBoardID().toUpperCase() + " ");
   queryBuf.append("(REF,REFSTEP)");
   stmt.executeUpdate(queryBuf.toString());
   
   queryBuf.setLength(0);
   queryBuf.append("CREATE TABLE " + Property.TABLE_PREFIX + property.getBoardID().toUpperCase() + "CMT ( ");
   queryBuf.append("NO  NUMBER  default 0 not null ,");
   queryBuf.append("BNO  NUMBER  default 0 not null ,");
   queryBuf.append("ID VARCHAR(64) DEFAULT '',");
   queryBuf.append("NAME VARCHAR(64)  DEFAULT '' NOT NULL ,");
   queryBuf.append("PASSWD VARCHAR(64) DEFAULT '',");
   queryBuf.append("COMENT CLOB,");
   queryBuf.append("IP VARCHAR(15)  DEFAULT '' NOT NULL,");
   queryBuf.append("REGDATE DATE NOT NULL,");
   queryBuf.append("CONSTRAINT PK"+  Property.TABLE_PREFIX +property.getBoardID().toUpperCase()+"CMT PRIMARY KEY ( NO)"); 
   queryBuf.append(")");
   
   stmt.executeUpdate(queryBuf.toString());
      
   queryBuf.setLength(0);
   queryBuf.append("CREATE TABLE " + Property.TABLE_PREFIX + property.getBoardID().toUpperCase() +"FILE (");
   queryBuf.append("NO NUMBER  default 0 not null ,");
   queryBuf.append("BNO NUMBER  default 0 not null ,");
   queryBuf.append("FILENAME VARCHAR(255)  DEFAULT '' NOT NULL,");
   queryBuf.append("FILESIZE NUMBER  default 0 not null,");
   queryBuf.append("DOWNCNT NUMBER  default 0 not null,");
   queryBuf.append("REGDATE DATE NOT NULL,");
   queryBuf.append("STATE CHAR(1) DEFAULT '1',");
   queryBuf.append("FOLDER VARCHAR(100) DEFAULT '' NOT NULL ,");
   queryBuf.append("NEW_FILENAME VARCHAR(255) DEFAULT ''  NOT NULL,");
   queryBuf.append("BUN VARCHAR(2) DEFAULT '',"); 
   queryBuf.append("CONSTRAINT PK"+  Property.TABLE_PREFIX +property.getBoardID().toUpperCase()+"FILE PRIMARY KEY ( NO)"); 
 
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
   try {  if (rs != null) rs.close(); } catch (Exception e) {}
   try {  if (stmt != null) stmt.close(); } catch (Exception e) {}
   try {  if (prestmt != null) prestmt.close(); } catch (Exception e) {}
   try {  if (con != null) con.close(); } catch (Exception e) {}
  }
    }
    /**
     *  카테고리 별로 게시판 가져오기
     * @param categoryID
     * @return
     */
    public Vector getPropertiesByCategory(String categoryID) {
        Connection con = null;
  ResultSet rs = null;
  PreparedStatement prestmt = null;
  
  String query = "Select * from NEOBOARDPROPERTY where categoryID = ?";
  Vector<Property> v = new Vector<Property>();
  try {
   con = DBUtil.getConnection();
  
      prestmt = con.prepareStatement(query);
      prestmt.setString(1, categoryID );
   rs = prestmt.executeQuery();
   int index = 1;
   while(rs.next()) {
       index = 1;
       Property prop = new Property();
       prop.setBoardID(rs.getString(index++));
       prop.setCategoryID(rs.getString(index++));
       prop.setCategoryName(rs.getString(index++));
       prop.setBoardName(rs.getString(index++));
       prop.setSkinName(rs.getString(index++));
       prop.setSkinID(rs.getString(index++));
       prop.setMaxSubjectLength(rs.getInt(index++));
       prop.setListPerPage(rs.getInt(index++));
       prop.setPagePerBlock(rs.getInt(index++));       
       prop.setTopIncludeFile(rs.getString(index++));
       prop.setTopIncludeText(rs.getString(index++));
       prop.setBottomIncludeFile(rs.getString(index++));
       prop.setBottomIncludeText(rs.getString(index++));
       prop.setUseRegistration(rs.getString(index++));
       prop.setUseReply(rs.getString(index++));
       prop.setUseEdit(rs.getString(index++));
       prop.setUseDelete(rs.getString(index++));
       prop.setUseComment(rs.getString(index++));
       prop.setUseImageView(rs.getString(index++));
       prop.setUseAuth(rs.getString(index++));
       prop.setAllowedExtension(rs.getString(index++));
       prop.setMaxUpload(rs.getInt(index++));
       prop.setMaxFileAttach(rs.getInt(index++));
       prop.setUseSecret(rs.getString(index++));
       prop.setUseNotice(rs.getString(index++));
       prop.setUseGroup(rs.getString(index++));
       prop.setUseNew(rs.getString(index++));
       prop.setNewLimit(rs.getInt(index++));
       prop.setUseCool(rs.getString(index++));
       prop.setCoolLimit(rs.getInt(index++));
       prop.setUseMailing(rs.getString(index++));
       prop.setMailTemplate(rs.getString(index++));
       prop.setMailFrom(rs.getString(index++));
       prop.setMailTo(rs.getString(index++));
       prop.setMailServer(rs.getString(index++));
       prop.setMailAccount(rs.getString(index++));
       prop.setMailPasswd(rs.getString(index++));
       prop.setUseDouble(rs.getString(index++));
       prop.setUseRss(rs.getString(index++));
       prop.setStatus(rs.getString(index++));
       prop.setUseMovie(rs.getString(index++));
       prop.setBanwd(rs.getString(index++));
       prop.setBanIp(rs.getString(index++));
       prop.setPageUrl(rs.getString(index++));
       prop.setUseSearch(rs.getString(index++));
       prop.setUseSms(rs.getString(index++));
       prop.setSmsText(rs.getString(index++));
       prop.setSmsNumber(rs.getString(index++));
       v.add(prop);
   }
   rs.close();
   prestmt.close();
  } catch (Exception e) {
   e.printStackTrace();
  } finally {
   try {  if (rs != null) rs.close(); } catch (Exception e) {}
   try {  if (prestmt != null) prestmt.close(); } catch (Exception e) {}
   try {  if (con != null) con.close(); } catch (Exception e) {}
  }
        return v;
    }
    
    /**
     * 스킨 별로 게시판 가져오기
     * @param skinID
     * @return
     */
    public Vector getPropertiesBySkin(String skinID) {
        Connection con = null;
  ResultSet rs = null;
  PreparedStatement prestmt = null;
  
  String query = "Select * from NEOBOARDPROPERTY where skinID like '%" + skinID + "%'";
  Vector<Property> v = new Vector<Property>();
  try {
   con = DBUtil.getConnection();
  
      prestmt = con.prepareStatement(query);
   rs = prestmt.executeQuery();
   int index = 1;
   while(rs.next()) {
    index = 1;
       Property prop = new Property();
       prop.setBoardID(rs.getString(index++));
       prop.setCategoryID(rs.getString(index++));
       prop.setCategoryName(rs.getString(index++));
       prop.setBoardName(rs.getString(index++));
       prop.setSkinName(rs.getString(index++));
       prop.setSkinID(rs.getString(index++));
       prop.setMaxSubjectLength(rs.getInt(index++));
       prop.setListPerPage(rs.getInt(index++));
       prop.setPagePerBlock(rs.getInt(index++));       
       prop.setTopIncludeFile(rs.getString(index++));
       prop.setTopIncludeText(rs.getString(index++));
       prop.setBottomIncludeFile(rs.getString(index++));
       prop.setBottomIncludeText(rs.getString(index++));
       prop.setUseRegistration(rs.getString(index++));
       prop.setUseReply(rs.getString(index++));
       prop.setUseEdit(rs.getString(index++));
       prop.setUseDelete(rs.getString(index++));
       prop.setUseComment(rs.getString(index++));
       prop.setUseImageView(rs.getString(index++));
       prop.setUseAuth(rs.getString(index++));
       prop.setAllowedExtension(rs.getString(index++));
       prop.setMaxUpload(rs.getInt(index++));
       prop.setMaxFileAttach(rs.getInt(index++));
       prop.setUseSecret(rs.getString(index++));
       prop.setUseNotice(rs.getString(index++));
       prop.setUseGroup(rs.getString(index++));
       prop.setUseNew(rs.getString(index++));
       prop.setNewLimit(rs.getInt(index++));
       prop.setUseCool(rs.getString(index++));
       prop.setCoolLimit(rs.getInt(index++));
       prop.setUseMailing(rs.getString(index++));       
       prop.setMailTemplate(rs.getString(index++));
       prop.setMailFrom(rs.getString(index++));
       prop.setMailTo(rs.getString(index++));
       prop.setMailServer(rs.getString(index++));
       prop.setMailAccount(rs.getString(index++));
       prop.setMailPasswd(rs.getString(index++));
       prop.setUseDouble(rs.getString(index++));
       prop.setUseRss(rs.getString(index++));
       prop.setStatus(rs.getString(index++));
       prop.setUseMovie(rs.getString(index++));       
       prop.setBanwd(rs.getString(index++));
       prop.setBanIp(rs.getString(index++));
       prop.setPageUrl(rs.getString(index++));
       prop.setUseSearch(rs.getString(index++));
       prop.setUseSms(rs.getString(index++));
       prop.setSmsText(rs.getString(index++));
       prop.setSmsNumber(rs.getString(index++));
       v.add(prop);
   }
   rs.close();
   prestmt.close();
  } catch (Exception e) {
   e.printStackTrace();
  } finally {
   try {  if (rs != null) rs.close(); } catch (Exception e) {}
   try {  if (prestmt != null) prestmt.close(); } catch (Exception e) {}
   try {  if (con != null) con.close(); } catch (Exception e) {}
  }
        return v;
    }
    /**
     * 
     * @param boardID
     * @return
     */
    public Property getProperty(String boardID) {
        Property prop = null;
        Connection con = null;
  ResultSet rs = null;
  PreparedStatement prestmt = null;
  
  
  
  String query = "Select * from NEOBOARDPROPERTY where BOARDID = ?";
  try {
   con = DBUtil.getConnection();
  
      prestmt = con.prepareStatement(query);
      prestmt.setString(1,boardID);
   rs = prestmt.executeQuery();
   int index = 1;
   if(rs.next()) {
    index = 1;
       prop = new Property();
       prop.setBoardID(rs.getString(index++));
       prop.setCategoryID(rs.getString(index++));
       prop.setCategoryName(rs.getString(index++));
       prop.setBoardName(rs.getString(index++));
       prop.setSkinName(rs.getString(index++));
       prop.setSkinID(rs.getString(index++));
       prop.setMaxSubjectLength(rs.getInt(index++));
       prop.setListPerPage(rs.getInt(index++));
       prop.setPagePerBlock(rs.getInt(index++));       
       prop.setTopIncludeFile(rs.getString(index++));
       prop.setTopIncludeText(rs.getString(index++));
       prop.setBottomIncludeFile(rs.getString(index++));
       prop.setBottomIncludeText(rs.getString(index++));
       prop.setUseRegistration(rs.getString(index++));
       prop.setUseReply(rs.getString(index++));
       prop.setUseEdit(rs.getString(index++));
       prop.setUseDelete(rs.getString(index++));
       prop.setUseComment(rs.getString(index++));
       prop.setUseImageView(rs.getString(index++));
       prop.setUseAuth(rs.getString(index++));
       prop.setAllowedExtension(rs.getString(index++));
       prop.setMaxUpload(rs.getInt(index++));
       prop.setMaxFileAttach(rs.getInt(index++));
       prop.setUseSecret(rs.getString(index++));
       prop.setUseNotice(rs.getString(index++));
       prop.setUseGroup(rs.getString(index++));
       prop.setUseNew(rs.getString(index++));
       prop.setNewLimit(rs.getInt(index++));
       prop.setUseCool(rs.getString(index++));
       prop.setCoolLimit(rs.getInt(index++));
       prop.setUseMailing(rs.getString(index++));
       prop.setMailTemplate(rs.getString(index++));
       prop.setMailFrom(rs.getString(index++));
       prop.setMailTo(rs.getString(index++));
       prop.setMailServer(rs.getString(index++));
       prop.setMailAccount(rs.getString(index++));
       prop.setMailPasswd(rs.getString(index++));
       prop.setUseDouble(rs.getString(index++));
       prop.setUseRss(rs.getString(index++));
       prop.setStatus(rs.getString(index++));
       prop.setUseMovie(rs.getString(index++));
       prop.setBoardType(rs.getString(index++));
       prop.setBanwd(rs.getString(index++));
       prop.setBanIp(rs.getString(index++));
       prop.setPageUrl(rs.getString(index++));
       prop.setUseSearch(rs.getString(index++));
       prop.setUseSms(rs.getString(index++));
       prop.setSmsText(rs.getString(index++));
       prop.setSmsNumber(rs.getString(index++));
   }
   rs.close();
   prestmt.close();
  } catch (Exception e) {
   e.printStackTrace();
  } finally {
   try {  if (rs != null) rs.close(); } catch (Exception e) {}
   try {  if (prestmt != null) prestmt.close(); } catch (Exception e) {}
   try {  if (con != null) con.close(); } catch (Exception e) {}
  }
        return prop;
    }
    
    public static Property getPropertyInfo(String boardID) {
        Property prop = null;
        Connection con = null;
  ResultSet rs = null;
  PreparedStatement prestmt = null;
  
  String query = "Select * from NEOBOARDPROPERTY where BOARDID = ?";
  try {
   con = DBUtil.getConnection();
  
      prestmt = con.prepareStatement(query);
      prestmt.setString(1,boardID);
   rs = prestmt.executeQuery();
   int index = 1;
   if(rs.next()) {
    index = 1;
       prop = new Property();
       prop.setBoardID(rs.getString(index++));
       prop.setCategoryID(rs.getString(index++));
       prop.setCategoryName(rs.getString(index++));
       prop.setBoardName(rs.getString(index++));
       prop.setSkinName(rs.getString(index++));
       prop.setSkinID(rs.getString(index++));
       prop.setMaxSubjectLength(rs.getInt(index++));
       prop.setListPerPage(rs.getInt(index++));
       prop.setPagePerBlock(rs.getInt(index++));       
       prop.setTopIncludeFile(rs.getString(index++));
       prop.setTopIncludeText(rs.getString(index++));
       prop.setBottomIncludeFile(rs.getString(index++));
       prop.setBottomIncludeText(rs.getString(index++));
       prop.setUseRegistration(rs.getString(index++));
       prop.setUseReply(rs.getString(index++));
       prop.setUseEdit(rs.getString(index++));
       prop.setUseDelete(rs.getString(index++));
       prop.setUseComment(rs.getString(index++));
       prop.setUseImageView(rs.getString(index++));
       prop.setUseAuth(rs.getString(index++));
       prop.setAllowedExtension(rs.getString(index++));
       prop.setMaxUpload(rs.getInt(index++));
       prop.setMaxFileAttach(rs.getInt(index++));
       prop.setUseSecret(rs.getString(index++));
       prop.setUseNotice(rs.getString(index++));
       prop.setUseGroup(rs.getString(index++));
       prop.setUseNew(rs.getString(index++));
       prop.setNewLimit(rs.getInt(index++));
       prop.setUseCool(rs.getString(index++));
       prop.setCoolLimit(rs.getInt(index++));
       prop.setUseMailing(rs.getString(index++));
       prop.setMailTemplate(rs.getString(index++));
       prop.setMailFrom(rs.getString(index++));
       prop.setMailTo(rs.getString(index++));
       prop.setMailServer(rs.getString(index++));
       prop.setMailAccount(rs.getString(index++));
       prop.setMailPasswd(rs.getString(index++));
       prop.setUseDouble(rs.getString(index++));
       prop.setUseRss(rs.getString(index++));
       prop.setStatus(rs.getString(index++));
       prop.setUseMovie(rs.getString(index++));
       prop.setBoardType(rs.getString(index++));
       prop.setBanwd(rs.getString(index++));
       prop.setBanIp(rs.getString(index++));
       prop.setPageUrl(rs.getString(index++));
       prop.setUseSearch(rs.getString(index++));
       prop.setUseSms(rs.getString(index++));
       prop.setSmsText(rs.getString(index++));
       prop.setSmsNumber(rs.getString(index++));
   }
   rs.close();
   prestmt.close();
  } catch (Exception e) {
   e.printStackTrace();
  } finally {
   try {  if (rs != null) rs.close(); } catch (Exception e) {}
   try {  if (prestmt != null) prestmt.close(); } catch (Exception e) {}
   try {  if (con != null) con.close(); } catch (Exception e) {}
  }
        return prop;
    }
    
    /**
     * 그룹리스트
     * @param boardID
     * @param page
     * @param pageSize
     * @return
     */
    public ArrayList<Group> getGroupList(String boardID, int page, int pageSize) {
     Connection con = null;
   ResultSet rs = null;
   PreparedStatement prestmt = null;
   ArrayList<Group> result = new ArrayList<Group>();
   StringBuffer query = new StringBuffer();
   String columns = "boardid, grp, grpname,regdatetime";
   String orderby = "regdatetime desc";
   String where = "boardID = ?";
   
   		query.append("select * from ( "); 
        query.append("select    ROW_NUMBER() OVER(  ORDER BY  boardid desc) AS PAGE_NO, " + columns);
        query.append(" from NEOBOARDGROUP");
        if(!where.equals("")) query.append(" where " + where + "");
        if(!orderby.trim().equals("")) query.append(" order by " +orderby+ " " );        
        //query.append("limit ?, ?"); 
        query.append(" ) a ");
        query.append(" WHERE  PAGE_NO > ?    AND PAGE_NO <= ? ");
  try {
   con = DBUtil.getConnection();
  
      prestmt = con.prepareStatement(query.toString());
      prestmt.setString(1, boardID);
      prestmt.setInt(2,(page-1) * pageSize);
      prestmt.setInt(3,page*pageSize );
   rs = prestmt.executeQuery();
   
   while(rs.next()) {
    Group grp = new Group();
    grp.setBoardID(rs.getString("boardID"));
    grp.setGrp(rs.getString("grp"));
    grp.setGrpName(rs.getString("grpName"));
    grp.setRegDateTime(rs.getString("regDateTime"));
    result.add(grp);
   }
   rs.close(); rs = null;
   prestmt.close(); prestmt = null;
  } catch (Exception e) {
   e.printStackTrace();
  } finally {
   try {  if (rs != null) rs.close(); } catch (Exception e) {}
   try {  if (prestmt != null) prestmt.close(); } catch (Exception e) {}
   try {  if (con != null) con.close(); } catch (Exception e) {}
  }
        return result;
    }
    /**
     * 그룹 목록
     * @return
     */
    public int getGroupListCount(String boardID) {
     Connection con = null;
   ResultSet rs = null;
   PreparedStatement prestmt = null;
   int result = 0;
   StringBuffer query = new StringBuffer();
   String where = " boardId = ?";
        query.append("select count(*) ");
        query.append(" from NEOBOARDGROUP");
        if(!where.equals("")) query.append(" where " + where + "");
  try {
   con = DBUtil.getConnection();
  
      prestmt = con.prepareStatement(query.toString());
      prestmt.setString(1, boardID);
   rs = prestmt.executeQuery();
   
   if(rs.next()) {
    result = rs.getInt(1);
   }
   rs.close(); rs = null;
   prestmt.close(); prestmt = null;
  } catch (Exception e) {
   e.printStackTrace();
  } finally {
   try {  if (rs != null) rs.close(); } catch (Exception e) {}
   try {  if (prestmt != null) prestmt.close(); } catch (Exception e) {}
   try {  if (con != null) con.close(); } catch (Exception e) {}
  }
        return result;
    }
    /**
     * 그룹 삭제
     * @param group
     * @return
     */
    public boolean deleteGroup(String boardID, String grp) {
     Connection con = null;
   PreparedStatement prestmt = null;
   
   boolean result = false;
   try {
   con = DBUtil.getConnection();
   String query = "delete from NEOBOARDGROUP where boardid = ? and grp = ?";
      prestmt = con.prepareStatement(query.toString());
      prestmt.setString(1, boardID);
      prestmt.setString(2, grp);
      
      prestmt.executeUpdate();
   prestmt.close(); prestmt = null;
   result = true;
  } catch (Exception e) {
   e.printStackTrace();
   this.setLastError(e);
  } finally {
   try {  if (prestmt != null) prestmt.close(); } catch (Exception e) {}
   try {  if (con != null) con.close(); } catch (Exception e) {}
  }
        return result;
    }
    /**
     * 그룹 수정
     * @param group
     * @return
     */
    public boolean updateGroup(Group group) {
     Connection con = null;
   PreparedStatement prestmt = null;
   
   boolean result = false;
   try {
   con = DBUtil.getConnection();
   String query = "update NEOBOARDGROUP set grpname = ? where boardid = ? and grp = ?";
      prestmt = con.prepareStatement(query.toString());
      prestmt.setString(1, group.getGrpName());
      prestmt.setString(2, group.getBoardID());
      prestmt.setString(3, group.getGrp());
      prestmt.executeUpdate();
   prestmt.close(); prestmt = null;
   result = true;
  } catch (Exception e) {
   e.printStackTrace();
   this.setLastError(e);
  } finally {
   try {  if (prestmt != null) prestmt.close(); } catch (Exception e) {}
   try {  if (con != null) con.close(); } catch (Exception e) {}
  }
        return result;
    }
    /**
     * 그룹 입력
     * @param group
     * @return
     */
    public boolean insertGroup(Group group) {
     Connection con = null;
   PreparedStatement prestmt = null;
   
   boolean result = false;
   try {
   con = DBUtil.getConnection();
   String query = "insert into NEOBOARDGROUP (boardid, grp, grpname, regdatetime) values (?, ?, ?, ?)";
      prestmt = con.prepareStatement(query.toString());
      prestmt.setString(1, group.getBoardID());
      prestmt.setString(2, group.getGrp());
      prestmt.setString(3, group.getGrpName());
      prestmt.setString(4, group.getRegDateTime());
   prestmt.executeUpdate();
   prestmt.close(); prestmt = null;
   result = true;
  } catch (Exception e) {
   e.printStackTrace();
   this.setLastError(e);
  } finally {
   try {  if (prestmt != null) prestmt.close(); } catch (Exception e) {}
   try {  if (con != null) con.close(); } catch (Exception e) {}
  }
        return result;
    }
    /** 
     * 그룹 조회 
     * @param boardID
     * @param grp
     * @return 
     */
    public Group getGroup(String boardID, String grp) {
     Connection con = null;
   ResultSet rs = null;
   PreparedStatement prestmt = null;
   Group result = null;
   
   
  try {
   con = DBUtil.getConnection();
   String query = "select * from NEOBOARDGROUP where boardId = ? and grp = ?";
      prestmt = con.prepareStatement(query);
      prestmt.setString(1, boardID);
      prestmt.setString(2, grp);
      rs = prestmt.executeQuery();
   
   while(rs.next()) {
    result = new Group();
    result.setBoardID(rs.getString("boardID"));
    result.setGrp(rs.getString("grp"));
    result.setGrpName(rs.getString("grpName"));
    result.setRegDateTime(rs.getString("regDateTime"));
   }
   rs.close(); rs = null;
   prestmt.close(); prestmt = null;
  } catch (Exception e) {
   e.printStackTrace();
  } finally {
   try {  if (rs != null) rs.close(); } catch (Exception e) {}
   try {  if (prestmt != null) prestmt.close(); } catch (Exception e) {}
   try {  if (con != null) con.close(); } catch (Exception e) {}
  }
        return result;
    }
    
    /**
     * 그룹 selectBox
     * @param comGubun
     * @return
     */
    public static String getGroupSelect(String boardID, String grp) {
     StringBuffer strSel = new StringBuffer();
        
        Connection con = null;
  PreparedStatement prestmt = null;
  ResultSet rs = null;
        try{
         con = DBUtil.getConnection();
         
         String sql = "select * from NEOBOARDGROUP where boardId = ? order by grp asc";
   prestmt = con.prepareStatement(sql);
   prestmt.setString(1,boardID);
   rs = prestmt.executeQuery();
         
            while (rs.next()){            
             strSel.append("<option value='"+rs.getString("grp") +"' "+((rs.getString("grp").equals(grp))? "selected":"")+">"+rs.getString("grpName") +"</option>\n");
            }          
            
            if(rs != null) rs.close(); rs = null;
   prestmt.close(); prestmt = null;
        }catch(Exception e){
         e.printStackTrace();
        } finally {
         try {  if (rs != null) rs.close(); } catch (Exception e) {}
   try {  if (prestmt != null) prestmt.close(); } catch (Exception e) {}
   try {  if (con != null) con.close(); } catch (Exception e) {}
        }
        return strSel.toString();     
    }
    
    /**
     * 게시판관리 설정 리스트(카테고리관리, 스킨관리)
     * @param comGubun
     * @return
     */
    public static String getCommons(String comGubun, String comID) {
     StringBuffer strSel = new StringBuffer();
        
        Connection con = null;
  PreparedStatement prestmt = null;
  ResultSet rs = null;
        try{
         con = DBUtil.getConnection();
         
         String sql = "select comName, comID from NEOBOARDCOMMON where comGubun = ? order by no asc";
   prestmt = con.prepareStatement(sql);
   prestmt.setString(1,comGubun);
   rs = prestmt.executeQuery();
         
            while (rs.next()){            
             strSel.append("<option value='"+rs.getString("comID") +"'"+((rs.getString("comID").equals(comID))? "selected":"")+">"+rs.getString("comName") +"</option>\n");
            }          
            
            if(rs != null) rs.close(); rs = null;
   prestmt.close(); prestmt = null;
        }catch(Exception e){
         e.printStackTrace();
        } finally {
         try {  if (rs != null) rs.close(); } catch (Exception e) {}
   try {  if (prestmt != null) prestmt.close(); } catch (Exception e) {}
   try {  if (con != null) con.close(); } catch (Exception e) {}
        }
        return strSel.toString();     
    }
    
    /**
     * 게시판관리 설정 리스트(카테고리관리, 스킨관리)
     * @param comGubun
     * @return
     */
    public ArrayList<Common> getCommonList(String comGubun) {
     Connection con = null;
  ResultSet rs = null;
  PreparedStatement prestmt = null;
  ArrayList<Common> result = new ArrayList<Common>();
  
  try {
   con = DBUtil.getConnection();  
   
   String sql = "select no, comGubun, comName, comID, regDateTime from NEOBOARDCOMMON where comGubun = ? order by no asc";
   prestmt = con.prepareStatement(sql);
   prestmt.setString(1,comGubun);
   rs = prestmt.executeQuery();
   while (rs.next()) {
    Common comm = new Common();
    comm.setNo(rs.getInt("no"));
    comm.setComGubun(rs.getString("comGubun"));
    comm.setComName(rs.getString("comName"));
    comm.setComID(rs.getString("comID"));
    comm.setRegDateTime(rs.getString("regDateTime"));
    result.add(comm);
   }
   if(rs != null) rs.close(); rs = null;
   prestmt.close(); prestmt = null;
   
  } catch (Exception e) {
      e.printStackTrace();
  } finally {
   try {  if (rs != null) rs.close(); } catch (Exception e) {}
   try {  if (prestmt != null) prestmt.close(); } catch (Exception e) {}
   try {  if (con != null) con.close(); } catch (Exception e) {}
  }
  return result;
    }
    
    /**
     * 게시판관리 설정 삭제(카테고리관리, 스킨관리)
     * @param no
     * @return
     */
    public boolean deleteCommon(int no) {
     Connection con = null;
  PreparedStatement prestmt = null;
  boolean result = false;
  
  try {
   con = DBUtil.getConnection();      
   
   String sql = "delete from NEOBOARDCOMMON where no=?";
       
   prestmt = con.prepareStatement(sql);    
   prestmt.setInt(1, no);
   
   prestmt.executeUpdate(); 
   prestmt.close(); prestmt = null;
   result = true;
  } catch (Exception e) {
      e.printStackTrace();
      this.setLastError(e);
  } finally {
   try {  if (prestmt != null) prestmt.close(); } catch (Exception e) {}
   try {  if (con != null) con.close(); } catch (Exception e) {}
  }
  return result;
    }
    /**
     * 게시판관리 설정 수정(카테고리관리, 스킨관리)
     * @param comm
     * @return
     */
    public boolean updateCommon(Common comm) {
     Connection con = null;
  PreparedStatement prestmt = null;
  boolean result = false;
  
  try {
   con = DBUtil.getConnection();      
   
   String sql = "update NEOBOARDCOMMON set comName=?, comID=? where no=?";
   
   int index = 1;     
   prestmt = con.prepareStatement(sql);    
   prestmt.setString(index++,comm.getComName());
   prestmt.setString(index++,comm.getComID());  
   prestmt.setInt(index++,comm.getNo());
   
   prestmt.executeUpdate(); 
   prestmt.close(); prestmt = null;
   result = true;
  } catch (Exception e) {
      e.printStackTrace();
      this.setLastError(e);
  } finally {
   try {  if (prestmt != null) prestmt.close(); } catch (Exception e) {}
   try {  if (con != null) con.close(); } catch (Exception e) {}
  }
  return result;
    }
    /**
     * 게시판관리 설정 등록(카테고리관리, 스킨관리)
     * @param comm
     * @return
     */
    public boolean insertCommon(Common comm) {
     Connection con = null;
  Statement stmt = null;
  ResultSet rs = null;
  PreparedStatement prestmt = null;
  boolean result = false;
  int no = 0;
  
  try {
   con = DBUtil.getConnection();   
   stmt = con.createStatement();
   
   String sql = "select max(no) from NEOBOARDCOMMON";
   rs = stmt.executeQuery(sql);
   if (rs.next()) {
    no = rs.getInt(1) + 1;
   } else {
    no = 1;
   }
   if(rs != null) rs.close(); rs = null;
   stmt.close(); stmt = null;
   
   sql="insert into NEOBOARDCOMMON "
       + " (no, comGubun, comName, comID, regDateTime) "
       + " values (?, ?, ?, ?, ?)";    
   
   int index = 1;     
   prestmt = con.prepareStatement(sql.toString());
   prestmt.setInt(index++,no);
   prestmt.setString(index++,comm.getComGubun()); 
   prestmt.setString(index++,comm.getComName());
   prestmt.setString(index++,comm.getComID());
   prestmt.setString(index++,comm.getRegDateTime());
   
   prestmt.executeUpdate(); 
   prestmt.close(); prestmt = null;
   result = true;
  } catch (Exception e) {
      e.printStackTrace();
      this.setLastError(e);
  } finally {
   try {  if (rs != null) rs.close(); } catch (Exception e) {}
   try {  if (prestmt != null) prestmt.close(); } catch (Exception e) {}
   try {  if (stmt != null) stmt.close(); } catch (Exception e) {}
   try {  if (con != null) con.close(); } catch (Exception e) {}
  }
  return result;
    }    
    
    public static String getTopComID(String comGubun) {
     Connection con = null;
   ResultSet rs = null;
   PreparedStatement prestmt = null;
   String comID = "";
   StringBuffer query = new StringBuffer();
   String columns = "comID";
   String orderby = "no asc";
   String where = "comGubun = ?";
        query.append("select " + columns);
        query.append(" from NEOBOARDCOMMON");
        query.append(" where 1=1 AND ROWNUM =1 ");
        if(!where.equals("")) query.append(" AND " + where + "");
        if(!orderby.trim().equals("")) query.append(" order by " +orderby+ " " );        
        //query.append("limit 1");
  try {
   con = DBUtil.getConnection();
  
      prestmt = con.prepareStatement(query.toString());
      prestmt.setString(1, comGubun);
      rs = prestmt.executeQuery();
   
   if(rs.next()) {
    comID = rs.getString("comID");
   }
   rs.close(); rs = null;
   prestmt.close(); prestmt = null;
  } catch (Exception e) {
   e.printStackTrace();
  } finally {
   try {  if (rs != null) rs.close(); } catch (Exception e) {}
   try {  if (prestmt != null) prestmt.close(); } catch (Exception e) {}
   try {  if (con != null) con.close(); } catch (Exception e) {}
  }
        return comID;
    }
    
    // 통합게시판 셀렉트
 public Vector selectboardName(String boardID, String boardType) {
  Connection con = null;
  Statement stmt = null;
  String strSQL = "";
  ResultSet rs = null;
  Vector<Property> vNeoboardPropery = new Vector<Property>();
  
  try {
         con = DBUtil.getConnection();
   stmt = con.createStatement();
   
   strSQL = "select boardid, boardname from NEOBOARDPROPERTY where boardID != '"+boardID+"' and boardType='"+boardType+"' order by boardname asc ";     
   rs = stmt.executeQuery(strSQL);
   
   while(rs.next()) {
    Property prop = new Property();
    
    prop.setBoardID(rs.getString("boardid"));
    prop.setBoardName(rs.getString("boardname"));
    
    vNeoboardPropery.addElement(prop);
   }
  }
  catch (Exception e) {
   e.printStackTrace();
  }
  finally {
   try {  if (rs != null) rs.close(); } catch (Exception e) {}
   try {  if (stmt != null) stmt.close(); } catch (Exception e) {}
   try {  if (con != null) con.close(); } catch (Exception e) {}
  }

  return vNeoboardPropery;
 } 
 
 /**
  * 금지IP
  * @param banIp
  * @param ip
  * @return
  */
 public static boolean getBanIp(String banIp, String ip) {
  String[] banIp_ar;
  boolean access = false;
  
  if (banIp != null && !banIp.equals("")){
   banIp_ar = banIp.split(",");
   for (int i = 0; i < banIp_ar.length; i++) {
    if (banIp_ar[i].trim().equals(ip)) {
     access = true;
     break;
    }
   }
  }
  
  return access;
 } 
 
 public static String getBoardName(String boardID) {
        Property prop = null;
        Connection con = null;
  ResultSet rs = null;
  PreparedStatement prestmt = null;
  String boardname = "";
  
  String query = "Select boardname from NEOBOARDPROPERTY where BOARDID = ?";
  try {
   con = DBUtil.getConnection();
  
      prestmt = con.prepareStatement(query);
      prestmt.setString(1,boardID);
   rs = prestmt.executeQuery();
   int index = 1;
   if(rs.next()) {
    boardname = rs.getString("boardname");
   }
   rs.close();
   prestmt.close();
  } catch (Exception e) {
   e.printStackTrace();
  } finally {
   try {  if (rs != null) rs.close(); } catch (Exception e) {}
   try {  if (prestmt != null) prestmt.close(); } catch (Exception e) {}
   try {  if (con != null) con.close(); } catch (Exception e) {}
  }
        return boardname;
    }
 
 public static String getBoardPageUrl(String boardID) {
        Property prop = null;
        Connection con = null;
  ResultSet rs = null;
  PreparedStatement prestmt = null;
  String pageurl = "";
  
  String query = "Select pageurl from NEOBOARDPROPERTY where BOARDID = ?";
  try {
   con = DBUtil.getConnection();
  
      prestmt = con.prepareStatement(query);
      prestmt.setString(1,boardID);
   rs = prestmt.executeQuery();
   int index = 1;
   if(rs.next()) {
    pageurl = rs.getString("pageurl");
   }
   rs.close();
   prestmt.close();
  } catch (Exception e) {
   e.printStackTrace();
  } finally {
   try {  if (rs != null) rs.close(); } catch (Exception e) {}
   try {  if (prestmt != null) prestmt.close(); } catch (Exception e) {}
   try {  if (con != null) con.close(); } catch (Exception e) {}
  }
        return pageurl;
    }
 
 /**
  * 그룹명
  * @param grp
  * @return
  */
 public static String getGrpName(String boardID, String grp) {
        Property prop = null;
        Connection con = null;
  ResultSet rs = null;
  PreparedStatement prestmt = null;
  String boardname = "";
  
  String query = "Select grpname from NEOBOARDGROUP where BOARDID = ? and grp = ? ";
  try {
   con = DBUtil.getConnection();
  
      prestmt = con.prepareStatement(query);
      prestmt.setString(1,boardID);
      prestmt.setString(2,grp);
   rs = prestmt.executeQuery();
   if(rs.next()) {
    boardname = rs.getString("grpname");
   }
   rs.close();
   prestmt.close();
  } catch (Exception e) {
   e.printStackTrace();
  } finally {
   try {  if (rs != null) rs.close(); } catch (Exception e) {}
   try {  if (prestmt != null) prestmt.close(); } catch (Exception e) {}
   try {  if (con != null) con.close(); } catch (Exception e) {}
  }
        return boardname;
    }
}

