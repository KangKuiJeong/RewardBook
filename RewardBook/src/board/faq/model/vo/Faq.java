package board.faq.model.vo;

import java.util.Date;

public class Faq implements java.io.Serializable {

	private static final long serialVersionUID = 2001L;

	private String faq_no; //글번호
	private String a_no; //관리자번호
	private String faq_title; //제목
	private String faq_text; //본문
	private java.util.Date faq_date; //작성일
	private String faq_oc; //공개여부

	public Faq() {}
	
	public Faq(String faq_no, String a_no, String faq_title, String faq_text, Date faq_date, String faq_oc) {
		super();
		this.faq_no = faq_no;
		this.a_no = a_no;
		this.faq_title = faq_title;
		this.faq_text = faq_text;
		this.faq_date = faq_date;
		this.faq_oc = faq_oc;
	}
	public String getfaq_no() {
		return faq_no;
	}
	public void setfaq_no(String faq_no) {
		this.faq_no = faq_no;
	}
	public String getA_no() {
		return a_no;
	}
	public void setA_no(String a_no) {
		this.a_no = a_no;
	}
	public String getfaq_title() {
		return faq_title;
	}
	public void setfaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public String getFaq_text() {
		return faq_text;
	}
	public void setFaq_text(String faq_text) {
		this.faq_text = faq_text;
	}
	public java.util.Date getfaq_date() {
		return faq_date;
	}
	public void setfaq_date(java.util.Date faq_date) {
		this.faq_date = faq_date;
	}
	public String getFaq_oc() {
		return faq_oc;
	}
	public void setFaq_oc(String faq_oc) {
		this.faq_oc = faq_oc;
	}
	@Override
	public String toString() {
		return "Faq [faq_no=" + faq_no + ", a_no=" + a_no + ", faq_title=" + faq_title + ", faq_text=" + faq_text
				+ ", faq_date=" + faq_date + ", faq_oc=" + faq_oc + "]";
	}
	
	
}
