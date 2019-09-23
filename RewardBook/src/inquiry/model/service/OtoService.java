package inquiry.model.service;

import static common.JDBCTemplate.*;

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
	
	//문의글 등록 Service
	public int insertOto(Oto oto) {
		
		Connection conn = getConnection();
		int result = oDao.insertOto(conn, oto);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}
	
	//내가 문의한글 상세보기
	public Oto detailView(String oto_no) {
		
		Connection conn = getConnection();
		Oto oto = oDao.detailView(conn, oto_no);
		
		close(conn);
		
		return oto;
	}
	
	//나에게 문의한 글 상세보기
	public Oto detailRecieveView(String oto_no) {
		
		Connection conn = getConnection();
		Oto oto = oDao.detailReceiveView(conn, oto_no);
		
		close(conn);
		
		return oto;
	}


}
