package app.models;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DogHospitalRepository {

	@Autowired
	SqlSessionTemplate template;
	
	// 특정 지역구 병원 출력
	public List<Map> getDogHospitalByGu(String gu) {
		return template.selectList("hospital.getDogHospitalByGu", gu);
	}
	
	// 전체 좌표뽑기
	public List<Map> getByCoord() {
		return template.selectList("hospital.getByCoord");
	}
	
	// 전체 좌표뽑기
	public List<Map> getByGuCoord(String gu) {
		return template.selectList("hospital.getByGuCoord", gu);
	}
	
	public List<Map> getAllByDogHospital() {
		return template.selectList("hospital.getAllByDogHospital");
	}
	
	public List<Map> getSomeHospital(Map s) {
		return template.selectList("hospital.getSomeHospital", s);
	}
	
	public int getTotalCountByHospital() {
		return template.selectOne("hospital.getTotalCountByHospital");
	}
	
}
