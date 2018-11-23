package app.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HelpRepository {

	@Autowired
	SqlSessionTemplate template;

	// 게시물에 쓰는 내용 다 넣기
	public int addAllHelp(Map map) {

		return template.insert("help.addAllHelp", map);
	}

	// 게시물에 따라 페이지 갯수 설정
	public int totalCount() {

		return template.selectOne("help.totalCount");
	}

	
	// 게시물에 들어가는 내용 다 뽑기
	public List<Map> getAllHelp() {

		return template.selectList("help.getAllHelp");
	}
	

	// 이걸 쓸 예정( 페이징 처리때문에 )
	public List<Map> getSomeHelp(Map s) {

		return template.selectList("help.getSomeHelp", s);
	}

	// no로 뽑기
	public Map getOneByNo(int no) {

		return template.selectOne("help.getOneByNo", no);
	}
	
	public int updatelook(int no) {
		
		return template.update("help.updatelook",no);
	}

	public int updateDetail(Map param) {
		
		return template.update("help.updateDetail", param);
	}
}

