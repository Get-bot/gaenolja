package app.models;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyPageRepository {

   @Autowired
   SqlSessionTemplate template;
   
   // 비밀번호 추출
   public String getByPassWord(String id) {
      return template.selectOne("gaenoljaaccount.getByPassWord", id);
   }
   
   // 비밀번호 수정
   public int updatePassWord(Map idpass) {
      return template.update("gaenoljaaccount.updatePassWord", idpass);
   }
   
   // 회원정보 수정
   public int updateUserInfo(Map userInfo) {
      return template.update("gaenoljaaccount.updateUserInfo", userInfo);
   }
   
   // 분양게시판 아이디 별로 가져오기
   public List<Map> getByParcelList(String writer) {
      return template.selectList("parcel.getByParcelList", writer);
   }
   
   // 분양게시판 아이디별 댓글 가져오기
   public List<Map> getByParcelComments(String talker) {
      return template.selectList("comments.getByParcelComments", talker);
   }
   
   // 찾아주시개 게시판 아이디 별로 가져오기
   public List<Map> getByFindList(String nick) {
      return template.selectList("find.getByFindList", nick);
   }
   
   // 같이가시개 게시판 닉네임 별로 가져오기
   public List<Map> getByTogetherList(String nick) {
      return template.selectList("together.getByTogetherList", nick);
   }
   
   // 같이가시개 게시판 닉네임 별로 댓글 가져오기
   public List<Map> getByTogetherComment(String nick) {
      return template.selectList("tocomment.getByTogetherComment", nick);
   }
   
   // 개톡 개이름 별로 뽑기
   public List<Map> getByMyDogTalk(String talker) {
      return template.selectList("dogTalk.getByMyDogTalk", talker);
   }
   
   // 개동게시판 아이디 별로 가져오기
   public List<Map> getByDogTrainingList(String id) {
      return template.selectList("dogtraining.getByDogTrainingList", id);
   }
   
   // 개동게시판 아이디별 댓글 가져오기
   public List<Map> getByDogTrainingCmt(String talker) {
      return template.selectList("DCOMMENT.getByDogTrainingCmt", talker);
   }
   
   // 도와주시개 게시판 아이디 별로 가져오기
   public List<Map> getByHelpList(String nick) {
      return template.selectList("help.getByHelpList", nick);
   }
   
   // 도와주시개 게시판 아이디별 댓글 가져오기
   public List<Map> getByHelpCmt(String nick) {
      return template.selectList("helpcomment.getByHelpCmt", nick);
   }
   
   
}