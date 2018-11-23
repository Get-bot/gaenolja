package app.controller.test;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import app.data.dogList;
import app.models.ParcelRepository;
import app.models.ToCommentRepository;
import app.models.TogetherRepository;
import app.models.dogListRepository;
import app.models.dogTalkRepository;

@Controller
@RequestMapping("/test")
public class testIndexController {
	@Autowired
	dogTalkRepository dtr;
	
	@Autowired 
	dogListRepository dr;
	
	@Autowired
	dogList dl;
	@Autowired
	ParcelRepository parcelRepository;
	
	@Autowired
	TogetherRepository together;
	@Autowired
	ToCommentRepository tocomment;	

	@GetMapping("/main/index.do")
	public ModelAndView mainIndexController() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test.main.index");
		mav.addObject("top", "/WEB-INF/views/testfiles/mainTop.jsp");
		mav.addObject("main", "/WEB-INF/views/testfiles/main.jsp");
				
		
		return mav;
	}
	
	@GetMapping("/main/Nboard.do")
	public ModelAndView mainNboardController() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test.main.index");
		mav.addObject("top", "/WEB-INF/views/testfiles/NboardTop.jsp");
		mav.addObject("main", "/WEB-INF/views/testfiles/main.jsp");
		
		return mav;
	}
	
	@GetMapping("/main/dogTalk.do")
	public ModelAndView maindogTalkController() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test.main.index");
		mav.addObject("top", "/WEB-INF/views/testfiles/dogTalkTop.jsp");
		mav.addObject("main", "/WEB-INF/views/testfiles/dogTalk.jsp");
		
		return mav;
	}
	
	@GetMapping("/main/login.do")
	public ModelAndView mainLoginController() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test.login");		
		mav.addObject("main", "/WEB-INF/views/testfiles/login.jsp");
		
		return mav;
	}
	
	@GetMapping("/main/terms.do")
	public ModelAndView mainJoinController() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test.main.index");		
		mav.addObject("top", "/WEB-INF/views/testfiles/joinAd.jsp");
		mav.addObject("main", "/WEB-INF/views/testfiles/terms.jsp");
		
		return mav;
	}
	
	@GetMapping("/main/joinForm.do")
	public ModelAndView mainJoinFormController() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test.main.index");		
		mav.addObject("top", "/WEB-INF/views/testfiles/joinAd.jsp");
		mav.addObject("main", "/WEB-INF/views/testfiles/joinFrom.jsp");
		
		return mav;
	}
	
	
	@GetMapping("/main/dogBoard.do")
	public ModelAndView mainDogBoardController(WebRequest wr) {
		wr.setAttribute("allList", dr.getDogList(), wr.SCOPE_REQUEST);
		wr.setAttribute("bigDogList", dr.getDogListByType(1), wr.SCOPE_REQUEST);
		wr.setAttribute("medDogList", dr.getDogListByType(2), wr.SCOPE_REQUEST);
		wr.setAttribute("smallDogList", dr.getDogListByType(3), wr.SCOPE_REQUEST);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test.main.index");		
		mav.addObject("top", "/WEB-INF/views/testfiles/dogBoardTop.jsp");
		mav.addObject("main", "/WEB-INF/views/testfiles/dogBoard.jsp");
		
		return mav;
	}	
			
	@GetMapping("/main/dogTalk/index.do")
	public ModelAndView mainDogTalkController(WebRequest wr) {
		wr.setAttribute("dogTalkList", dtr.getDogTalk(), wr.SCOPE_REQUEST);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test.main.index");		
		mav.addObject("top", "/WEB-INF/views/testfiles/dogTalkTop.jsp");
		mav.addObject("main", "/WEB-INF/views/testfiles/dogTalk.jsp");
		
		return mav;
	}
		
	
	@RequestMapping("/main/percel/index.do")
	public ModelAndView getAllByPercel() {
		List<Map> list = parcelRepository.getAllByParcel();
		
				
		ModelAndView mav = new ModelAndView();
		mav.setViewName("test.main.index");		
		mav.addObject("top", "/WEB-INF/views/testfiles/parcelTop.jsp");
		mav.addObject("main", "/WEB-INF/views/testfiles/parcel.jsp");
		mav.addObject("list", list);
		
		return mav;
	}
	
	

	@GetMapping("/main/together/index.do")
	public ModelAndView mainboard(WebRequest wreq,@RequestParam Map param) {
		String re=(String)wreq.getAttribute("result",WebRequest.SCOPE_REQUEST);
		if (re=="on") {
			wreq.setAttribute("result","yes",WebRequest.SCOPE_REQUEST);
		}
		//------------------------------------------------
		List<Map> list=together.getAllTogether();
		System.out.println("list > "+list);

		List<Map> li = new ArrayList<>();

		SimpleDateFormat sdf= new SimpleDateFormat("MM-dd");

		for (int i = 0; i < list.size(); i++) {
			Map map = new HashMap<>();
			map.put("NO", list.get(i).get("NO"));
			map.put("AREA", list.get(i).get("AREA"));
			map.put("TITLE", list.get(i).get("TITLE"));
			map.put("DAY", sdf.format(list.get(i).get("DAY")));
			map.put("GOOD", list.get(i).get("GOOD"));
			map.put("LOOKUP", list.get(i).get("LOOKUP"));
			map.put("LATITUDE", list.get(i).get("LATITUDE"));
			map.put("LONGITUDE", list.get(i).get("LONGITUDE"));
			li.add(map);
		}
		System.out.println("li > "+li);
		wreq.setAttribute("list",li, WebRequest.SCOPE_REQUEST);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("test.main.index");		
		mav.addObject("top", "/WEB-INF/views/testfiles/togetherTop.jsp");
		mav.addObject("main", "/WEB-INF/views/testfiles/together.jsp");		
		
		return mav;
	}
		
}
