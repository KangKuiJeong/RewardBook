package board.notice.model.vo;

import java.util.Date;

public class Notice {
	private static final long serialVersionUID = 2000L;
	private String nt_no; //글번호
	private String a_no; //관리자번호
	private String nt_title; //제목
	private String nt_text; //본문
	private String nt_img;//이미지
	private java.util.Date nt_date;//작성일
	private String nt_oc; //공개여부
	private String nt_type;//타입(notice&event)

	public Notice() {}

	
	public Notice(String nt_no, String a_no, String nt_title, String nt_text, String nt_img, Date nt_date, String nt_oc,
			String nt_type) {
		super();
		this.nt_no = nt_no;
		this.a_no = a_no;
		this.nt_title = nt_title;
		this.nt_text = nt_text;
		this.nt_img = nt_img;
		this.nt_date = nt_date;
		this.nt_oc = nt_oc;
		this.nt_type = nt_type;
	}


	public String getNt_no() {
		return nt_no;
	}

	public void setNt_no(String nt_no) {
		this.nt_no = nt_no;
	}

	public String getA_no() {
		return a_no;
	}

	public void setA_no(String a_no) {
		this.a_no = a_no;
	}

	public String getNt_title() {
		return nt_title;
	}

	public void setNt_title(String nt_title) {
		this.nt_title = nt_title;
	}

	public String getNt_text() {
		return nt_text;
	}

	public void setNt_text(String nt_text) {
		this.nt_text = nt_text;
	}

	public String getNt_img() {
		return nt_img;
	}

	public void setNt_img(String nt_img) {
		this.nt_img = nt_img;
	}

	public java.util.Date getNt_date() {
		return nt_date;
	}

	public void setNt_date(java.util.Date nt_date) {
		this.nt_date = nt_date;
	}

	public String getNt_oc() {
		return nt_oc;
	}

	public void setNt_oc(String nt_oc) {
		this.nt_oc = nt_oc;
	}

	public String getNt_type() {
		return nt_type;
	}

	public void setNt_type(String nt_type) {
		this.nt_type = nt_type;
	}


	@Override
	public String toString() {
		return "Notice [nt_no=" + nt_no + ", a_no=" + a_no + ", nt_title=" + nt_title + ", nt_text=" + nt_text
				+ ", nt_img=" + nt_img + ", nt_date=" + nt_date + ", nt_oc=" + nt_oc + ", nt_type=" + nt_type + "]";
	}
	
	
}
