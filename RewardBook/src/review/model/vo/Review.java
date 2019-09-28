package review.model.vo;

import java.sql.Date;

public class Review  implements java.io.Serializable{

	public Review() {}
	
	private String  rv_no;
	private String  p_no;
	private String  u_no;
	private String  rv_title;
	private String  rv_text;
	private Date  rv_date;
	private int  rv_grade;
	private String  rv_img;
	private String u_name;
	private int rv_after;
	private String u_profile;
	
	public Review(String rv_no, String p_no, String u_no, String rv_title, String rv_text, Date rv_date, int rv_grade,
			String rv_img, String u_name) {
		super();
		this.rv_no = rv_no;
		this.p_no = p_no;
		this.u_no = u_no;
		this.rv_title = rv_title;
		this.rv_text = rv_text;
		this.rv_date = rv_date;
		this.rv_grade = rv_grade;
		this.rv_img = rv_img;
		this.u_name = u_name;
	}

	
	public String getU_profile() {
		return u_profile;
	}
	
	public void setU_profile(String u_profile) {
		this.u_profile = u_profile;
	}
	public String getRv_no() {
		return rv_no;
	}
	

	public void setRv_no(String rv_no) {
		this.rv_no = rv_no;
	}
	
	public int getRv_after() {
		return rv_after;
	}
	
	public void setRv_after(int rv_after) {
		this.rv_after = rv_after;
	}

	public String getU_name() {
		return u_name;
	}
	
	public void setU_name(String u_name) {
		this.u_name = u_name;
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

	public String getRv_title() {
		return rv_title;
	}

	public void setRv_title(String rv_title) {
		this.rv_title = rv_title;
	}

	public String getRv_text() {
		return rv_text;
	}

	public void setRv_text(String rv_text) {
		this.rv_text = rv_text;
	}

	public Date getRv_date() {
		return rv_date;
	}

	public void setRv_date(Date rv_date) {
		this.rv_date = rv_date;
	}

	public int getRv_grade() {
		return rv_grade;
	}

	public void setRv_grade(int rv_grade) {
		this.rv_grade = rv_grade;
	}

	public String getRv_img() {
		return rv_img;
	}

	public void setRv_img(String rv_img) {
		this.rv_img = rv_img;
	}

	@Override
	public String toString() {
		return "Review [rv_no=" + rv_no + ",u_name" + u_name + ", p_no=" + p_no + ", u_no=" + u_no + ", rv_title=" + rv_title + ", rv_text="
				+ rv_text + ", rv_date=" + rv_date + ", rv_grade=" + rv_grade + ", rv_img=" + rv_img + "]";
	}
	
	
	
	
	
}
