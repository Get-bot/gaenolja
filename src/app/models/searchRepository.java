package app.models;

import java.util.List;
import java.util.Map;

import org.bson.Document;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicUpdate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

import com.mongodb.client.result.UpdateResult;

@Repository
public class searchRepository {

	@Autowired
	SqlSessionTemplate template;
	
	@Autowired
	MongoTemplate mongoTemplate;
	
	public List<Map> resultForSearchFromDogList(List searchList) {
		return template.selectList("search.resultForSearchFromDogList", searchList);
	}
			
	public List<Map> resultForSearchFromFind(List searchList) {
		return template.selectList("search.resultForSearchFromFind", searchList);
	}
	
	public List<Map> resultForSearchFromParcel(List searchList) {
		return template.selectList("search.resultForSearchFromParcel", searchList);
	}
	
	public List<Map> resultForSearchFromTogether(List searchList) {
		return template.selectList("search.resultForSearchFromTogether", searchList);
	}
	
	public List<Map> resultForSearchFromDogTalk(List searchList) {
		return template.selectList("search.resultForSearchFromDogTalk", searchList);
	}
	
	public List<Map> resultForSearchFromNboard(List searchList) {
		return template.selectList("search.resultForSearchFromNboard", searchList);
	}
	
	public List<Map> resultForSearchFromDogTraining(List searchList) {
		return template.selectList("search.resultForSearchFromDogTraining", searchList);
	}
	
	public List<Map> resultForSearchFromDogHospital(List searchList) {
		return template.selectList("search.resultForSearchFromDogHospital", searchList);
	}	
	
	public List<Map> resultForSearchFromHelp(List searchList) {
		return template.selectList("search.resultForSearchFromHelp", searchList);
	}
	// MongoDB search 테이블
	public Map addSearch(Map map) {
		return mongoTemplate.insert(map,"search");
	}	
	
	public List<Map> getSearch(){		
		return mongoTemplate.findAll(Map.class,"search");		
	}			
	
	public List<Map> getSearched(String search){
			
		return mongoTemplate.find(new Query(Criteria.where("keyWord").is(search)),Map.class, "search");
	}
	
	public void updateSearch(String search) {
		Update u = new Update().inc("count", 1);
		UpdateResult rst =mongoTemplate.updateFirst(new Query(Criteria.where("keyWord").is(search)), u, "search");
		
	}

}
