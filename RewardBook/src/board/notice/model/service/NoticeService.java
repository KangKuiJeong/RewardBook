package board.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import board.notice.model.dao.NoticeDao;
import board.notice.model.vo.Notice;
import static common.JDBCTemplate.*;

public class NoticeService {
	
	private NoticeDao nDao = new NoticeDao();
	
	public int deleteNotice(String nt_no) {
		Connection conn = getConnection();
		int result = nDao.deleteNotice(conn, nt_no);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int insertNotice(Notice notice, String nt_img, String nt_oc,  String nt_ntevent ) {
		Connection conn = getConnection();
		int result = nDao.insertNotice(conn, notice, nt_img, nt_oc, nt_ntevent);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int updateNotice(Notice notice, String nt_oc, String nt_ntevent) {
		Connection conn = getConnection();
		int result = nDao.updateNotice(conn, notice, nt_oc, nt_ntevent);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public Notice selectNotice(String nt_no) {
		Connection conn = getConnection();
		Notice notice = nDao.selectNotice(conn, nt_no);
		
		close(conn);
		
		return notice;
	}

	public ArrayList<Notice> listNotice(int currentPage, int limit) {
		Connection conn = getConnection();
		ArrayList<Notice> list = nDao.listNotice(conn, currentPage, limit);
		
		close(conn);
		
		return list;
	}

	public int getListCount() {
		Connection conn = getConnection();
		int listCount = nDao.getListCount(conn);
		close(conn);
		return listCount;
	}

	public ArrayList<Notice> SearchNT(String searchbt, String nt_search){
		Connection conn = getConnection();
		ArrayList<Notice> list = nDao.SearchNT(conn, searchbt, nt_search);
		close(conn);
		return list;
	}

}
