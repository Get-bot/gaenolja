package app.controller.dogTraining;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.Servlet;
import javax.servlet.ServletContext;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.SystemEnvironmentPropertySource;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import app.models.DogtrainingCommentRepository;
import app.models.dogtrainingRepository;

@Repository
@RequestMapping("/dogTraining")
public class dogTrainingController {
	@Autowired
	ServletContext ctx;
	
	@Autowired
	Gson gson;

	//게시판 DAO
	@Autowired
	dogtrainingRepository dr;
	
	//comment DAO
	@Autowired
	DogtrainingCommentRepository dc;

	//리스트 불러오기
	@GetMapping("training.do")
	public ModelAndView dtboardHandler(WebRequest wreq,@RequestParam(required=false) Map param) {
		if(param.get("type")!=null) {
			if (param.get("type").equals("on")) {
				wreq.setAttribute("err", "off", wreq.SCOPE_REQUEST);
			}			
		}
		//-------------------------------------------------
		// 페이징 처리

		int rp = (param.get("p") == null) ? 1 : Integer.parseInt((String)param.get("p"));
		Map mp = new HashMap<>();
			mp.put("s", 1 + ( rp - 1 ) * 6 );
			mp.put("e", rp * 6 );
		
		int total = dr.totalCount();
		
		wreq.setAttribute("current", rp, wreq.SCOPE_REQUEST);
		wreq.setAttribute("size", total/6 + (total%6>0 ? 1: 0), wreq.SCOPE_REQUEST);	
			
		
		//-------------------------------------------------
		//List<Map> getAlldt = dr.getAll();
		List<Map> getAlldt = dr.getSomeFind(mp);	
		wreq.setAttribute("list", getAlldt, WebRequest.SCOPE_REQUEST);

		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/dogTraining/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/dogTraining/main.jsp");
		return mav;
		
		
	} // end training.do

	//글 목록 클릭해서 디테일
	@GetMapping("/detail.do")
	public ModelAndView readdt(@RequestParam int no,WebRequest wreq) {		
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd HH:mm");
		//detail view 내용
		Map read =dr.getlistByNo(no);
		read.put("UPDAY", sdf.format(read.get("DAY")));
		wreq.setAttribute("read",read, wreq.SCOPE_REQUEST);
		//detail comment
		List<Map> comment = dc.getCommentByNo(no);
		for (int i = 0; i < comment.size(); i++) {
			comment.get(i).put("UPDAY", sdf.format(comment.get(i).get("CDATE")));
		}
		wreq.setAttribute("comment",comment, wreq.SCOPE_REQUEST);
		// 조회수 늘리기
		dr.updatelookup(no);
		
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/dogTraining/emptytop.jsp");
		mav.addObject("main", "/WEB-INF/views/master/dogTraining/detail.jsp");


		return mav;
	} //end dtboardread
	
	@PostMapping("/detail.do")
	public String detailPostHandle(@RequestParam Map param,WebRequest wreq) {
		Map userInfo = (Map)wreq.getAttribute("userInfo", RequestAttributes.SCOPE_SESSION);
		
		String id = (String)userInfo.get("ID");
		
		System.out.println("pa~ram >>"+param+"/id>"+id);
		
		Map input = new HashMap<>();
			input.put("num", param.get("no"));
			input.put("id", id);
			input.put("content", param.get("content"));
		Date cdate = new Date();
			input.put("cdate", cdate);
			
		int result = dc.addcomment(input);
		
		return "redirect:/dogTraining/detail.do?no="+param.get("no");

		
	}//end postdetail
	

	//글쓰기
	@GetMapping("/write.do")
	public ModelAndView writeHandle(@RequestParam Map param,WebRequest wreq) {	
		if(param.get("type")!=null) {
			if (param.get("type").equals("off")) {
				wreq.setAttribute("err", "on", wreq.SCOPE_REQUEST);
			}			
		}
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/dogTraining/emptytop.jsp");
		mav.addObject("main", "/WEB-INF/views/master/dogTraining/write.jsp");
		return mav;
	}//end dttwrite

	//글쓰고 저장
	@PostMapping("/write.do")
	public String addwritePostHandle(@RequestParam Map param , WebRequest wreq,@RequestParam MultipartFile attach)
		throws IOException{
	
		System.out.println("type >"+attach.getContentType());
		String[] type=attach.getContentType().split("/");
		
		if (!type[0].equals("video")) {
			return "redirect:/dogTraining/write.do?type=off";	
		}else {
			String filename = attach.getOriginalFilename();
			String ext = "."+FilenameUtils.getExtension(filename);
			
			String path=ctx.getRealPath("gaevideo");
			System.out.println("path >>"+path);
			
			long gg = new Date(System.currentTimeMillis()).getTime();
			
			File f = new File(path,gg+ext);
			
			if (!f.exists()) {
				f.mkdirs();
			}
			
			attach.transferTo(f);
			
			Map userInfo = (Map)wreq.getAttribute("userInfo", RequestAttributes.SCOPE_SESSION);
			
			String id = (String)userInfo.get("ID");
			String title =(String)param.get("title");
			String content =(String)param.get("content");
			String upload =(String) ctx.getContextPath()+"/gaevideo/"+gg+ext;
			
			Date d= new Date();
			
			Map result = new HashMap<>();
				result.put("title", title);
				result.put("content", content);
				result.put("upload",upload);
				result.put("day",d);
				result.put("dtid",id);
			
			try {
				int r= dr.addlist(result);
				System.out.println("r>"+r);
				if (r==1) {
					return "redirect:/dogTraining/training.do?type=on";
				}else {
					return "redirect:/dogTraining/write.do?type=off";
				}	
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "redirect:/dogTraining/write.do?type=off";
		}
	} //end addwritePost
	
	@GetMapping("/delete.do")
	public String deleteGetHandle(@RequestParam Map param) {
		System.out.println("parama >>"+param);
		Map input = new HashMap<>();
			input.put("no", param.get("no"));
		
		dr.deletelist(input);
				
		return "redirect:/dogTraining/training.do";
	}//end deletehandle
	

}//end class



