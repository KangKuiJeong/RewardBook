package inquiry.model.vo;

import java.sql.Date;

public class Inquiry implements java.io.Serializable{

	private static final long serialVersionUID = 3008L;

	public Inquiry() {}
	
	private String iq_no;
	private String u_no;
	private String iq_title;
	private String iq_text;
	private String iq_category;
	private String iq_dcategory;
	private Date iq_date;
	private String iq_oc;
	private String a_no;
	private String iq_reply;
	private Date iq_rdate;
	private String u_name;
	private String a_name;
	private String iq_target;
	
	public Inquiry(String iq_no, String u_no, String iq_title, String iq_text, String iq_category, String iq_dcategory,
			Date iq_date, String iq_oc, String a_no, String iq_reply, Date iq_rdate, String iq_target) {
		super();
		this.iq_no = iq_no;
		this.u_no = u_no;
		this.iq_title = iq_title;
		this.iq_text = iq_text;
		this.iq_category = iq_category;
		this.iq_dcategory = iq_dcategory;
		this.iq_date = iq_date;
		this.iq_oc = iq_oc;
		this.a_no = a_no;
		this.iq_reply = iq_reply;
		this.iq_rdate = iq_rdate;
		this.iq_target = iq_target;
		
	}


	public String getIq_no() {
		return iq_no;
	}


	public void setIq_no(String iq_no) {
		this.iq_no = iq_no;
	}


	public String getU_no() {
		return u_no;
	}


	public void setU_no(String u_no) {
		this.u_no = u_no;
	}


	public String getIq_title() {
		return iq_title;
	}


	public void setIq_title(String iq_title) {
		this.iq_title = iq_title;
	}


	public String getIq_text() {
		return iq_text;
	}


	public void setIq_text(String iq_text) {
		this.iq_text = iq_text;
	}


	public String getIq_category() {
		return iq_category;
	}


	public void setIq_category(String iq_category) {
		this.iq_category = iq_category;
	}


	public String getIq_dcategory() {
		return iq_dcategory;
	}


	public void setIq_dcategory(String iq_dcategory) {
		this.iq_dcategory = iq_dcategory;
	}


	public Date getIq_date() {
		return iq_date;
	}


	public void setIq_date(Date iq_date) {
		this.iq_date = iq_date;
	}


	public String getIq_oc() {
		return iq_oc;
	}


	public void setIq_oc(String iq_oc) {
		this.iq_oc = iq_oc;
	}


	public String getA_no() {
		return a_no;
	}


	public void setA_no(String a_no) {
		this.a_no = a_no;
	}


	public String getIq_reply() {
		return iq_reply;
	}


	public void setIq_reply(String iq_reply) {
		this.iq_reply = iq_reply;
	}

	public Date getIq_rdate() {
		return iq_rdate;
	}

	public void setIq_rdate(Date iq_rdate) {
		this.iq_rdate = iq_rdate;
	}

	public String getU_name() {
		return u_name;
	}

	public void setU_name(String u_name) {
		this.u_name = u_name;
	}

	public String getA_name() {
		return a_name;
	}

	public void setA_name(String a_name) {
		this.a_name = a_name;
	}


	public String getIq_target() {
		return iq_target;
	}


	public void setIq_target(String iq_target) {
		this.iq_target = iq_target;
	}


	@Override
	public String toString() {
		return "Inquiry [iq_no=" + iq_no + ", u_no=" + u_no + ", iq_title=" + iq_title + ", iq_text=" + iq_text
				+ ", iq_category=" + iq_category + ", iq_dcategory=" + iq_dcategory + ", iq_date=" + iq_date
				+ ", iq_oc=" + iq_oc + ", a_no=" + a_no + ", iq_reply=" + iq_reply + ", iq_rdate=" + iq_rdate
				+ ", u_name=" + u_name + ", a_name=" + a_name + ", iq_target=" + iq_target + "]";
	}


	
	
	
}
