package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import member.model.dao.MemberDao;
import member.model.vo.Member;

public class MemberService {
	
	MemberDao mdao = new MemberDao();
	
	//로그인 처리
	public Member loginCheck(String userId, String userPwd) {
		Connection conn = getConnection();
		Member loginMember = mdao.loginCheck(conn, userId, userPwd);
		close(conn);
		return loginMember;
	}
	
	//개인회원가입용 Service
	public int insertMember(Member member) {
		
		Connection conn = getConnection();
		int result = mdao.insertMember(conn, member);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
		
	}
	
	//기업회원가입용 Service
	public int insertCompanyMember(Member member) {
		
		Connection conn = getConnection();
		int result = mdao.insertCompanyMember(conn, member);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
		
	}
	
	//회원정보 수정용 Service(개인회원)
	public int updateMemberPersonal(Member member) {
		
		Connection conn = getConnection();
		int result = mdao.updateMemberPersonal(conn, member);
		
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		
		return result;
	}
	
	//회원정보 수정용 Service(기업회원)
	public int updateMemberCompany(Member member) {
			
			Connection conn = getConnection();
			int result = mdao.updateMemberCompany(conn, member);
			
			if(result > 0)
				commit(conn);
			else
				rollback(conn);
			close(conn);

			return result;

		}

	//회원탈퇴용 Service(개인 기업 공통)
	public int deleteMember(String userId) {
		
		Connection conn = getConnection();
		int result = mdao.deleteMember(conn, userId);
		
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);

		return result;
		
	}
	

	//아이디찾기(가입여부확인) Service
	public Member findId(String userId) {
		
		Connection conn = getConnection();
		Member findMember = mdao.findId(conn, userId);
		close(conn);
		
		return findMember;
		
	}
	
	//사업자번호 중복여부 확인용  Service
	public Member findBno(String bNo) {
		
		Connection conn = getConnection();
		Member findMember = mdao.findBno(conn, bNo);
		close(conn);
		
		return findMember;
		
	}
	
	
	public Member selectOne(String uNo) {
		Connection conn = getConnection();
		Member member = mdao.selectOne(conn, uNo);
		close(conn);
		return member;
	}
	
	//프로필사진 등록용
	public int updateMemberProfile(String userNo, String fileName) {
		
		Connection conn = getConnection();
		int result = mdao.updateMemberPersonal(conn, userNo, fileName);
		
		if(result > 0) {
			
			commit(conn);
		
		}else {
			
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	//임시비밀번호 저장용 Service
	public int updateFindPwd(String cryptPwd, String mailId) {
		
		Connection conn = getConnection();
		int result = mdao.updateFindPwd(conn, cryptPwd, mailId);
		
		if(result > 0) {
			
			commit(conn);
		
		}else {
			
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}

	//관리자 페이지 멤버목록 page list 선택
	public ArrayList<Member> pageSelect(int start, int limit, String check1, String check2, String select1, String text1) {
		Connection conn = getConnection();
		ArrayList<Member> list = mdao.pageSelect(conn, start, limit, check1, check2, select1, text1);
		close(conn);

		return list;
	}

	public int pageCount(String check1, String check2, String select1, String text1) {
		Connection conn = getConnection();
		int result = mdao.pageCount(conn, check1, check2, select1, text1);
		close(conn);

		return result;
	}

	public Member detailMember(String u_no) {
		Connection conn = getConnection();
		Member member = mdao.detailMember(conn, u_no);
		close(conn);

		return member;
	}

	public int updateMember(Member member) {
		Connection conn = getConnection();
		int result = mdao.updateMember(conn, member);
		close(conn);

		return result;
	}

	public int updateMember_A(Member member) {
		Connection conn = getConnection();
		int result = mdao.updateMember_A(conn, member);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result;
	}

	public int insertBilling(String u_no, String billing) {
		Connection conn = getConnection();
		int result = mdao.insertBilling(conn, u_no, billing);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		
		return result;
	}

	public int insertPost(String phone, String zipCode, String address, String addressDetail, String u_no) {
		Connection conn = getConnection();
		int result = mdao.insertPost(conn, phone, zipCode, address, addressDetail, u_no);
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);
		

		return result;
	}
		
}
