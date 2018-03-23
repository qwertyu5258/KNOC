package kr.co.knoc.mgr;

import java.util.ArrayList;


import com.neoboard.session.UserSession;


public class MgrSession extends MgrDO implements UserSession {
	@SuppressWarnings("unchecked")
	public MgrSession(MgrDO mgr){
		super();
		this.setId(mgr.getId());
		this.setPasswd(mgr.getPasswd());
		this.setLevel(mgr.getLevel());
		this.setName(mgr.getName());
		this.setPhoneNumber(mgr.getPhoneNumber());
		this.setMobileNumber(mgr.getMobileNumber());
		this.setEmail(mgr.getEmail());
		this.setJoinDateTime(mgr.getJoinDateTime());
		this.setLastLoginDateTime(mgr.getLastLoginDateTime());
		this.setIp(mgr.getIp());		
		this.setVirtualno(mgr.getVirtualno());
	}
	public MgrSession() {
		super();
	}
	/* (non-Javadoc)
	 * @see kr.go.wbgn.jsp.UserSession#getUserEmail()
	 */
	public String getUserEmail() {
		// TODO Auto-generated method stub
		return getEmail();
	}

	/* (non-Javadoc)
	 * @see kr.go.wbgn.jsp.UserSession#getUserID()
	 */
	public String getUserID() {
		// TODO Auto-generated method stub
		return getId();
	}

	/* (non-Javadoc)
	 * @see kr.go.wbgn.jsp.UserSession#getUserLevel()
	 */
	public String getUserLevel() {
		// TODO Auto-generated method stub
		return getLevel();
	}

	/* (non-Javadoc)
	 * @see kr.go.wbgn.jsp.UserSession#getUserName()
	 */
	public String getUserName() {
		// TODO Auto-generated method stub
		return getName();
	}

	/* (non-Javadoc)
	 * @see kr.go.wbgn.jsp.UserSession#getJumin()
	 */
	public String getJumin() {
		// TODO Auto-generated method stub
		return "";
	}
	
	public String getUserVirtualno() {
		// TODO Auto-generated method stub
		return getVirtualno();
	}
}
