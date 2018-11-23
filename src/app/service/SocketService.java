package app.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.google.gson.Gson;

@Service
public class SocketService {

	public List<WebSocketSession> loggedInUsers;
	
	@Autowired
	Gson gson;
	
	public SocketService() {
		loggedInUsers = new ArrayList<>();
	}
	// 사이즈
	public int size() {
		return loggedInUsers.size();
	}
	
	// 추가
	public boolean addSocket(WebSocketSession session) {
		return loggedInUsers.add(session);
	}
	//삭제
	public boolean removeSocket(WebSocketSession session) {
		return loggedInUsers.remove(session);
	}

	// 작성한것들 보내기
	public void sendWrite(String text) {
		TextMessage msg = new TextMessage(text);
		for(int i=0; i < loggedInUsers.size(); i++) {
			try{
				loggedInUsers.get(i).sendMessage(msg);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	 
   public void sendOne(Map data, String target) {
	   sendOne(gson.toJson(data), target);
   }
   
   public void sendOne(String txt, String target) {
	   TextMessage msg =new TextMessage(txt);	      
	      for (int i = 0; i < loggedInUsers.size(); i++) {
	         try {
	            WebSocketSession ws = loggedInUsers.get(i);
	            System.out.println("service.getAttris"+ws.getAttributes());
	            if(ws.getAttributes().get("nick").equals(target)) {	            	
	            	ws.sendMessage(msg);
	            }	           
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }
   }
   
   public void sendToList (String txt, List<WebSocketSession> toList) {
	   TextMessage msg =new TextMessage(txt);
	   for (int i = 0; i < toList.size(); i++) {
	         try {
	            toList.get(i).sendMessage(msg);	                     
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }
   }
	
	
}
