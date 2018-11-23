package app.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DogtrainingCommentRepository {
	@Autowired
	SqlSessionTemplate template;
	
	//댓글 저장
	public int addcomment(Map param) {
		return template.insert("DCOMMENT.addcomment",param);
	}

	// 게시글 댓글 전부뽑는거
	public List<Map> getCommentByNo(int num){
		return template.selectList("DCOMMENT.getCommentByNo",num);
	}
	
	
	
}//end class
