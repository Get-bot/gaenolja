package app.data;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;


@Service
public class dogList {
	List<String> bigDog = new ArrayList<>();
	List<String> medDog = new ArrayList<>();
	List<String> smallDog = new ArrayList<>();
	List<String> allList =  new ArrayList<>();
	
	public dogList() {
		bigDog.add("골든 리트리버");
		bigDog.add("시베리안 허스키");
		bigDog.add("달마시안");
		bigDog.add("콜리");
		bigDog.add("알라스칸 말라뮤트");
		bigDog.add("아프간 하운드");
		bigDog.add("그레이 하운드");
		bigDog.add("이비전 하운드");
		bigDog.add("블러드 하운드");
		bigDog.add("저먼 셰퍼드 도그");
		bigDog.add("쿠바스");
		bigDog.add("도그 드 보르도");
		bigDog.add("포르투갈 워터 도그");
		bigDog.add("복서");
		bigDog.add("그레이트 데인");
		bigDog.add("보르조이");
		bigDog.add("와이머라너");

		medDog.add("비글");
		medDog.add("보스턴 테리어");
		medDog.add("비숑 프리제");
		medDog.add("시바 이누");
		medDog.add("보더콜리");
		medDog.add("도베르만");
		medDog.add("벨기에 시프도그");
		medDog.add("비즐라");
		medDog.add("케이스혼트");			
		
		smallDog.add("페키니즈");
		smallDog.add("치와와");
		smallDog.add("닥스훈트");
		smallDog.add("제페니스 스피츠");
		smallDog.add("말티즈");
		smallDog.add("미니어처 핀셔");
		smallDog.add("포메라니안");
		smallDog.add("파피용");
		smallDog.add("푸들");
		smallDog.add("퍼그");
		smallDog.add("슈나우져");
		smallDog.add("시츄");
		smallDog.add("요크셔테리어");	
		smallDog.add("로첸");		
		
		allList.addAll(bigDog);
		allList.addAll(medDog);
		allList.addAll(smallDog);
	}
	public void addBigDogList (String dogName) {
		bigDog.add(dogName);		
	}
	
	public void addMedDogList(String dogName) {
		medDog.add(dogName);				
	}
	
	public void addSmallDogList(String dogName) {
		smallDog.add(dogName);
	
	}
	
	public List<String> getBigDog() {
		return bigDog;
	}
	
	public List<String> getMedDog() {
		return medDog;
	}
	
	public List<String> getSmallDog() {
		return smallDog;
	}
	
	public List<String> getAllList() {
		return allList;
	}

}
