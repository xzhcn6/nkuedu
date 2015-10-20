package nku.xkxt.model.base;

import java.io.Serializable;

public abstract class BaseAdmin implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String id;
	
	private String loginName;
	
	private String password;
	
	private String systemOpen;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSystemOpen() {
		return systemOpen;
	}

	public void setSystemOpen(String systemOpen) {
		this.systemOpen = systemOpen;
	}
	
}
