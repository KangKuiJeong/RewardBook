package payment.model.vo;

public class Reward implements java.io.Serializable {

	private static final long serialVersionUID = 1002L;

	private String r_no;
	private String p_no;
	private String r_amount;
	private String r_name;
	private String r_detail;
	private int r_price;
	
	public Reward() {
		super();
	}

	public Reward(String r_no, String p_no,String r_amount, String r_name, String r_detail, int r_price) {
		super();
		this.r_no = r_no;
		this.p_no = p_no;
		this.r_amount = r_amount;
		this.r_name = r_name;
		this.r_detail = r_detail;
		this.r_price = r_price;
	}

	public String getR_no() {
		return r_no;
	}

	public void setR_no(String r_no) {
		this.r_no = r_no;
	}

	public String getP_no() {
		return p_no;
	}

	public void setP_no(String p_no) {
		this.p_no = p_no;
	}
	
	public String getR_amount() {
		return r_amount;
	}

	public void setR_amount(String r_amount) {
		this.r_amount = r_amount;
	}

	public String getR_name() {
		return r_name;
	}

	public void setR_name(String r_name) {
		this.r_name = r_name;
	}

	public String getR_detail() {
		return r_detail;
	}

	public void setR_detail(String r_detail) {
		this.r_detail = r_detail;
	}

	public int getR_price() {
		return r_price;
	}

	public void setR_price(int r_price) {
		this.r_price = r_price;
	}

	@Override
	public String toString() {
		return "Reward [r_no=" + r_no + ", p_no=" + p_no + ", r_amount=" + r_amount + ", r_name=" + r_name
				+ ", r_detail=" + r_detail + ", r_price=" + r_price + "]";
	}

}
