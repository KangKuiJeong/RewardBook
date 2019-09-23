package inquiry.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Oto implements Serializable{

	private static final long serialVersionUID = 3212L;
	
	public Oto() {}
	
	private String oto_no;	//글번호
	private String u_no;	//회원번호
	private String u_no_answer;	//답변자의 회원번호
	private String oto_qtitle;	//질문 제목
	private String oto_qtext;	//질문 본문
	private Date oto_qdate;	//질문날짜
	private String oto_yn;	//답변여부
	private String oto_atitle;	//답변 제목
	private String oto_atext;	//답변 내용
	private Date oto_adate;	//답변일
	private String oto_makerName;
	
	public Oto(String oto_no, String u_no, String u_no_answer, String oto_qtitle, String oto_qtext, Date oto_qdate,
			String oto_yn, String oto_atitle, String oto_atext, Date oto_adate, String oto_makerName) {
		super();
		this.oto_no = oto_no;
		this.u_no = u_no;
		this.u_no_answer = u_no_answer;
		this.oto_qtitle = oto_qtitle;
		this.oto_qtext = oto_qtext;
		this.oto_qdate = oto_qdate;
		this.oto_yn = oto_yn;
		this.oto_atitle = oto_atitle;
		this.oto_atext = oto_atext;
		this.oto_adate = oto_adate;
		this.oto_makerName = oto_makerName;
	}
	
	//getters and setters
	public String getOto_no() {
		return oto_no;
	}
	public void setOto_no(String oto_no) {
		this.oto_no = oto_no;
	}
	public String getU_no() {
		return u_no;
	}
	public void setU_no(String u_no) {
		this.u_no = u_no;
	}
	public String getU_no_answer() {
		return u_no_answer;
	}
	public void setU_no_answer(String u_no_answer) {
		this.u_no_answer = u_no_answer;
	}
	public String getOto_qtitle() {
		return oto_qtitle;
	}
	public void setOto_qtitle(String oto_qtitle) {
		this.oto_qtitle = oto_qtitle;
	}
	public String getOto_qtext() {
		return oto_qtext;
	}
	public void setOto_qtext(String oto_qtext) {
		this.oto_qtext = oto_qtext;
	}
	public Date getOto_qdate() {
		return oto_qdate;
	}
	public void setOto_qdate(Date oto_qdate) {
		this.oto_qdate = oto_qdate;
	}
	public String getOto_yn() {
		return oto_yn;
	}
	public void setOto_yn(String oto_yn) {
		this.oto_yn = oto_yn;
	}
	public String getOto_atitle() {
		return oto_atitle;
	}
	public void setOto_atitle(String oto_atitle) {
		this.oto_atitle = oto_atitle;
	}
	public String getOto_atext() {
		return oto_atext;
	}
	public void setOto_atext(String oto_atext) {
		this.oto_atext = oto_atext;
	}
	public Date getOto_adate() {
		return oto_adate;
	}
	public void setOto_adate(Date oto_adate) {
		this.oto_adate = oto_adate;
	}
	
	
	public String getOto_makerName() {
		return oto_makerName;
	}

	public void setOto_makerName(String oto_makerName) {
		this.oto_makerName = oto_makerName;
	}
	


	@Override
	public String toString() {
		return "Oto [oto_no=" + oto_no + ", u_no=" + u_no + ", u_no_answer=" + u_no_answer + ", oto_qtitle="
				+ oto_qtitle + ", oto_qtext=" + oto_qtext + ", oto_qdate=" + oto_qdate + ", oto_yn=" + oto_yn
				+ ", oto_atitle=" + oto_atitle + ", oto_atext=" + oto_atext + ", oto_adate=" + oto_adate
				+ ", oto_makerName=" + oto_makerName + "]";
	}
	
	
}
