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

import app.controller.index.ChatSocketController;

@Service
public class chatService {	
	 
	
	@Autowired
	Gson gson;
	
	public List<WebSocketSession> chatConnectedUsers;	
	
	public chatService () {
		chatConnectedUsers = new ArrayList<>();
		
	}	
	
	// 사이즈
	public int size() {
		return chatConnectedUsers.size();
	}
	
	// 추가
	public boolean addSocket(WebSocketSession session) {
		return chatConnectedUsers.add(session);
	}
	//삭제
	public boolean removeSocket(WebSocketSession session) {
		return chatConnectedUsers.remove(session);
	}

	// 작성한것들 보내기
	public void sendMessage(String text) {	
		TextMessage msg = new TextMessage(text);
		for(int i=0; i < chatConnectedUsers.size(); i++) {
			try{				
				chatConnectedUsers.get(i).sendMessage(msg);
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
 	      for (int i = 0; i < chatConnectedUsers.size(); i++) {
 	         try {
	            WebSocketSession ws = chatConnectedUsers.get(i);
	            System.out.println("service.getAttris"+ws.getAttributes());
	            if(ws.getId().equals(target)) {	            	
	            	ws.sendMessage(msg);
	            }	            
 	         } catch (IOException e) {
 	            e.printStackTrace();
	         }
	      }
    }
    
    public void sendToList(String txt, List<String> targets) {
    	 TextMessage msg =new TextMessage(txt);
    	 for (int j = 0; j < targets.size(); j++) {
    		 for (int i = 0; i < chatConnectedUsers.size(); i++) {
    			 WebSocketSession ws = chatConnectedUsers.get(i);
    	         try {
    	           if(ws.getId().equals(targets.get(j))) {
    	        	   ws.sendMessage(msg);
    	           }
    	         } catch (IOException e) {
    	            e.printStackTrace();
    	         }
    	      }
		}	      
    }

	


}