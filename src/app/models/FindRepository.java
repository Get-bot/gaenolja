
package app.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FindRepository {

	@Autowired
	SqlSessionTemplate template;

	// 게시글 작성(전부 넣기)
	public int addAllFind(Map map) {
		return template.insert("find.addAllFind", map);
	}

	
	// 모든 게시글 내용 뽑기
	public List<Map> getAllFind() {
		return template.selectList("find.getAllFind");
	}
	

	// 페이지수 개시물에 맞게 페이징처리한 갯수만큼 게시글 내용 뽑기
	public List<Map> getSomeFind(Map s) {
		return template.selectList("find.getSomeFind",s);
	}

	// no로 데이터 뽑기
	public Map getByNo(int no) {
		return template.selectOne("find.getOneByNo", no);
	}
	
	public List<Map> getRecentFind(){
		return template.selectList("find.getRecentFind");		
	}
	
	public int updateDetail(Map rmap) {
		return template.update("find.updateDetail", rmap);
	}

	// 게시물에 따라 페이지 갯수 설정
	public int totalCount() {

		return template.selectOne("find.totalCount");
	}
}