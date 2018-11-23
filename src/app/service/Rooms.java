package app.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.google.gson.Gson;

import app.controller.index.ChatSocketController;


public class Rooms {	
	
	@Autowired
	chatService chat;
	   
	public List<String> users;	
	public String roomNumber;
	
	
	public Rooms(String roomNumber) {
		this.roomNumber=roomNumber;
		users = new ArrayList<>();
	}	
	
	public String getRoomNumber () {
		return this.roomNumber;
	}
	
	public void addUsers(String user1, String user2) {
		users.add(user1);
		users.add(user2);
	}
	
	public List getUsers() {
		return users;
	}
	
	public boolean isInRoom (String user) {
		for (int i = 0; i < users.size(); i++) {
				if(users.get(i).equals(user)) {
					return true;
				}else {
					return false;
				}		
				
		}
		return false;
	}
	public void sendMessageToUsers(String text) {	
		chat.sendToList(text, users);
	}


}