package admin.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;

import admin.model.dao.AdminDao;
import admin.model.vo.Admin;

public class AdminService {
	
	private AdminDao adao = new AdminDao();
	
	// 관리자 로그인용 Service
	public Admin loginCheck(String userId, String userPwd) {
		Connection conn = getConnection();
		Admin loginAdmin = adao.loginCheck(conn, userId, userPwd);
		close(conn);
		
		return loginAdmin;
	}

}
