package app.controller.help;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import app.models.HelpCommentRepository;
import app.models.HelpRepository;

@Controller
@RequestMapping("/help")
public class HelpController {

	@Autowired
	HelpRepository help;
	
	@Autowired
	HelpCommentRepository helpComment;
 	
	@Autowired
	ServletContext ctx;

	@RequestMapping("/list.do")
	public ModelAndView listHandler(ModelMap mmap, WebRequest wr, @RequestParam(required = false) String p) {
		Date day = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(day);

		mmap.put("today", today);
		//---------------------------
		Map map = new HashMap();
		int pp = (p == null) ? 1 : Integer.parseInt(p);
		
		mmap.put("current", pp);
		map.put("s", 1 + (pp - 1) * 10);
		map.put("e", pp * 10);
		List<Map> list = help.getSomeHelp(map);
		mmap.put("list", list);
		//---------------------------

		int tot = help.totalCount();
		mmap.put("size", tot/10 + (tot%10>0 ? 1: 0));
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/help/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/help/list.jsp");

		return mav;
	}

	@GetMapping("/write.do")
	public ModelAndView writeHandler() {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/help/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/help/write.jsp");

		return mav;
	}

	@PostMapping("/write.do")
	public ModelAndView addHandler(@RequestParam Map rmap, ModelMap mmap, WebRequest wr,
			@RequestParam MultipartFile inputfile1, @RequestParam MultipartFile inputfile2)
			throws IOException, InterruptedException {

		//날짜 설정
		Date d = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		rmap.put("regdate", sdf.format(d));
		
		// 파일 첨부
		long time = System.currentTimeMillis();
		String fileName1 = String.valueOf(time) + "_" + inputfile1.getOriginalFilename();
		Thread.sleep(50);
		String fileName2 = String.valueOf(time) + "_" + inputfile2.getOriginalFilename();
		String path = ctx.getRealPath(String.valueOf(time));

		File dir = new File(path);

		if (!dir.exists()) {
			dir.mkdirs();
		}

		if (!inputfile1.isEmpty()) {
			File dst1 = new File(dir, fileName1);
			inputfile1.transferTo(dst1);
			String file1 = "/" + time + "/" + fileName1;
			rmap.put("inputfile1", file1);
		}

		if (!inputfile2.isEmpty()) {
			File dst2 = new File(dir, fileName2);
			inputfile2.transferTo(dst2);
			String file2 = "/" + time + "/" + fileName2;
			rmap.put("inputfile2", file2);
		}

		Map userInfo = (Map) wr.getAttribute("userInfo", WebRequest.SCOPE_SESSION);
		String nick = (String) userInfo.get("NICKNAME");

		rmap.put("nick", nick);

		ModelAndView mav = new ModelAndView();		
		try {
			int i = help.addAllHelp(rmap);
			mmap.put("map", rmap);
			
			mav.setViewName("redirect:/help/list.do");
			
			return mav;			

		} catch (Exception e) {
			e.printStackTrace();

			mav.setViewName("redirect:/help/write.do");
			
			return mav;	
		}
	}

	@GetMapping("/detail.do")
	public ModelAndView detailGetHandler(@RequestParam(required = false) int no, ModelMap mmap, WebRequest wr) {
		Date day = new Date();
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf1.format(day);
		
		//wr.setAttribute("today", today, WebRequest.SCOPE_REQUEST);
		
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		//String now = sdf2.format(day);
		//mmap.put("regdate", now);
		//---------------------------
		
		help.updatelook(no);
		
		//------------------------------------------
		
		Map userInfo = (Map)wr.getAttribute("userInfo", wr.SCOPE_SESSION);
			mmap.put("info", userInfo);
		
		Map data = help.getOneByNo(no);
			data.put("GADAY", today);
			mmap.put("data", data);
			
		wr.setAttribute("data",data, wr.SCOPE_REQUEST);
		List<Map> comment = helpComment.getCommentByHno(no);
		
	
		for (int i = 0; i < comment.size(); i++) {
			comment.get(i).put("GACOMDAY", sdf2.format(comment.get(i).get("REGDATE")) );
			
		}
		System.out.println("comment>"+comment);
		wr.setAttribute("no",no, wr.SCOPE_REQUEST);
		wr.setAttribute("comment",comment , wr.SCOPE_REQUEST);

		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/help/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/help/detail.jsp");

		return mav;
	}

	@PostMapping("/detail.do")
	public String detailPostHandler(WebRequest wr, @RequestParam Map rmap, ModelMap mmap) {
		Map userInfo = (Map)wr.getAttribute("userInfo", wr.SCOPE_SESSION);
				
		String nick = (String) userInfo.get("NICKNAME");
		
		int no = Integer.parseInt((String) rmap.get("no"));
		
		//-------------
		Date d = new Date();
		
		System.out.println("hno >"+no);
		System.out.println("reply >"+rmap.get("comment"));
		System.out.println("regdate >"+d);
		System.out.println("nick >"+nick);
		
		//---------------
		Map map = new HashMap<>();
			map.put("hno",no);
			map.put("reply", rmap.get("comment"));
			map.put("regdate",d);
			map.put("nick", nick);
		
		helpComment.addHelpComment(map);
		
		return "redirect:/help/detail.do?no="+no;
		
	}//end detailPost
	
	// 수정할 게시판 내용 추출
	@RequestMapping("/detailModify.do")
	public ModelAndView getDetailModify(@RequestParam int no, ModelMap mmap, WebRequest wr) {
		Map userInfo = (Map)wr.getAttribute("userInfo", wr.SCOPE_SESSION);	
		Map data = help.getOneByNo(no);
			mmap.put("data", data);
			mmap.put("no", no);

		ModelAndView mav = new ModelAndView();
			
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/help/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/help/detailModify.jsp");
		
		return mav;
	}
	
	// 게시판 수정 후 업데이트
	@RequestMapping("/updateDetail.do")
	public ModelAndView updateDetail(@RequestParam Map rmap, ModelMap mmap, WebRequest wr) {
		Map userInfo = (Map)wr.getAttribute("userInfo", wr.SCOPE_SESSION);
			String id = (String)userInfo.get("ID");
			rmap.put("nick", id);		
		
		ModelAndView mav = new ModelAndView();
		
		try {
			int r = help.updateDetail(rmap);
			mmap.put("map", rmap);
	
			mav.setViewName("redirect:/help/list.do");	
			
			return mav;
			
		}catch(Exception e) {
			e.printStackTrace();
			
			mav.setViewName("master");
			mav.addObject("top", "/WEB-INF/views/master/help/top.jsp");
			mav.addObject("main", "/WEB-INF/views/master/help/write.jsp");	
			return mav;
		}
		
	}
	
	
	
}//end class
