package Stats.model.vo;

import java.sql.Date;

public class Visit implements java.io.Serializable {

	private static final long serialVersionUID = 2003L;

	private java.sql.Date v_date;
	private int v_value;
	
	public Visit() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Visit(Date v_date, int v_value) {
		super();
		this.v_date = v_date;
		this.v_value = v_value;
	}

	public java.sql.Date getV_date() {
		return v_date;
	}

	public void setV_date(java.sql.Date v_date) {
		this.v_date = v_date;
	}

	public int getV_value() {
		return v_value;
	}

	public void setV_value(int v_value) {
		this.v_value = v_value;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Visit [v_date=" + v_date + ", v_value=" + v_value + "]";
	}
	
	
	
}
