package project.model.vo;

import java.sql.Date;

public class Project implements java.io.Serializable {

	private static final long serialVersionUID = 3214L;

	private String p_no;
	private String u_no;
	private String p_title;
	private String p_category;
	private String p_story;
	private String p_img;
	private String p_info;
	private int p_nprice;
	private int p_tprice;
	private java.sql.Date p_sdate;
	private java.sql.Date p_edate;
	private String p_secondary;
	private java.sql.Date p_ddate;
	private int p_count;
	private String p_permission;
	private java.sql.Date p_pdate;
	private String p_return;
	private int p_rdate;
	private String u_name;
	private int time;
	
	public Project() {
		super();
	}

	public Project(String p_no, String u_no, String p_title, String p_category, String p_story,String p_img, String p_info,
			int p_nprice, int p_tprice, Date p_sdate, Date p_edate, String p_secondary, Date p_ddate, int p_count,
			String p_permission, Date p_pdate, String p_return, int p_rdate, String u_name, int time) {
		super();
		this.p_no = p_no;
		this.u_no = u_no;
		this.p_title = p_title;
		this.p_category = p_category;
		this.p_story = p_story;
		this.p_img = p_img;
		this.p_info = p_info;
		this.p_nprice = p_nprice;
		this.p_tprice = p_tprice;
		this.p_sdate = p_sdate;
		this.p_edate = p_edate;
		this.p_secondary = p_secondary;
		this.p_ddate = p_ddate;
		this.p_count = p_count;
		this.p_permission = p_permission;
		this.p_pdate = p_pdate;
		this.p_return = p_return;
		this.p_rdate = p_rdate;
		this.u_name = u_name;
		this.time = time;
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

	public String getP_title() {
		return p_title;
	}

	public void setP_title(String p_title) {
		this.p_title = p_title;
	}

	public String getP_category() {
		return p_category;
	}

	public void setP_category(String p_category) {
		this.p_category = p_category;
	}

	public String getP_story() {
		return p_story;
	}

	public void setP_story(String p_story) {
		this.p_story = p_story;
	}
	
	public String getP_img() {
		return p_img;
	}

	public void setP_img(String p_img) {
		this.p_img = p_img;
	}

	public String getP_info() {
		return p_info;
	}

	public void setP_info(String p_info) {
		this.p_info = p_info;
	}

	public int getP_nprice() {
		return p_nprice;
	}

	public void setP_nprice(int p_nprice) {
		this.p_nprice = p_nprice;
	}

	public int getP_tprice() {
		return p_tprice;
	}

	public void setP_tprice(int p_tprice) {
		this.p_tprice = p_tprice;
	}

	public java.sql.Date getP_sdate() {
		return p_sdate;
	}

	public void setP_sdate(java.sql.Date p_sdate) {
		this.p_sdate = p_sdate;
	}

	public java.sql.Date getP_edate() {
		return p_edate;
	}

	public void setP_edate(java.sql.Date p_edate) {
		this.p_edate = p_edate;
	}

	public String getP_secondary() {
		return p_secondary;
	}

	public void setP_secondary(String p_secondary) {
		this.p_secondary = p_secondary;
	}

	public java.sql.Date getP_ddate() {
		return p_ddate;
	}

	public void setP_ddate(java.sql.Date p_ddate) {
		this.p_ddate = p_ddate;
	}

	public int getP_count() {
		return p_count;
	}

	public void setP_count(int p_count) {
		this.p_count = p_count;
	}

	public String getP_permission() {
		return p_permission;
	}

	public void setP_permission(String p_permission) {
		this.p_permission = p_permission;
	}

	public java.sql.Date getP_pdate() {
		return p_pdate;
	}

	public void setP_pdate(java.sql.Date p_pdate) {
		this.p_pdate = p_pdate;
	}

	public String getP_return() {
		return p_return;
	}

	public void setP_return(String p_return) {
		this.p_return = p_return;
	}
	
	public int getP_rdate() {
		return p_rdate;
	}

	public void setP_rdate(int p_rdate) {
		this.p_rdate = p_rdate;
	}
	
	 public String getU_name() {
	      return u_name;
	   }

	   public void setU_name(String u_name) {
	      this.u_name = u_name;
	   }
	     

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "Project [p_no=" + p_no + ", u_no=" + u_no + ", p_title=" + p_title + ", p_category=" + p_category
				+ ", p_story=" + p_story + ", p_img=" + p_img + ", p_info=" + p_info + ", p_nprice=" + p_nprice
				+ ", p_tprice=" + p_tprice + ", p_sdate=" + p_sdate + ", p_edate=" + p_edate + ", p_secondary="
				+ p_secondary + ", p_ddate=" + p_ddate + ", p_count=" + p_count + ", p_permission=" + p_permission
				+ ", p_pdate=" + p_pdate + ", p_return=" + p_return + ", p_rdate=" + p_rdate + ", u_name=" + u_name
				+ ", time=" + time + "]";
	}

	

	
}
