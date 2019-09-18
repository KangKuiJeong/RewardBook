package board.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import board.notice.model.dao.NoticeDao;
import board.notice.model.vo.Notice;
import static common.JDBCTemplate.*;

public class NoticeService {
	
	private NoticeDao nDao = new NoticeDao();
	
	public int deleteNotice(String n_no) {
		Connection conn = getConnection();
		int result = nDao.deleteNotice(conn, n_no);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int insertNotice(String n_no) {
		Connection conn = getConnection();
		int result = nDao.insertNotice(conn, n_no);;
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int updateNotice(String n_no) {
		Connection conn = getConnection();
		int result = nDao.updateNotice(conn, n_no);;
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public Notice selectNotice(String n_no) {
		Connection conn = getConnection();
		Notice notice = nDao.selectNotice(conn, n_no);
		
		close(conn);
		
		return notice;
	}

	public ArrayList<Notice> listNotice() {
		Connection conn = getConnection();
		ArrayList<Notice> list = nDao.listNotice(conn);
		
		close(conn);
		
		return list;
	}

}
