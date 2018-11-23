package app.models;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class dogListRepository {
	@Autowired
	SqlSessionTemplate template;

	// 강아지 리스트에 추가
	public int addDog(Map map) {
		return template.insert("dogList.addDog", map);
	}
	
	// 리스트 전부 뽑는거
	public List<Map> getDogList() {
		return template.selectList("dogList.getDogList");
	}
	
	// 종류별 데이터 뽑는거
	public List<Map> getDogListByType(Integer n) {
		return template.selectList("dogList.getDogListByType", n);
	}
	
	public int deleteDogList(Map map) {
		return template.delete("dogList.deleteDogList",map);
	}
}
