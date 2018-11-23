package app.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NboardRepository {

	@Autowired
	SqlSessionTemplate template;
	
	// 전체 공지사항 출력
	public List<Map> getAllNboard(){
		return template.selectList("member_board.getAllNboard");
	}//end getAllNboard	
	
	// 글쓰기 저장
	public int addlistBoard(Map map) {
		return template.insert("member_board.addlistBoard",map);
	}
	
	//글 상세보기
	public Map nboardread(int BOARD_NUM) {
		return template.selectOne("member_board.nboardread" , BOARD_NUM);
	}
	
	//글 삭제하기.
	public int nboarddelete(int r) {
		return template.delete("member_board.nboarddelete" , r);
	}
	//페이징처리후 게시글
	public List<Map> getfind(Map s) {
		return template.selectList("member_board.getfind" , s);
	}
	
	//페이지 개수 설정
	public int totalCount() {
		return template.selectOne("member_board.totalCount");
	}
	
	//조회수 
	public int updatelookup(int no) {
		return template.update("member_board.updatelookup" , no);
	}


	

	
	
}

