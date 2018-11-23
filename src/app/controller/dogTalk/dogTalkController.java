package app.controller.dogTalk;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import app.models.dogTalkRepository;

@Controller
@RequestMapping("/dogTalk")

public class dogTalkController {
	
	@Autowired
	dogTalkRepository dtr;
	
	@Autowired
	Gson gson;
	
	@GetMapping("/index.do")
	public ModelAndView indexController(WebRequest wr) {
		wr.setAttribute("dogTalkList", dtr.getDogTalk(), wr.SCOPE_REQUEST);
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/dogTalk/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/dogTalk/main.jsp");
		
		return mav;
	}
	
	@GetMapping(path="/add.do", produces="application/json;charset=UTF-8")	
	@ResponseBody
	public String addController(@RequestParam Map param) {		
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String writedate = sdf.format(today);
		
		String paramAddress = (String)param.get("address");
		String[] array = paramAddress.split(" ");
		param.put("address", array[0]+array[1]+"에서");
		param.put("writedate", writedate);
		
		
		System.out.println(param);
		dtr.addDogTalk(param);
		
		
		
		return gson.toJson(dtr.getDogTalk());
	}
}
