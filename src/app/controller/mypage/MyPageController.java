package app.controller.mypage;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

import app.models.MyPageRepository;

@Controller
public class MyPageController {
   
   @Autowired
   MyPageRepository myPageRepository;

   @RequestMapping("/mypage.do")
   public ModelAndView indexHandle(WebRequest wr, ModelMap map) {
      Map userInfo = (Map)wr.getAttribute("userInfo", wr.SCOPE_SESSION);
         map.put("userInfo", userInfo);
      ModelAndView mav = new ModelAndView();
      mav.setViewName("master");
      mav.addObject("top", "/WEB-INF/views/master/mypage/menu.jsp");
      mav.addObject("main", "/WEB-INF/views/master/mypage/index.jsp");
      
      return mav;
   }
   
   @RequestMapping("/myboard.do")
   public ModelAndView myboardHandle(WebRequest wr, ModelMap map) {
      Map userInfo = (Map)wr.getAttribute("userInfo", wr.SCOPE_SESSION);
      String writer = (String)userInfo.get("ID");
      String id = (String)userInfo.get("ID");
      String nick = (String)userInfo.get("NICKNAME");
      List parcelList = myPageRepository.getByParcelList(writer);
      List findList = myPageRepository.getByFindList(nick);
      List togetherList = myPageRepository.getByTogetherList(nick);
      List dtList = myPageRepository.getByDogTrainingList(id);
      List helpList = myPageRepository.getByHelpList(nick);
         map.put("parcelList", parcelList);
         map.put("findList", findList);
         map.put("togetherList", togetherList);
         map.put("dtList", dtList);
         map.put("helpList", helpList);
      
      ModelAndView mav = new ModelAndView();
      mav.setViewName("master");
      mav.addObject("top", "/WEB-INF/views/master/mypage/menu.jsp");
      mav.addObject("main", "/WEB-INF/views/master/mypage/myboard.jsp");
      
      return mav;
   }
   
   @RequestMapping("/mycomment.do")
   public ModelAndView myCommentHandle(WebRequest wr, ModelMap map) {
      Map userInfo = (Map)wr.getAttribute("userInfo", wr.SCOPE_SESSION);
      String talker = (String)userInfo.get("ID");
      String nick = (String)userInfo.get("NICKNAME");
      List pacmt = myPageRepository.getByParcelComments(talker);
      List tocmt = myPageRepository.getByTogetherComment(nick);
      List dtcmt = myPageRepository.getByDogTrainingCmt(talker);
      List hlcmt = myPageRepository.getByHelpCmt(nick);
         map.put("tocmt", tocmt);
         map.put("pacmt", pacmt);
         map.put("dtcmt", dtcmt);
         map.put("hlcmt", hlcmt);
      
      ModelAndView mav = new ModelAndView();
      
      mav.setViewName("master");
      mav.addObject("top", "/WEB-INF/views/master/mypage/menu.jsp");
      mav.addObject("main", "/WEB-INF/views/master/mypage/mycomment.jsp");
      
      return mav;
   }
   
   @RequestMapping("/mydogtalk.do")
   public ModelAndView getByMyDogTalk(WebRequest wr, ModelMap map) {
      Map userInfo = (Map)wr.getAttribute("userInfo", wr.SCOPE_SESSION);
      String talker = (String)userInfo.get("DOGNAME");
      List dogtalk = myPageRepository.getByMyDogTalk(talker);
      System.out.println(dogtalk);
         map.put("dogtalk", dogtalk);
         
      ModelAndView mav = new ModelAndView();
      
      mav.setViewName("master");
      mav.addObject("top", "/WEB-INF/views/master/mypage/menu.jsp");
      mav.addObject("main", "/WEB-INF/views/master/mypage/mydogtalk.jsp");
      
      return mav;
      
   }
}