package app.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class dogtrainingRepository{

	@Autowired
	SqlSessionTemplate template;

	//전체 리스트 출력
	public List<Map> getAll(){
		return template.selectList("dogtraining.getAll");
	} // end getAlldt

	//글 상세보기
	public Map getlistByNo(int no) {
		return template.selectOne("dogtraining.getlistByNo", no);
	} // end readdt

	// 글쓰기 저장
	public int addlist(Map map) {
		return template.insert("dogtraining.addlist",map);
	}

	// 조회수 늘리기
	public int updatelookup(int no) {
		return template.update("dogtraining.updatelookup",no);
	}

	// 페이지수 개시물에 맞게 페이징처리한 갯수만큼 게시글 내용 뽑기
	public List<Map> getSomeFind(Map s) {
		return template.selectList("dogtraining.getSomeFind",s);
	}

	// 게시물에 따라 페이지 갯수 설정
	public int totalCount() {
		return template.selectOne("dogtraining.totalCount");
	}
	// 게시물 삭제
	public int deletelist(Map map) {
		return template.delete("dogtraining.deletelist",map);
	}

	



}//end class




