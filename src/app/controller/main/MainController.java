package app.controller.main;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.google.gson.Gson;

import app.controller.index.ChatSocketController;
import app.models.FindRepository;
import app.models.OnechatRepository;
import app.models.ParcelRepository;
import app.models.accountRepository;
import app.models.dogTalkRepository;
import app.models.dogtrainingRepository;
import app.models.searchRepository;
import app.service.SocketService;
import app.service.WeatherService;

@Controller
@RequestMapping("/main")
public class MainController {
	@Autowired
	accountRepository ar;
	
	@Autowired
	ServletContext ctx;
	
	@Autowired
	WeatherService ws;
	
	@Autowired
	Gson gson;	

	@Autowired
	FindRepository fr;
	
	@Autowired
	ParcelRepository pr;
	
	@Autowired
	dogTalkRepository dtr;
	
	@Autowired
	dogtrainingRepository dogTraining;
	
	@Autowired
	searchRepository sr;
	
	@Autowired
	SocketService socketservice;	
	
	@Autowired
	OnechatRepository onechat; 
	
	@Autowired
	ChatSocketController chatSocket;
	
	Map<String, HttpSession> sessions;
	
	public MainController() {
		sessions = new HashMap<>();
	}
	
	@SuppressWarnings("unchecked")
	@GetMapping("/index.do")
	public ModelAndView mainIndexHandle(WebRequest wr) {
						
		List recommendKeywords = sr.getSearch();
		recommendKeywords.sort(new Comparator<Map>() {
			public int compare(Map m1, Map m2)	{
				int count1 = (int) m1.get("count");
				int count2 = (int) m2.get("count");
				
				return count2-count1;
			}
		
		});
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/index/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/index/main.jsp");
		mav.addObject("dtrList",dtr.getSomeFromDogTalk());
		mav.addObject("findList", fr.getRecentFind());
		mav.addObject("parcelList", pr.getAllByParcel());		
		mav.addObject("dogTraining",dogTraining.getAll());
		wr.setAttribute("recommendKeywords", recommendKeywords, wr.SCOPE_SESSION);
		return mav;
	}
	

	@GetMapping("/login.do")
	public ModelAndView mainLoginHandle(WebRequest wr) {
		ModelAndView mav = new ModelAndView();				
		
		if(wr.getAttribute("joinSuccess", wr.SCOPE_REQUEST)!=null) {
			wr.setAttribute("joinSuccess", 1, wr.SCOPE_REQUEST);
		}
		
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/login/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/login/main.jsp");
		
		return mav;
	}
	
	@PostMapping("/login.do")
	public ModelAndView loginHandle(@RequestParam Map param, WebRequest wr, HttpSession session) throws IOException {
		ModelAndView mav = new ModelAndView();	
		
		if(ar.getPwById(param)) {						
			Map userInfo =  ar.getUserInfo((String)param.get("id"));
			String nick = (String)userInfo.get("NICKNAME");		
			
			if(sessions.containsKey(nick)) {				
				Map data = new HashMap();				
				data.put("mode", "invalidated");					
				socketservice.sendOne(data, nick);			
				
				for (int i = 0; i < socketservice.loggedInUsers.size(); i++) {
					if(nick.equals(socketservice.loggedInUsers.get(i).getAttributes().get("nick"))){
						socketservice.removeSocket(socketservice.loggedInUsers.get(i));
					}					
				}
			
				try {
					sessions.get(nick).invalidate();
				} catch (Exception e) {
					
				}
					
				
			}
			wr.setAttribute("nick", nick, wr.SCOPE_SESSION);
			wr.setAttribute("userInfo", userInfo, wr.SCOPE_SESSION);
			String gu = ws.getCoordinateByAddress((String)userInfo.get("ADDRESS"));
			wr.setAttribute("gu", gu, wr.SCOPE_SESSION);	
			
			sessions.put(nick, session);  //메인 세션 에 추가
			
			
			mav.setViewName("redirect:/main/index.do");
			
			System.out.println(userInfo);
			return mav;
		}else {
			wr.setAttribute("loginFailed", 1, wr.SCOPE_REQUEST);
			mav.setViewName("master");
			mav.addObject("top", "/WEB-INF/views/master/login/top.jsp");
			mav.addObject("main", "/WEB-INF/views/master/login/main.jsp");			
			
			return mav;
			
		}
	}
	
	@GetMapping(path="/validate.do", produces="application/json;charset=UTF-8")	
	@ResponseBody
	public String validate(@RequestParam Map param) {
		String mode = (String) param.get("mode");
		
		switch(mode) {
		case "id" :
				if(ar.checkId((String)param.get("input"))==null){
					return gson.toJson(true);
				}else {
					return gson.toJson(false);
				}	
				
		case "nick" :
			System.out.println(ar.checkNick((String)param.get("input"))==null);
			System.out.println((String)param.get("input"));
				if(ar.checkNick((String)param.get("input"))==null){
					return gson.toJson(true);
				}else {
					return gson.toJson(false);
				}				
		}
		return "";
	}
	
	@GetMapping(path="/getUserPassword.do", produces="application/json;charset=UTF-8")	
	@ResponseBody
	public String getUserPasswordController(@RequestParam Map param) {		
	
		String id = (String) param.get("id");		
		return gson.toJson(ar.getPassword(id));	
	}
	
	@GetMapping(path="/getUserProfile.do", produces="application/json;charset=UTF-8")	
	@ResponseBody
	public String getUserProfileController(@RequestParam Map param) {		
	
		String id = (String) param.get("id");
		System.out.println("id : "+id);
		System.out.println(ar.getDogProfileById(id));
		
		Map map = new HashMap();
			map.put("profile", ar.getDogProfileById(id));
			map.put("value", true);
		String[] img = new String[] {"/image/ad1.jpg", "/image/searchimg.jpg", "/image/dog1.png","/image/dog2.jpg","/image/dog3.webp","/image/star.jpg","/image/lostdogbanner.jpg","/image/helpDog.jpg"};
			
		List<Map> profiles = new ArrayList<>();
			
			profiles.add(map);
			
			for (int i = 0; i < 8; i++) {
				Map map1= new HashMap();
					map1.put("profile", img[i]);
					map1.put("value", false);
				profiles.add(map1);
			}			
		
		Collections.shuffle(profiles);
			
		return gson.toJson(profiles);
	}
	
	@GetMapping("/findId.do")
	public ModelAndView mainFindIdHandle(WebRequest wr) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		
		mav.addObject("top", "/WEB-INF/views/master/findAccount/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/findAccount/findId.jsp");
		System.out.println(wr.getAttribute("yourId", wr.SCOPE_REQUEST));
		
		if(wr.getAttribute("yourId", wr.SCOPE_REQUEST)!=null) {
			wr.setAttribute("yourId", false, wr.SCOPE_REQUEST);
			System.out.println("if 문 돌아감");
		}	
		
		return mav;
	}
	@PostMapping("/findId.do")
	public ModelAndView mainFindIdPostHandle(WebRequest wr,@RequestParam Map param) {
		ModelAndView mav = new ModelAndView();
		System.out.println(param);
		System.out.println(ar.findId(param));
		if(ar.findId(param)==null) {		
			System.out.println("inside null if 문");
			wr.setAttribute("yourId", false, wr.SCOPE_REQUEST);
			mav.setViewName("master");
			
			mav.addObject("top", "/WEB-INF/views/master/findAccount/top.jsp");
			mav.addObject("main", "/WEB-INF/views/master/findAccount/findId.jsp");
			
		}else {			
			mav.setViewName("master");
			mav.addObject("yourId", ar.findId(param));
			mav.addObject("top", "/WEB-INF/views/master/login/top.jsp");
			mav.addObject("main", "/WEB-INF/views/master/login/main.jsp");
		}
				
		return mav;
	}
	
	@GetMapping("/findPassWord.do")
	public ModelAndView mainFindPassWordHandle(WebRequest wr) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		
		mav.addObject("top", "/WEB-INF/views/master/findAccount/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/findAccount/findPassWord.jsp");
				
	
		
		return mav;
	}
	
	@GetMapping("/terms.do")
	public ModelAndView mainTermsHandle(WebRequest wr) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/join/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/join/terms.jsp");
		
		return mav;
	}
	
	@GetMapping("/joinform.do")
	public ModelAndView mainjoinformHandle(WebRequest wr) {
		ModelAndView mav = new ModelAndView();
		
		if(wr.getAttribute("joinFailed",wr.SCOPE_REQUEST)!=null) {
			wr.setAttribute("joinFailed", 1, wr.SCOPE_REQUEST);
		}
		

		mav.setViewName("master");
		mav.addObject("top", "/WEB-INF/views/master/join/top.jsp");
		mav.addObject("main", "/WEB-INF/views/master/join/joinform.jsp");
		
		return mav;
	}
	
	@PostMapping("/joinform.do")
	public ModelAndView joinFormPostHandle(@RequestParam Map param, WebRequest wr, @RequestParam MultipartFile dogProfile) throws IllegalStateException, IOException {
		long time = System.currentTimeMillis();
		System.out.println("joinFormHandle post");
		System.out.println("param = "+param);
		String add = (String) param.get("address");
		String add2= (String) param.get("address2");
		String address = add+add2;
		param.put("address", address );
		param.remove("address2");
		
		String dogProfileName = String.valueOf(time) + "_" + dogProfile.getOriginalFilename();

		String path = ctx.getRealPath(String.valueOf(time));
		
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		File dst = new File(dir, dogProfileName);		
		dogProfile.transferTo(dst);
		
		
		String attachDogProfile = "/" + time + "/" + dogProfileName;
		
		
		param.put("dogProfile", attachDogProfile);
		ModelAndView mav = new ModelAndView();
		
		try {
			int r = ar.addAccount(param);
			wr.setAttribute("joinSuccess", 1, wr.SCOPE_REQUEST);
			
			mav.setViewName("redirect:/main/login.do");
			return mav;
		}catch(Exception e) {
			e.printStackTrace();
			wr.setAttribute("joinFailed", 1, wr.SCOPE_REQUEST);
			
			mav.setViewName("redirect:/main/joinform.do");		
			return mav;
		}	
			
	}
	
	@GetMapping("/logout.do")
	public ModelAndView logoutHandle(WebRequest wr, HttpSession session) {
		wr.removeAttribute("userInfo", wr.SCOPE_SESSION);
		
		String nick = (String) session.getAttribute("nick");		
		sessions.remove(nick);
		session.invalidate();			
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/main/index.do");
		
		return mav;
	}
	
	@RequestMapping("/onetalk.do")	
	public String onetalkHandle(@RequestParam Map param,WebRequest wr,ModelMap map) {	
		String targetNick = (String)param.get("talkNick");		
		System.out.println("target > "+ targetNick);		
					
		wr.setAttribute("recipient", targetNick, wr.SCOPE_REQUEST);		
		//========================================
		Map user =(Map) wr.getAttribute("userInfo",wr.SCOPE_SESSION);
		System.out.println(user);
		String senderNick = (String) user.get("NICKNAME");
		System.out.println("sender > "+senderNick);		
		
		Map nickNames = new HashMap<>();
			nickNames.put("sender", senderNick);
			nickNames.put("recipient", targetNick);
			
		List<Map> chatlist=onechat.getOneChat(nickNames);
			map.addAttribute("chatlist",chatlist);
		
		
		System.out.println("roomNumber : "+param.get("roomNumber"));						
			
		
		if(param.get("roomNumber").equals("undefined")) {
			System.out.println("roomNumber undefined");
			String roomNumber = UUID.randomUUID().toString().split("-")[0];;
			Map<String,List<String>> roomMembers = chatSocket.privateRoomMembers;
			
			Set keyset = roomMembers.keySet();
			Iterator itr = keyset.iterator();
			
			while (itr.hasNext()) {
				String key = (String) itr.next();
				List list = roomMembers.get(key);
				if(list.contains(senderNick)&&list.contains(targetNick)) {
					roomNumber=key;
				}
			}
			
			System.out.println(roomMembers);
		    wr.setAttribute("roomNumber", roomNumber, wr.SCOPE_REQUEST);
		}else {
			wr.setAttribute("roomNumber", param.get("roomNumber"), wr.SCOPE_REQUEST);
		}
		
		return "master/chat/onetalk";
	}//end onetalk.do
	
	
	@GetMapping(path="/infomodal.do",produces = "application/text; charset=utf8")
	@ResponseBody
	public String InfomodalHandle(@RequestParam Map param,WebRequest wreq) {
		System.out.println("Infomodal>"+param);
		String nick = (String)param.get("nick");
		
		Map result =ar.getInfomodalByNick(nick);
		System.out.println("result >>>"+result);
		return gson.toJson(result);
	}//end Infomodal.do
}
