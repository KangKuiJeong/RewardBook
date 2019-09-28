package project.model.vo;

import java.sql.Date;

public class ProjectNews implements java.io.Serializable {

	private static final long serialVersionUID = 1000L;

	private String pn_no;
	private String p_no;
	private String pn_title;
	private String pn_text;
	private String pn_date;
	private int pn_count;
	
	public ProjectNews() {
		super();
	}

	public ProjectNews(String pn_no, String p_no, String pn_title, String pn_text, String pn_date, int pn_count) {
		super();
		this.pn_no = pn_no;
		this.p_no = p_no;
		this.pn_title = pn_title;
		this.pn_text = pn_text;
		this.pn_date = pn_date;
		this.pn_count = pn_count;
	}

	public String getPn_no() {
		return pn_no;
	}

	public void setPn_no(String pn_no) {
		this.pn_no = pn_no;
	}

	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
	}

	public String getPn_title() {
		return pn_title;
	}

	public void setPn_title(String pn_title) {
		this.pn_title = pn_title;
	}

	public String getPn_text() {
		return pn_text;
	}

	public void setPn_text(String pn_text) {
		this.pn_text = pn_text;
	}

	public String getPn_date() {
		return pn_date;
	}

	public void setPn_date(String pn_date) {
		this.pn_date = pn_date;
	}

	public int getPn_count() {
		return pn_count;
	}

	public void setPn_count(int pn_count) {
		this.pn_count = pn_count;
	}

	@Override
	public String toString() {
		return "Project_News [pn_no=" + pn_no + ", p_no=" + p_no + ", pn_title=" + pn_title + ", pn_text=" + pn_text
				+ ", pn_date=" + pn_date + ", pn_count=" + pn_count + "]";
	}
	
	
	
	
}
