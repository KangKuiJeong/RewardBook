package follow.model.vo;

import java.sql.Date;

public class Follow implements java.io.Serializable{
	
	public Follow() {}
	
	private String u_no_f;
	private String u_no_fr;
	private Date f_date;
	
	
	public Follow(String u_no_f, String u_no_fr, Date f_date) {
		super();
		this.u_no_f = u_no_f;
		this.u_no_fr = u_no_fr;
		this.f_date = f_date;
	}


	public String getU_no_f() {
		return u_no_f;
	}


	public void setU_no_f(String u_no_f) {
		this.u_no_f = u_no_f;
	}


	public String getU_no_fr() {
		return u_no_fr;
	}


	public void setU_no_fr(String u_no_fr) {
		this.u_no_fr = u_no_fr;
	}


	public Date getF_date() {
		return f_date;
	}


	public void setF_date(Date f_date) {
		this.f_date = f_date;
	}


	@Override
	public String toString() {
		return "Follow [u_no_f=" + u_no_f + ", u_no_fr=" + u_no_fr + ", f_date=" + f_date + "]";
	}
	
	
	

}
