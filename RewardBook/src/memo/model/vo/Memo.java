package memo.model.vo;

import java.io.Serializable;
import java.util.Date;

public class Memo implements Serializable {
	private static final long serivalVersionUID = 2004;
	
	private String m_no ; //메모번호
	private String p_no; //프로젝트번호
	private String u_no; //회원번호
	private String m_text; //메모내용
	private java.util.Date m_date; //메모날짜
	public Memo() {}
	
	public Memo(String m_no, String p_no, String u_no, String m_text, Date m_date) {
		super();
		this.m_no = m_no;
		this.p_no = p_no;
		this.u_no = u_no;
		this.m_text = m_text;
		this.m_date = m_date;
	}

	public String getM_no() {
		return m_no;
	}

	public void setM_no(String m_no) {
		this.m_no = m_no;
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

	public String getM_text() {
		return m_text;
	}

	public void setM_text(String m_text) {
		this.m_text = m_text;
	}

	public java.util.Date getM_date() {
		return m_date;
	}

	public void setM_date(java.util.Date m_date) {
		this.m_date = m_date;
	}

	@Override
	public String toString() {
		return "Memo [m_no=" + m_no + ", p_no=" + p_no + ", u_no=" + u_no + ", m_text=" + m_text + ", m_date=" + m_date
				+ "]";
	}
	

	
}
