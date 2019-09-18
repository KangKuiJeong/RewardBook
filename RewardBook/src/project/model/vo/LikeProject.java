package project.model.vo;

import java.sql.Date;

public class LikeProject implements java.io.Serializable {

	private static final long serialVersionUID = 3010L;

	private String p_no;
	private String u_no;
	private String pl_post;
	private java.sql.Date pl_date;
	
	public LikeProject() {
		super();
	}

	public LikeProject(String p_no, String u_no, String pl_post, Date pl_date) {
		super();
		this.p_no = p_no;
		this.u_no = u_no;
		this.pl_post = pl_post;
		this.pl_date = pl_date;
	}

	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
	}

	public String getU_no() {
		return u_no;
	}

	public void setU_no(String u_no) {
		this.u_no = u_no;
	}

	public String getPl_post() {
		return pl_post;
	}

	public void setPl_post(String pl_post) {
		this.pl_post = pl_post;
	}

	public java.sql.Date getPl_date() {
		return pl_date;
	}

	public void setPl_date(java.sql.Date pl_date) {
		this.pl_date = pl_date;
	}

	@Override
	public String toString() {
		return "LikeProject [p_no=" + p_no + ", u_no=" + u_no + ", pl_post=" + pl_post + ", pl_date=" + pl_date + "]";
	}
	
	
	
}
