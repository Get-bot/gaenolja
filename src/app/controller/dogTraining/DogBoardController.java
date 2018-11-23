package app.controller.dogTraining;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import app.data.dogList;
import app.models.dogListRepository;

@Controller
@RequestMapping("/board")
public class DogBoardController {
	@Autowired
	ServletContext ctx;

	@Autowired 
	dogListRepository dr;
	
	@Autowired
	dogList dl;
	
	@GetMapping("/main.do")
	public ModelAndView mainHandle(WebRequest wr) {
		wr.setAttribute("allList", dr.getDogList(), wr.SCOPE_REQUEST);
		wr.setAttribute("bigDogList", dr.getDogListByType(1), wr.SCOPE_REQUEST);
		wr.setAttribute("medDogList", dr.getDogListByType(2), wr.SCOPE_REQUEST);
		wr.setAttribute("smallDogList", dr.getDogListByType(3), wr.SCOPE_REQUEST);
				
	
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/gaekipedia/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/gaekipedia/main.jsp");
		
		return mav;
	
	}
	@GetMapping("/myDog.do")
	public ModelAndView myDogHandle (WebRequest wr) {
		wr.setAttribute("allList", dl.getAllList(), wr.SCOPE_REQUEST);
		wr.setAttribute("bigDogList", dl.getBigDog(), wr.SCOPE_REQUEST);
		wr.setAttribute("medDogList", dl.getMedDog(), wr.SCOPE_REQUEST);
		wr.setAttribute("smallDogList", dl.getSmallDog(), wr.SCOPE_REQUEST);
	
		ModelAndView mav = new ModelAndView();
		mav.setViewName("dogBoard.main");
		mav.addObject("center", "/WEB-INF/views/dogTraining/gajalang.jsp");
		return mav;
	} 
	
	
	@GetMapping("/delete.do")
	public String deleteGetHandle(@RequestParam Map param) {
		System.out.println(param);
		
		System.out.println("deleted? "+dr.deleteDogList(param));
				
		return "redirect:/board/main.do";
	}//end deletehandle
	
	@GetMapping("/add.do")
	public ModelAndView adminDogBoardAddController() {
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/gaekipedia/admin/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/gaekipedia/admin/add.jsp");
		
		return mav;
	}

	
	@PostMapping("/add.do")
	public ModelAndView adminDogBoardAddPostController(@RequestParam Map param,  @RequestParam MultipartFile img) throws IllegalStateException, IOException {
		System.out.println(param);
		
		long time = System.currentTimeMillis();
		String fileName = String.valueOf(time) + "_" + img.getOriginalFilename();
		System.out.println(fileName);
		String path = ctx.getRealPath(String.valueOf(time));
		
		File dir = new File(path);

		if (!dir.exists()) {
			dir.mkdirs();
		}
		File dst = new File(dir, fileName);

		img.transferTo(dst);
		
		String imgName = "/" + time + "/" + fileName;
		param.put("img", imgName);
		
		dr.addDog(param);		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/admin/dogBoard/main.do");	
		mav.addObject("success", true);
		
		return mav;
	}
}

