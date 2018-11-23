package app.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ToCommentRepository {
	@Autowired
	SqlSessionTemplate template;

	// 해당 게시물 댓글 불러오기
	public List<Map> getCommentByNo(String cno) {
		return template.selectList("tocomment.getCommentByNo",cno);
	}

	// 해당 게시물 댓글 저장
	public int addComment(Map map) {
		return template.insert("tocomment.addComment",map);
	}

	
}
