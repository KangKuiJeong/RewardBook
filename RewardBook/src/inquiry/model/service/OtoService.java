package inquiry.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import inquiry.model.dao.OtoDao;
import inquiry.model.vo.Oto;

public class OtoService {
	
	public OtoService(){}
	
	OtoDao oDao = new OtoDao();
	
	//내가 문의한 글 보기
	public ArrayList<Oto> selectSendList(String u_no) {
		
		Connection conn = getConnection();
		ArrayList<Oto> list = oDao.selectSendlist(conn, u_no);
		close(conn);
		
		return list;
	}

	//내게 문의한 글 보기
	public ArrayList<Oto> selectReceiveSendList(String u_no) {
		
		Connection conn = getConnection();
		ArrayList<Oto> list = oDao.selectReceiveSendList(conn, u_no);
		close(conn);
		
		return list;
		
	}
	
}
