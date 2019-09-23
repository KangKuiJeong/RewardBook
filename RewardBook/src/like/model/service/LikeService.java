package like.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import like.model.dao.LikeDao;
import project.model.vo.Project;

public class LikeService {
	
	
	LikeDao ldao = new LikeDao();

	
	//프로젝트 좋아요 목록 조회
	public ArrayList<Project> likeprojectList(String uNo) {
		Connection conn = getConnection();
	      ArrayList<Project> list = ldao.myprojectList(conn, uNo);
	      close(conn);
	      return list;
	}

}
