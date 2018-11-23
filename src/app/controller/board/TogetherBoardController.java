package app.controller.board;


import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import app.models.ToCommentRepository;
import app.models.TogetherRepository;

@Controller
@RequestMapping("/together")
public class TogetherBoardController {
	@Autowired
	TogetherRepository together;
	@Autowired
	ToCommentRepository tocomment;
	@Autowired
	Gson gson;
	

	@GetMapping("/mainboard.do")
	public ModelAndView mainboard(WebRequest wreq,@RequestParam(required=false) Map param) {
		if(param.get("result")!=null) {
			if (param.get("result").equals("on")) {
				wreq.setAttribute("err", "on", wreq.SCOPE_REQUEST);
			}			
		}
		//-------------------------------------------------
		int rp =  (param.get("p") == null) ? 1 : Integer.parseInt((String)param.get("p"));
		System.out.println("rp>"+rp);
		Map mp = new HashMap<>();
			mp.put("s", 1 + ( rp - 1 ) * 10 );
			mp.put("e", rp * 10 );
		
		int total=together.totalCount();
		wreq.setAttribute("size",total/10 + (total%10>0 ? 1: 0),WebRequest.SCOPE_REQUEST);
		wreq.setAttribute("current",rp,WebRequest.SCOPE_REQUEST);
		//------------------------------------------------
		List<Map> list = together.getSomeFind(mp);				
		List<Map> li = new ArrayList<>();
		//================================================
		SimpleDateFormat sdf= new SimpleDateFormat("MM-dd");
		for (int i = 0; i < list.size(); i++) {
			Map map = new HashMap<>();
			map.put("NO", list.get(i).get("NO"));
			map.put("AREA", list.get(i).get("AREA"));
			map.put("TITLE", list.get(i).get("TITLE"));
			map.put("NICK", list.get(i).get("NICK"));
			map.put("DAY", sdf.format(list.get(i).get("DAY")));
			map.put("GOOD", list.get(i).get("GOOD"));
			map.put("LOOKUP", list.get(i).get("LOOKUP"));
			map.put("LATITUDE", list.get(i).get("LATITUDE"));
			map.put("LONGITUDE", list.get(i).get("LONGITUDE"));
			
			li.add(map);
		}
		
		wreq.setAttribute("list",li, WebRequest.SCOPE_REQUEST);
		
		ModelAndView mav = new ModelAndView();	
		
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/together/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/together/mainboard.jsp");		
		
		return mav;		
	}//end mainboard

	@RequestMapping("/selectboard.do")
	public ModelAndView selsctboard(@RequestParam(required=false) Map param,WebRequest wreq) {
		String area=(String)param.get("area");
		List<Map> list=together.getAllByArea(area);
		
		List<Map> li = new ArrayList<>();
		SimpleDateFormat sdf =new SimpleDateFormat("MM:dd");
		
		for (int i = 0; i < list.size(); i++) {
			String day=sdf.format(list.get(i).get("DAY"));
			list.get(i).put("day",day);
		}
		int pp = (param.get("p") == null) ? 1 : Integer.parseInt((String)param.get("p"));
		
		Map mp = new HashMap<>();
			mp.put("s", 1 + ( pp - 1 ) * 6 );
			mp.put("e", pp * 6 );
		
		int total=together.selectCount((String)param.get("area"));
		wreq.setAttribute("size",total/6 + (total%6>0 ? 1: 0),WebRequest.SCOPE_REQUEST);
		wreq.setAttribute("current",pp,WebRequest.SCOPE_REQUEST);
		
		

		wreq.setAttribute("list", list, WebRequest.SCOPE_REQUEST);		
		wreq.setAttribute("area", param.get("area"), WebRequest.SCOPE_REQUEST);		
		
		ModelAndView mav = new ModelAndView();	
		
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/together/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/together/selectboard.jsp");		
		
		return mav;		
	}//end selectboard

	@GetMapping("/new.do")
	public ModelAndView newGetboard(@RequestParam Map param,WebRequest wreq) {
		if(param.get("result")!=null) {
			if (param.get("result").equals("off")) {
				wreq.setAttribute("err", "off", wreq.SCOPE_REQUEST);
				ModelAndView mav = new ModelAndView();
				mav.setViewName("master");
				mav.addObject("top", "/WEB-INF/views/master/together/top.jsp");
				mav.addObject("main", "/WEB-INF/views/master/together/new.jsp");		
				return mav;
			}			
		}
		//=====================================================
		ModelAndView mav = new ModelAndView();	
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/together/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/together/new.jsp");
		return mav;	
	}//end new


	@PostMapping("/new.do")
	public String newPostboard(@RequestParam Map map,WebRequest wreq) {
		Map info=(Map)wreq.getAttribute("userInfo", wreq.SCOPE_SESSION);
		String nick=(String)info.get("NICKNAME");
		String d=(String)map.get("day");
		String t =(String) map.get("time");		
		
		String total = d+" "+t;
		
		Map m = new HashMap<>();
		m.put("title", map.get("title"));
		m.put("content", map.get("content"));
		m.put("day", total);
		m.put("area", map.get("area"));
		m.put("latitude", map.get("latitude"));
		m.put("longitude", map.get("longitude"));
		m.put("address", map.get("address"));
		m.put("nick", nick);
	                                                                                                                                                                                                                                                       
			
		try {
			int result=together.addTogetherBoard(m);
			if (result==1) {			
				return "redirect:/together/mainboard.do?result=on";
			}else {			
				return "redirect:/together/new.do?result=off"; 	
			}
		} catch (Exception e) {
			e.printStackTrace();
			return "redirect:/together/new.do?result=off";
		}


	}//end new
	
	@GetMapping("/detail.do")
	public ModelAndView detailHandle(@RequestParam Map map,WebRequest wreq) {
		Map info=(Map)wreq.getAttribute("userInfo", wreq.SCOPE_SESSION);
		String no = (String)map.get("no");
		String nick=(String)info.get("NICKNAME");
		// lookup
		int t = together.updatelookup(no);
		// detail view
		Map target=together.getOneByNo(no);
		// detail comment
		List<Map> comment = tocomment.getCommentByNo(no);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
		for (int i = 0; i < comment.size(); i++) {
			String day=sdf.format(comment.get(i).get("LEFTDATE"));
			comment.get(i).put("day",day);
		}
		
		wreq.setAttribute("comment", comment, WebRequest.SCOPE_REQUEST);
		wreq.setAttribute("list", target, WebRequest.SCOPE_REQUEST);
		
		ModelAndView mav = new ModelAndView();	
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/together/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/together/detail.jsp");		
		
		return mav;	
	}//end detail

	@GetMapping("/map2.do")
	public String map2GetHandle() {
		return "together.board/map2";
	}//end map2


	
	@PostMapping("/detail.do")
	public String detailPostHandle(@RequestParam Map param,WebRequest wreq) {
		Map info=(Map)wreq.getAttribute("userInfo", wreq.SCOPE_SESSION);
		
		String nick=(String)info.get("NICKNAME");
		String comment = (String)param.get("comment");
		String cno=(String)param.get("no");
		Date leftdate = new Date();
		
		Map input = new HashMap<>();
			input.put("cno", cno);
			input.put("ment", comment);
			input.put("leftdate", leftdate);
			input.put("nick", nick);
			
		tocomment.addComment(input);
			
		return "redirect:/together/detail.do?no="+cno;
			
	}//end detail.do
	
	@GetMapping("ajax.do")
	@ResponseBody
	public String ajaxHandle(@RequestParam Map param) {
		String no = (String)param.get("no");
				
		String mode = (String)param.get("mode");
		if (mode.equals("good")) {
			int result= together.updategood(no);
			Map goodajax=together.getGoodByNo(no);
			return gson.toJson(goodajax); 
		}
		return "";
	}//end ajax.do
	
	@GetMapping("/delete.do")
	public String deleteGetHandle(@RequestParam Map param) {
		
		Map input = new HashMap<>();
			input.put("no", param.get("no"));
		
		together.deletelist(input);
				
		return "redirect:/together/mainboard.do";
	}//end deletehandle
	
	
}
