package admin.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Admin implements Serializable{

	private static final long serivalVersionUID = 3222L;
	
	//기본생성자 
	public Admin() {}
	
	private String aNo;	//관리자번호
	private String aId;	//계정아이디
	private String aName;	//관리자 이름
	private String aPw;	//관리자 패스워드
	private java.sql.Date joinDate;	//가입일

	//매개변수 있는 생성자
	public Admin(String aNo, String aId, String aName, String aPw, Date joinDate) {
		super();
		this.aNo = aNo;
		this.aId = aId;
		this.aName = aName;
		this.aPw = aPw;
		this.joinDate = joinDate;
	}
	
	//getters and setters
	public String getaNo() {
		return aNo;
	}
	public void setaNo(String aNo) {
		this.aNo = aNo;
	}
	public String getaId() {
		return aId;
	}
	public void setaId(String aId) {
		this.aId = aId;
	}
	public String getaName() {
		return aName;
	}
	public void setaName(String aName) {
		this.aName = aName;
	}
	public String getaPw() {
		return aPw;
	}
	public void setaPw(String aPw) {
		this.aPw = aPw;
	}
	public java.sql.Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(java.sql.Date joinDate) {
		this.joinDate = joinDate;
	}
	
	//toString()
	@Override
	public String toString() {
		return "Admin [aNo=" + aNo + ", aId=" + aId + ", aName=" + aName + ", aPw=" + aPw + ", joinDate=" + joinDate
				+ "]";
	}
	
}
