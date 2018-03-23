package com.neoboard.session;

public class GuestSession implements UserSession, java.io.Serializable {
	String userLevel;
	String userID;
	String virtualno;
	/* (non-Javadoc)
	 * @see kr.go.wbgn.jsp.UserSession#getJumin()
	 */
	public String getJumin() {
		// TODO Auto-generated method stub
		return null;
	}
	/* (non-Javadoc)
	 * @see kr.go.wbgn.jsp.UserSession#getUserEmail()
	 */
	public String getUserEmail() {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see kr.go.wbgn.jsp.UserSession#getUserID()
	 */
	public String getUserID() {
		// TODO Auto-generated method stub
		return this.userID;
	}

	/* (non-Javadoc)
	 * @see kr.go.wbgn.jsp.UserSession#getUserLevel()
	 */
	public String getUserLevel() {
		// TODO Auto-generated method stub
		return this.userLevel;
	}

	/* (non-Javadoc)
	 * @see kr.go.wbgn.jsp.UserSession#getUserName()
	 */
	public String getUserName() {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see kr.go.wbgn.jsp.UserSession#getUserLevel()
	 */
	public String getUserVirtualno() {
		// TODO Auto-generated method stub
		return this.virtualno;
	}
	
	/**
	 * Set user level
	 * @param userLevel
	 */
	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}
	
	public void setUserID(String userID){
		this.userID = userID;
	}
}
