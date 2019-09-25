package member.model.dao;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import member.model.vo.Member;

public class MemberDao {

	public MemberDao() {}
	
	//로그인처리 DAO
	public Member loginCheck(Connection conn, String userId, String userPwd) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from users "
				+ "where u_id = ? and u_pw = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				member = new Member();
				
				member.setuNo(rset.getString("U_NO"));
				member.setuBno(rset.getString("U_BNO"));
				member.setId(userId);
				member.setName(rset.getString("U_NAME"));
				member.setPw(userPwd);
				member.setJoinDate(rset.getDate("U_JOIN_DATE"));
				member.setPhone(rset.getString("U_PHONE"));
				member.setProfileImg(rset.getString("U_PROFILE"));
				member.setIntro(rset.getString("U_INTRO"));
				member.setAddress(rset.getString("U_ADDRESS"));
				member.setPost(rset.getString("U_POST"));
				member.setMileage(rset.getInt("U_MILEAGE"));
				member.setBank(rset.getString("U_BANK"));
				member.setBankAccount(rset.getString("U_BANK_ACCOUNT"));
				member.setHomepage(rset.getString("U_HOMEPAGE"));
				member.setCategory(rset.getString("U_CATEGORY"));
				member.setAddress_detail(rset.getString("U_ADDRESS_DETAIL"));
				member.setJob(rset.getString("U_JOB"));
				member.setP_billing(rset.getString("P_BILLING"));
				
			}
		} catch (Exception e) {
			
			e.printStackTrace();
		
		}finally {
			
			close(rset);
			close(pstmt);
		}
		
		return member;
	}
	
	//개인회원가입 DAO
	public int insertMember(Connection conn, Member member) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into users values "
				+ "('A0000'|| TO_CHAR(SEQ_U_PNO.nextval), null, ?, ?, ?, sysdate, null, null,"
				+ "null, null, null, 0, null, null, null, null, null, null)";
	
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getPw());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}

	
	//기업회원가입 DAO
	public int insertCompanyMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into users values "
				+ "('B0000'|| TO_CHAR(SEQ_U_CNO.nextval), ?, ?, ?, ?, sysdate, null, null,"
				+ "null, null, null, 0, null, null, null, ?, null, null)";
	
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, member.getuBno());
			pstmt.setString(2, member.getId());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getPw());
			pstmt.setString(5, member.getCategory());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}	

	//개인회원 정보수정 DAO
	public int updateMemberPersonal(Connection conn, Member member) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update users "
				+ "set u_name = ?, u_pw = ?, u_phone = ?, u_post = ?, u_address = ?, u_address_detail = ?, "
				+ "u_intro = ?, u_job = ? where u_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);			
			
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, member.getPost());
			pstmt.setString(5, member.getAddress());
			pstmt.setString(6, member.getAddress_detail());
			pstmt.setString(7, member.getIntro());
			pstmt.setString(8, member.getJob());
			pstmt.setString(9, member.getuNo());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
	}
	
	//기업회원 정보수정 DAO
	public int updateMemberCompany(Connection conn, Member member) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update users "
				+ "set u_name = ?, u_pw = ?, u_phone = ?, u_post = ?, u_address = ?, u_address_detail = ?, "
				+ "u_intro = ?, u_category = ?, u_homepage = ? where u_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);			
			
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getPw());
			pstmt.setString(3, member.getPhone());
			pstmt.setString(4, member.getPost());
			pstmt.setString(5, member.getAddress());
			pstmt.setString(6, member.getAddress_detail());
			pstmt.setString(7, member.getIntro());
			pstmt.setString(8, member.getCategory());
			pstmt.setString(9, member.getHomepage());
			pstmt.setString(10, member.getuNo());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
		
	}
	
	//회원탈퇴 DAO
	public int deleteMember(Connection conn, String userId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from users where u_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);			
			
			pstmt.setString(1, userId);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
		
	}

	//아이디찾기(가입여부확인) DAO
	public Member findId(Connection conn, String userId) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from users where u_id = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userId);
			
			rset = pstmt.executeQuery();
			member = new Member();
			
			if(rset.next()) {
				
				member.setId(userId);
				member.setName(rset.getString("U_NAME"));
			
			}else {
				
				userId = null;
				member.setId(userId);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return member;
	}
	
	//사업자등록번호 중복조회 DAO
	public Member findBno(Connection conn, String bNo) {
		
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from users where u_bno = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bNo);
			
			rset = pstmt.executeQuery();
			member = new Member();
			
			if(rset.next()) {
				
				member.setuBno(bNo);
				
			}else {
				
				bNo = null;
				member.setId(bNo);
				
			}
			
		} catch (Exception e) {
			
			e.printStackTrace();
			
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return member;
	}
	
	//세션 저장용 DAO
	public Member selectOne(Connection conn, String uNo) {
		
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from users where u_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, uNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				member = new Member();
				
				member.setuNo(rset.getString("U_NO"));
				member.setuBno(rset.getString("U_BNO"));
				member.setId(rset.getString("U_ID"));
				member.setPw(rset.getString("U_PW"));
				member.setName(rset.getString("U_NAME"));
				member.setJoinDate(rset.getDate("U_JOIN_DATE"));
				member.setPhone(rset.getString("U_PHONE"));
				member.setProfileImg(rset.getString("U_PROFILE"));
				member.setIntro(rset.getString("U_INTRO"));
				member.setAddress(rset.getString("U_ADDRESS"));
				member.setPost(rset.getString("U_POST"));
				member.setMileage(rset.getInt("U_MILEAGE"));
				member.setBank(rset.getString("U_BANK"));
				member.setBankAccount(rset.getString("U_BANK_ACCOUNT"));
				member.setHomepage(rset.getString("U_HOMEPAGE"));
				member.setCategory(rset.getString("U_CATEGORY"));
				member.setAddress_detail(rset.getString("U_ADDRESS_DETAIL"));
				member.setJob(rset.getString("U_JOB"));
				member.setP_billing(rset.getString("P_BILLING"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return member;
		
	}
	
	//프로필사진 등록용 DAO
	public int updateMemberPersonal(Connection conn, String userNo, String fileName) {
		
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "update users set u_profile = ? where u_no = ?";
		
		try {
			pstmt = conn.prepareStatement(query);			
			
			pstmt.setString(1, fileName);
			pstmt.setString(2, userNo);
			
		
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
		
	}
	
	//임시비밀번호 업데이트용 DAO
	public int updateFindPwd(Connection conn, String cryptPwd, String mailId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update users set u_pw = ? where u_id = ?";
		
		try {
			pstmt = conn.prepareStatement(query);			
			
			pstmt.setString(1, cryptPwd);
			pstmt.setString(2, mailId);
			
		
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}

		return result;
		
	}

	public ArrayList<Member> pageSelect(Connection conn, int start, int limit, String check1, String check2, String select1, String text1) {

		ArrayList<Member> list = new ArrayList<Member>();
		
		PreparedStatement pstmt = null;
		ResultSet rest = null;
		
		String check = "";
		
		if (check1.equals("true") || check2.equals("true")) {
			check += "where u_no like ";
			if (check1.equals("true")) {
				check += "'A%'";
				if (check2.equals("true")) {
					check += "or u_no like 'B%'";
				}
			} else {
				check += "'B%'";
			}
		}
		
		if (text1 != "") {
			if (check.length() > 0)
				check += " and ";
			else
				check += " where ";
			
			switch(select1) {
				case "회원번호": check += "u_no "; break;
				case "사업자번호": check += "u_bno "; break;
				case "아이디": check += "u_id "; break;
				case "이름": check += "u_name "; break;
				case "전화번호": check += "u_phone "; break;
			}
			
			check += "like '%" + text1 + "%'";
			
		}
		
		String query = "select * from (select rownum rnum, u_no, u_bno, u_id, u_name, u_phone, u_join_date from users " + check + " order by u_join_date) where rnum >= ? and rnum <= ?";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setInt(1, (start - 1) * limit + 1);
			pstmt.setInt(2, start * limit);
			
			rest = pstmt.executeQuery();
			
			while (rest.next()) {
				
				Member member = new Member();
				
				member.setuNo(rest.getString("u_no"));
				member.setuBno(rest.getString("u_bno"));
				member.setId(rest.getString("u_id"));
				member.setName(rest.getString("u_name"));
				member.setPhone(rest.getString("u_phone"));
				member.setJoinDate(rest.getDate("u_join_date"));
				
				list.add(member);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rest);
			close(pstmt);
		}
		
		return list;
	}

	public int pageCount(Connection conn, String check1, String check2, String select1, String text1) {
		
		int result = 0;
		
		Statement stmt = null;
		ResultSet rest = null;

		String check = "";
		
		if (check1.equals("true") || check2.equals("true")) {
			check += "where u_no like ";
			if (check1.equals("true")) {
				check += "'A%'";
				if (check2.equals("true")) {
					check += "or u_no like 'B%'";
				}
			} else {
				check += "'B%'";
			}
		}

		if (text1 != "") {
			if (check.length() > 0)
				check += " and ";
			else
				check += " where ";
			
			switch(select1) {
				case "회원번호": check += "u_no "; break;
				case "사업자번호": check += "u_bno "; break;
				case "아이디": check += "u_id "; break;
				case "이름": check += "u_name "; break;
				case "전화번호": check += "u_phone "; break;
			}
			
			check += "like '%" + text1 + "%'";
			
		}
		
		String query = "select count(*) counts from (select * from (select rownum rnum, u_no, u_bno, u_id, u_name, u_phone, u_join_date from users " + check + " order by u_join_date))";
		
		try {

			stmt = conn.createStatement();
			
			rest = stmt.executeQuery(query);
			
			if (rest.next()) {
				result = rest.getInt("counts");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rest);
			close(stmt);
		}
		
		return result;
	}

	public Member detailMember(Connection conn, String u_no) {
		Member member = null;
		
		PreparedStatement pstmt = null;
		ResultSet rest = null;
		
		String query = "select * from users where u_no = ?"; 
		
		try {
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, u_no);
			
			rest = pstmt.executeQuery();
			
			if (rest.next()) {
				
				member = new Member();

				member.setuNo(rest.getString("u_no"));
				member.setuBno(rest.getString("u_bno"));
				member.setId(rest.getString("u_id"));
				member.setName(rest.getString("u_name"));
				member.setPw(rest.getString("u_pw"));
				member.setPhone(rest.getString("u_phone"));
				member.setJoinDate(rest.getDate("u_join_date"));
				member.setProfileImg(rest.getString("u_profile"));
				member.setIntro(rest.getString("u_intro"));
				member.setAddress(rest.getString("u_address"));
				member.setPost(rest.getString("u_post"));
				member.setMileage(Integer.parseInt(rest.getString("u_mileage")));
				member.setBank(rest.getString("u_bank"));
				member.setBankAccount(rest.getString("u_bank_account"));
				member.setHomepage(rest.getString("u_homepage"));
				member.setCategory(rest.getString("u_category"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rest);
			close(pstmt);
		}
		
		return member;
	}

	public int updateMember(Connection conn, Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int updateMember_A(Connection conn, Member member) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String query = "update users set u_bno=?, u_id=?, u_name=?, u_phone=?, u_intro=?, u_address=?, u_post=?, u_mileage=?, u_bank=?, u_bank_account=?, u_homepage=?, u_category=? where u_no = ?";
		
		try {
			
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, member.getuBno());
			pstmt.setString(2, member.getId());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getPhone());
			pstmt.setString(5, member.getIntro());
			pstmt.setString(6, member.getAddress());
			pstmt.setString(7, member.getPost());
			pstmt.setInt(8, member.getMileage());
			pstmt.setString(9, member.getBank());
			pstmt.setString(10, member.getBankAccount());
			pstmt.setString(11, member.getHomepage());
			pstmt.setString(12, member.getCategory());
			pstmt.setString(13, member.getuNo());
			
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public int insertBilling(Connection conn, String u_no, String billing) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update users set p_billing=? where u_no=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, billing);
			pstmt.setString(2, u_no);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

}
