package app.controller.Nboard;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import app.models.NboardRepository;

@Controller
@RequestMapping("/Nboard")
public class NboardController {


	private static final String Allboard = null;
	private static final String Nboard = null;
	private static final String ID = null;
	@Autowired
	NboardRepository nr;

	// 공지사항 이동
	@GetMapping("/list.do")
	public ModelAndView NboardHandler(WebRequest wreq,ModelMap mmap ,@RequestParam(required=false)Map param) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		int pp = (param.get("p") == null) ? 1: Integer.parseInt((String)param.get("p"));
		
		Map map = new HashMap(); 
			map.put("s", 1+(pp-1)*6);
			map.put("e", pp * 6);

		int tot  = nr.totalCount();

		List<Map> every =nr.getfind(map);
		
		System.out.println("every > "+every);

		for (int i = 0; i < every.size(); i++) {
			every.get(i).put("BOARD_DAY", sdf.format(every.get(i).get("BOARD_DATE")));
		}


		mmap.put("every", every);
		mmap.put("size", tot/6 + (tot%6>0 ? 1: 0));
		mmap.put("current", pp);




		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/Nboard/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/Nboard/list.jsp");

		return mav;


	}//end NboardHandle

	//글쓰기
	@GetMapping("/write.do")
	public ModelAndView writeGetHandle() {	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/Nboard/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/Nboard/write.jsp");

		return mav;
	}//end getwrite

	//글쓰고 저장
	@PostMapping("/write.do")
	public ModelAndView addlistBoard(@RequestParam Map map , WebRequest wreq) {
		Map userInfo = (Map)wreq.getAttribute("userInfo", RequestAttributes.SCOPE_SESSION);
		System.out.println("userInfo > "+userInfo);
		String target = (String)userInfo.get("ID");
		String sub = (String)map.get("BOARD_SUBJECT");
		String con = (String)map.get("BOARD_CONTENT");
		Date day = new Date();
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");


		System.out.println("userinfo >" + userInfo);
		System.out.println("sub > " + sub);
		System.out.println("target >"+target);
		System.out.println("day >"+sdf);



		Map m = new HashMap<>();
		m.put("BOARD_ID" , target);
		m.put("BOARD_SUBJECT", sub);
		m.put("BOARD_CONTENT", con);
		m.put("BOARD_DATE", sdf.format(day));


		System.out.println("정보 >>>" + m);


		try {
			int result=nr.addlistBoard(m);
			System.out.println("result >" + result);
			if (result==1) {
				wreq.setAttribute("result",result, WebRequest.SCOPE_REQUEST);

				ModelAndView mav = new ModelAndView();
				mav.setViewName("redirect:/Nboard/list.do");

				return mav;
			}else {
				ModelAndView mav = new ModelAndView();
				wreq.setAttribute("result",result, WebRequest.SCOPE_REQUEST);
				mav.setViewName("master");
				mav.addObject("top", "/WEB-INF/views/master/Nboard/top.jsp");
				mav.addObject("main", "/WEB-INF/views/master/Nboard/list.jsp");

				return mav;
			}
		}  catch (Exception e) {
			e.printStackTrace();
			wreq.setAttribute("result","no", WebRequest.SCOPE_REQUEST);

		}
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/Nboard/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/Nboard/list.jsp");

		return mav;

	}//end write


	//글 삭제하기.
	@RequestMapping("delete.do")
	public String nboarddelete(@RequestParam Map param, WebRequest wreq ) {
		System.out.println("param >" + param);

		String no = (String) param.get("no");

		int r=nr.nboarddelete(Integer.parseInt(no));
		return "redirect:/Nboard/list.do?p=1";
	}



	//글 목록 클릭해서 디테일
	@GetMapping("/detail.do")
	public ModelAndView nboardread(@RequestParam int BOARD_NUM ,WebRequest wreq, Map map) {
		// 조회수
		nr.updatelookup(BOARD_NUM);

		Map read =nr.nboardread(BOARD_NUM);		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		read.put("BOARD_DATE", sdf.format(read.get("BOARD_DATE")));
		wreq.setAttribute("read",read, WebRequest.SCOPE_REQUEST);



		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/Nboard/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/Nboard/detail.jsp");

		return mav;
	} //end getRead


}

