package com.neoboard.data;

import java.io.Serializable;

/**
 * @author <a href="mailto:seagull@mcat.co.kr">Seagull Lee</a> MCAT Lab.
 * @version 1.0
 */
public class Authority implements Serializable {
     
    /** 게시판 아이디 */
    private String boardID;
    
    /** 목록 레벨 */
    private int levelList;
    /** 목록 허용 아이디 */
    private String listAllowedUser;
    /** 읽기 레벨 */
    private int levelView;
    /** 읽기 허용 아이디 */
    private String viewAllowedUser;
    /** 등록 레벨 */
    private int levelRegistration;
    /** 등록 허용 아이디 */
    private String registrationAllowedUser;
    /** 답변 레벨 */
    private int levelReply;
    /** 답변 허용 아이디 */
    private String replyAllowedUser;
    /** 수정 레벨 */
    private int levelEdit;
    /** 수정 허용 아이디 */
    private String editAllowedUser;
    /** 삭제 레벨 */
    private int levelDelete;
    /** 삭제 허용 아이디  */
    private String deleteAllowedUser;
    /** 덧글 허용 레벨 */
    private int levelCommentWrite;
    /** 덧글 허용 아이디 */
    private String commentWriteAllowedUser;
    /** 덧글 삭제 레벨 */
    private int levelCommentDelete;
    /** 덧글 삭제 허용 아이디 */
    private String commentDeleteAllowedUser;
    
    /** 게시판 관리 마스터 */
    private String master;
    /** 공지글 가능 레벨 */
    private int levelNotice;
    /** 공지글 가능 유저 */
    public String noticeAllowedUser;
    /** 다운로드 가능 레벨 */
    private int levelDown;
    /** 다운로드 가능 유저 */
    public String downAllowedUser;    
    
    public Authority() {
        this.boardID = "";
        this.levelList = 1;
        this.listAllowedUser = "";
        this.levelView = 1;
        this.viewAllowedUser = "";
        this.levelRegistration = 1;
        this.registrationAllowedUser = "";
        this.levelReply = 1;
        this.replyAllowedUser = "";
        this.levelEdit = 1;
        this.editAllowedUser = "";
        this.levelDelete = 1;
        this.deleteAllowedUser = "";
        this.levelCommentWrite = 1;
        this.commentWriteAllowedUser = "";
        this.levelCommentDelete = 1;
        this.commentDeleteAllowedUser = "";
        this.master = "";
        this.levelNotice = 1;
        this.noticeAllowedUser = "";
        this.levelDown = 1;
        this.downAllowedUser = "";
    }
    
    public int getLevelNotice() {return this.levelNotice; }
    public void setLevelNotice(int value) { this.levelNotice = value; }
    
    public String getNoticeAllowedUser(){ return this.noticeAllowedUser; }
    public void setNoticeAllowedUser(String value) { if(value == null) value = ""; this.noticeAllowedUser = value; }
    
    public int getLevelDown() {return this.levelDown; }
    public void setLevelDown(int value) { this.levelDown = value; }
    
    public String getDownAllowedUser(){ return this.downAllowedUser; }
    public void setDownAllowedUser(String value) { if(value == null) value = ""; this.downAllowedUser = value; }
    
    public String getBoardID() {
        return boardID;
    }
    public void setBoardID(String boardID) {
        if(boardID == null) boardID = ""; 
        this.boardID = boardID.trim();
    }
    public String getCommentDeleteAllowedUser() {
        return commentDeleteAllowedUser;
    }
    public void setCommentDeleteAllowedUser(String commentDeleteAllowedUser) {
        if(commentDeleteAllowedUser == null) commentDeleteAllowedUser = ""; 
        this.commentDeleteAllowedUser = commentDeleteAllowedUser;
    }
    public String getCommentWriteAllowedUser() {
        return commentWriteAllowedUser;
    }
    public void setCommentWriteAllowedUser(String commentWriteAllowedUser) {
        if(commentWriteAllowedUser == null) commentWriteAllowedUser = "";
        this.commentWriteAllowedUser = commentWriteAllowedUser;
    }
    public String getDeleteAllowedUser() {
        return deleteAllowedUser;
    }
    public void setDeleteAllowedUser(String deleteAllowedUser) {
        if(deleteAllowedUser == null) deleteAllowedUser = "";
        this.deleteAllowedUser = deleteAllowedUser;
    }
    public String getEditAllowedUser() {
        return editAllowedUser;
    }
    public void setEditAllowedUser(String editAllowedUser) {
        if(editAllowedUser == null) editAllowedUser = "";
        this.editAllowedUser = editAllowedUser;
    }
    public int getLevelCommentDelete() {
        return levelCommentDelete;
    }
    public void setLevelCommentDelete(int levelCommentDelete) {
        this.levelCommentDelete = levelCommentDelete;
    }
    public int getLevelCommentWrite() {
        return levelCommentWrite;
    }
    public void setLevelCommentWrite(int levelCommentWrite) {
        this.levelCommentWrite = levelCommentWrite;
    }
    public int getLevelDelete() {
        return levelDelete;
    }
    public void setLevelDelete(int levelDelete) {
        this.levelDelete = levelDelete;
    }
    public int getLevelEdit() {
        return levelEdit;
    }
    public void setLevelEdit(int levelEdit) {
        this.levelEdit = levelEdit;
    }
    public int getLevelList() {
        return levelList;
    }
    public void setLevelList(int levelList) {
        this.levelList = levelList;
    }
    public int getLevelRegistration() {
        return levelRegistration;
    }
    public void setLevelRegistration(int levelRegistration) {
        this.levelRegistration = levelRegistration;
    }
    public int getLevelReply() {
        return levelReply;
    }
    public void setLevelReply(int levelReply) {
        this.levelReply = levelReply;
    }
    public int getLevelView() {
        return levelView;
    }
    public void setLevelView(int levelView) {
        this.levelView = levelView;
    }
    public String getListAllowedUser() {
        return listAllowedUser;
    }
    public void setListAllowedUser(String listAllowedUser) {
        if(listAllowedUser == null) listAllowedUser = "";
        this.listAllowedUser = listAllowedUser;
    }
    public String getMaster() {
        return master;
    }
    public void setMaster(String master) {
        if(master == null) master = "";
        this.master = master;
    }
    public String getRegistrationAllowedUser() {
        return registrationAllowedUser;
    }
    public void setRegistrationAllowedUser(String registrationAllowedUser) {
        if(registrationAllowedUser == null) registrationAllowedUser = "";
        this.registrationAllowedUser = registrationAllowedUser;
    }
    public String getReplyAllowedUser() {
        return replyAllowedUser;
    }
    public void setReplyAllowedUser(String replyAllowedUser) {
        
        this.replyAllowedUser = replyAllowedUser;
    }
    public String getViewAllowedUser() {
        return viewAllowedUser;
    }
    public void setViewAllowedUser(String viewAllowedUser) {
        this.viewAllowedUser = viewAllowedUser;
    }
       
}
