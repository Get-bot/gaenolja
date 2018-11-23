package app.models;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ParcelRepository {

	@Autowired
	SqlSessionTemplate template;
	
	// 게시글 작성하는거
	public int addByParcel(Map param) {
		return template.insert("parcel.addByParcel", param);
	}
	
	// 게시글 전부 뽑는거
	public List<Map> getAllByParcel() {
		return template.selectList("parcel.getAllByParcel");
	}
	
	// 특정 게시글 데이터 뽑는거
	public Map getByOneParcel(int no) {
		return template.selectOne("parcel.getByOneParcel", no);
	}
	
	// 댓글 저장하는거
	public int addByComments(Map param) {
		return template.insert("comments.addByComments", param);
	}
	
	// 특정 게시글 댓글 전부 뽑는거(오름차순)
	public List<Map> getAllByComments(int ino) {
		return template.selectList("comments.getAllByComments", ino);
	}
		
	// 리댓글 저장하는거
	public int addByReComments(Map param) {
		return template.insert("recomments.addByReComments", param);
	}
	
	// 특정 댓글의 리댓글 내용 뽑는거
	public List<Map> getAllByReComments(String code) {
		return template.selectList("recomments.getAllByReComments", code);
	}
	
	// 댓글의 리댓글 카운트 뽑는거
	public List<Map> getByCmtCount(int no) {
		return template.selectList("comments.getByCmtCount", no);
	}

	// 특정 게시글 수정
	public int updateDetail(Map param) {
		return template.update("parcel.updateDetail", param);
	}
	
	//페이징 갯수만큼 게시글 내용 뽑기
	public List<Map> getSomeParcel(Map s) {
		return template.selectList("parcel.getSomeParcel",s);
	}
	
	// 게시글 수
	public int getTotalCountByParcel() {
		return template.selectOne("parcel.getTotalCountByParcel");
	}

}
