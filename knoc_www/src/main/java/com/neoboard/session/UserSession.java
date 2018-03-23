package com.neoboard.session;

public interface UserSession {
	/** 사용자 아이디 */
    public String getUserID();
    /** 사용자 레벨 */
    public String getUserLevel();
    /** 사용자 이름 */  
    public String getUserName();
    /** 사용자 이메일 */
    public String getUserEmail();
    
    public String getJumin();   
    /** G-Pin 인증 가상 키코드 **/
    public String getUserVirtualno();
}
