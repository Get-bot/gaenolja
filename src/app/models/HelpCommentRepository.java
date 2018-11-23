package app.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HelpCommentRepository {

	@Autowired 
	SqlSessionTemplate template;
	
	public int addHelpComment(Map map) {
		
		return template.insert("helpcomment.addHelpComment", map);
	}
	public List<Map> getCommentByHno(int hno){
		
		return template.selectList("helpcomment.getCommentByHno", hno);
	}
	
	public List<Map> getAllComment(){
		return template.selectList("helpcomment.getAllComment");
	}
}
