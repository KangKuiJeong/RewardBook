package member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable{
	
	private static final long serivalVersionUID = 3001L;
	
	//기본생성자
	public Member() {}
	
	private String uNo;		//회원번호
	private String uBno;	//사업자번호(기업)
	private String id;		//아이디
	private String name;	//이름(기업명,개인이름)
	private String pw;		//패스워드
	private java.sql.Date joinDate;	//가입일
	private String phone;	//전화번호
	private String profileImg;	//프로필이미지
	private String intro;	//소개글
	private String address;	//주소
	private String post;	//우편번호
	private int mileage;	//마일리지
	private String bank;	//은행
	private String bankAccount;	//계좌번호
	private String homepage;	//홈페이지
	private String category;	//카테고리
	private String address_detail;	//추가 : 상세주소
	private String job;	//추가 : 직업
	private String p_billing;//추가 : 빌링키
	
	//매개변수 있는 생성자
	public Member(String uNo, String uBno, String id, String name, String pw, Date joinDate, String phone,
			String profileImg, String intro, String address, String post, int mileage, String bank, String bankAccount,
			String homepage, String category, String address_detail, String job, String p_billing) {
		super();
		this.uNo = uNo;
		this.uBno = uBno;
		this.id = id;
		this.name = name;
		this.pw = pw;
		this.joinDate = joinDate;
		this.phone = phone;
		this.profileImg = profileImg;
		this.intro = intro;
		this.address = address;
		this.post = post;
		this.mileage = mileage;
		this.bank = bank;
		this.bankAccount = bankAccount;
		this.homepage = homepage;
		this.category = category;
		this.address_detail = address_detail;
		this.job = job;
		this.p_billing = p_billing;
	}
	
	//getters & setters
	public String getuNo() {
		return uNo;
	}

	public void setuNo(String uNo) {
		this.uNo = uNo;
	}

	public String getuBno() {
		return uBno;
	}

	public void setuBno(String uBno) {
		this.uBno = uBno;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public java.sql.Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(java.sql.Date joinDate) {
		this.joinDate = joinDate;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getProfileImg() {
		return profileImg;
	}

	public void setProfileImg(String profileImg) {
		this.profileImg = profileImg;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public int getMileage() {
		return mileage;
	}

	public void setMileage(int mileage) {
		this.mileage = mileage;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	
	public String getAddress_detail() {
		return address_detail;
	}

	public void setAddress_detail(String address_detail) {
		this.address_detail = address_detail;
	}


	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}
	
	public String getP_billing() {
		return p_billing;
	}

	public void setP_billing(String p_billing) {
		this.p_billing = p_billing;
	}

	@Override
	public String toString() {
		return "Member [uNo=" + uNo + ", uBno=" + uBno + ", id=" + id + ", name=" + name + ", pw=" + pw + ", joinDate="
				+ joinDate + ", phone=" + phone + ", profileImg=" + profileImg + ", intro=" + intro + ", address="
				+ address + ", post=" + post + ", mileage=" + mileage + ", bank=" + bank + ", bankAccount="
				+ bankAccount + ", homepage=" + homepage + ", category=" + category + ", address_detail="
				+ address_detail + ", job=" + job + ", p_billing=" + p_billing + "]";
	}
	
}
