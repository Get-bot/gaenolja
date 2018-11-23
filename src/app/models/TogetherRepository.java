package app.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class TogetherRepository {
	@Autowired
	SqlSessionTemplate template;

	//전체 리스 출력
	public List<Map> getAllTogether(){
		return template.selectList("together.getAllTogether");
	}

	//글 올리기
	public int addTogetherBoard(Map map) {
		return template.insert("together.addTogetherBoard",map);
	}
	// 선택한 게시물 출력
	public Map getOneByNo(String no) {
		return template.selectOne("together.getOneByNo",no);
	}
	// 선택한 지역 출력
	public List<Map> getAllByArea(String area) {
		return template.selectList("together.getAllByArea",area);
	}
	// lookup update
	public int updatelookup(String no) {
		return template.update("together.updatelookup",no);
	}
	// good update
	public int updategood(String no) {
		return template.update("together.updategood",no);
	}
	// good ajax
	public Map getGoodByNo(String no) {
		return template.selectOne("together.getGoodByNo",no);
	}

	// 페이지수 개시물에 맞게 페이징처리한 갯수만큼 게시글 내용 뽑기
	public List<Map> getSomeFind(Map s) {
		return template.selectList("together.getSomeFind",s);
	}

	// 게시물에 따라 페이지 갯수 설정
	public int totalCount() {
		return template.selectOne("together.totalCount");
	}

	// 게시물에 따라 페이지 갯수 설정
	public int selectCount(String area) {
		return template.selectOne("together.selectCount",area);
	}

	// 게시물 삭제
	public int deletelist(Map map) {
		return template.delete("together.deletelist",map);
	}


}//end class
