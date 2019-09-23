package memo.model.service;
import java.sql.Connection;
import static common.JDBCTemplate.*;
import memo.model.dao.MemoDao;
import memo.model.vo.Memo;

public class MemoService {
	
	private MemoDao dDao = new MemoDao();
	
	public MemoService() {}

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

}
