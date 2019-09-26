package payment.model.vo;

import java.sql.Date;

public class Payment implements java.io.Serializable {

	private static final long serialVersionUID = 1001L;
	
	private String pm_no;
	private String u_no;
	private String p_no;
	private String r_no;
	private String pm_option;
	private String pm_quantity;
	private String pm_oid;
	private int pm_price;
	private int pm_price_plus;
	private int pm_mileage;
	private java.sql.Date pm_date;
	private String pm_nopen;
	private String pm_popen;
	private String pm_success;
	
	public Payment() {
		super();
	}

	public Payment(String pm_no, String u_no, String p_no, String r_no, String pm_option, String pm_quantity,
			String pm_oid, int pm_price, int pm_price_plus, int pm_mileage, Date pm_date, String pm_nopen,
			String pm_popen, String pm_success) {
		super();
		this.pm_no = pm_no;
		this.u_no = u_no;
		this.p_no = p_no;
		this.r_no = r_no;
		this.pm_option = pm_option;
		this.pm_quantity = pm_quantity;
		this.pm_oid = pm_oid;
		this.pm_price = pm_price;
		this.pm_price_plus = pm_price_plus;
		this.pm_mileage = pm_mileage;
		this.pm_date = pm_date;
		this.pm_nopen = pm_nopen;
		this.pm_popen = pm_popen;
		this.pm_success = pm_success;
	}

	public String getPm_no() {
		return pm_no;
	}

	public void setPm_no(String pm_no) {
		this.pm_no = pm_no;
	}

	public String getU_no() {
		return u_no;
	}

	public void setU_no(String u_no) {
		this.u_no = u_no;
	}

	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
	}

	public String getR_no() {
		return r_no;
	}

	public void setR_no(String r_no) {
		this.r_no = r_no;
	}

	public String getPm_option() {
		return pm_option;
	}

	public void setPm_option(String pm_option) {
		this.pm_option = pm_option;
	}

	public String getPm_quantity() {
		return pm_quantity;
	}

	public void setPm_quantity(String pm_quantity) {
		this.pm_quantity = pm_quantity;
	}

	public String getPm_oid() {
		return pm_oid;
	}

	public void setPm_oid(String pm_oid) {
		this.pm_oid = pm_oid;
	}

	public int getPm_price() {
		return pm_price;
	}

	public void setPm_price(int pm_price) {
		this.pm_price = pm_price;
	}

	public int getPm_price_plus() {
		return pm_price_plus;
	}

	public void setPm_price_plus(int pm_price_plus) {
		this.pm_price_plus = pm_price_plus;
	}

	public int getPm_mileage() {
		return pm_mileage;
	}

	public void setPm_mileage(int pm_mileage) {
		this.pm_mileage = pm_mileage;
	}

	public java.sql.Date getPm_date() {
		return pm_date;
	}

	public void setPm_date(java.sql.Date pm_date) {
		this.pm_date = pm_date;
	}

	public String getPm_nopen() {
		return pm_nopen;
	}

	public void setPm_nopen(String pm_nopen) {
		this.pm_nopen = pm_nopen;
	}

	public String getPm_popen() {
		return pm_popen;
	}

	public void setPm_popen(String pm_popen) {
		this.pm_popen = pm_popen;
	}

	public String getPm_success() {
		return pm_success;
	}

	public void setPm_success(String pm_success) {
		this.pm_success = pm_success;
	}

	@Override
	public String toString() {
		return "Payment [pm_no=" + pm_no + ", u_no=" + u_no + ", p_no=" + p_no + ", r_no=" + r_no + ", pm_option="
				+ pm_option + ", pm_quantity=" + pm_quantity + ", pm_oid=" + pm_oid + ", pm_price=" + pm_price
				+ ", pm_price_plus=" + pm_price_plus + ", pm_mileage=" + pm_mileage + ", pm_date=" + pm_date
				+ ", pm_nopen=" + pm_nopen + ", pm_popen=" + pm_popen + ", pm_success=" + pm_success + "]";
	}

}
