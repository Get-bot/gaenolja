package app.models;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class dogTalkRepository {
	
	@Autowired
	SqlSessionTemplate template;

	public int addDogTalk(Map map) {
		return template.insert("dogTalk.addDogTalk", map);
	}
	
	
	public List<Map> getDogTalk() {
		return template.selectList("dogTalk.getDogTalk");
	}
	

	public List<Map> getSomeFromDogTalk() {
		List some =  template.selectList("dogTalk.getSomeFromDogTalk");	
		List result = new ArrayList();
		for (int i = 0; i < 5; i++) {
			result.add(some.get(i));
		}
		
		return result;
	}
	
}
