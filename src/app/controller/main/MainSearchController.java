package app.controller.main;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import app.models.searchRepository;

@Controller
@RequestMapping("/search")
public class MainSearchController {
	
	
	@Autowired
	searchRepository sr;
	
	
	
	
	@GetMapping("/result.do")
	public ModelAndView mainSearchController(@RequestParam String search) {
		Date d = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");		
		ModelAndView mav = new ModelAndView();		
		
		String[] searchKeyWords = search.split("\\s");	
		
		List searchList = new ArrayList();
		for (int i = 0; i < searchKeyWords.length; i++) {
			 searchList.add("%"+searchKeyWords[i]+"%");			
		}					
		
		List resultFromFind = sr.resultForSearchFromFind(searchList);
		List resultFromParcel = sr.resultForSearchFromParcel(searchList);
		List resultFromDogList = sr.resultForSearchFromDogList(searchList);		
		List resultFromDogTalk = sr.resultForSearchFromDogTalk(searchList);
		List resultFromTogether = sr.resultForSearchFromTogether(searchList);
		List resultFromNboard = sr.resultForSearchFromNboard(searchList);
		List resultFromDogTraining = sr.resultForSearchFromDogTraining(searchList);
		List resultFromDogHospital = sr.resultForSearchFromDogHospital(searchList);
		List resultFromHelp = sr.resultForSearchFromHelp(searchList);
		
		if(resultFromFind.size()!=0) {
			mav.addObject("find",resultFromFind);			
		}
		if(resultFromParcel.size()!=0) {
			mav.addObject("parcel",resultFromParcel);
		}
		if(resultFromDogList.size()!=0) {
			mav.addObject("dogList",resultFromDogList);		
		}
		if(resultFromDogTalk.size()!=0) {
			mav.addObject("dogTalk",resultFromDogTalk);
		}
		if(resultFromTogether.size()!=0) {
			mav.addObject("together",resultFromTogether);
		}
		if(resultFromNboard.size()!=0) {
			mav.addObject("nbaord",resultFromNboard);		
		}
		if(resultFromDogTraining.size()!=0) {
			mav.addObject("dogTraining",resultFromDogTraining);		
		}
		if(resultFromDogHospital.size()!=0) {
			mav.addObject("dogHospital",resultFromDogHospital);		
		}
		if(resultFromHelp.size()!=0) {
			mav.addObject("help",resultFromHelp);		
		}
		
		
		if(resultFromFind.size()==0 && resultFromParcel.size()==0 && resultFromDogList.size()==0 &&
		   resultFromDogTalk.size()==0 && resultFromTogether.size()==0 && resultFromNboard.size() ==0 && resultFromDogTraining.size()==0 && resultFromDogHospital.size()==0 && resultFromHelp.size()==0){
			mav.addObject("noResult", "noResult");
		}
		
		if(resultFromFind.size()!=0 || resultFromParcel.size()!=0 || resultFromDogList.size()!=0 ||
				   resultFromDogTalk.size()!=0 || resultFromTogether.size()!=0 || resultFromNboard.size() !=0  || resultFromDogTraining.size()!=0 ||
				     resultFromDogHospital.size()!=0 || resultFromHelp.size()!=0){
			for (int i = 0; i < searchKeyWords.length; i++) {
				if(sr.getSearched(searchKeyWords[i]).size()==0){
					for (int j = 0; j < searchKeyWords.length; j++) {
						Map map = new HashMap();
						map.put("keyWord", searchKeyWords[i]);
						map.put("count", 1);
						map.put("date", sdf.format(d));		
						sr.addSearch(map);
					}					
				}else {		
					sr.updateSearch(searchKeyWords[i]);
				}
			}
			
		}
		
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/search/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/search/searchResult.jsp");
		mav.addObject("search", search);
		
		return mav;
	}
}
