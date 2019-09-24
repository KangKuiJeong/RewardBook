package memo.model.service;
import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import memo.model.dao.MemoDao;
import memo.model.vo.Memo;

public class MemoService {
	
	private MemoDao dDao = new MemoDao();
	
	public MemoService() {}
	public ArrayList<Memo> listMemo(){
		Connection conn = getConnection();
		ArrayList<Memo> list = dDao.listMEMO(conn);
				
		close(conn);
		return list;
	}
	public int updateMemo(Memo memo) {
		Connection conn = getConnection();
		int result = dDao.updateMemo(conn, memo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	public int insertMemo(Memo memo) {
		Connection conn = getConnection();
		int result = dDao.insertMemo(conn, memo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	public Memo selectMemo(String p_no) {
		Connection conn = getConnection();
		Memo memo = dDao.selectMemo(conn, p_no);
		
		close(conn);
		
		return memo;
	}
	public int deleteMemo(String p_no) {
		Connection conn = getConnection();
		int result = dDao.deleteMemo(conn, p_no);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

}
