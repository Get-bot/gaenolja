package app.controller.parcel;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import app.models.ParcelRepository;

@Controller
public class CommentController {

	@Autowired
	ServletContext ctx;
	
	@Autowired
	Gson gson;
	
	@Autowired
	ParcelRepository parcelRepository;

	// 댓글 디비 저장
	@PostMapping("/addcomment.do")
	public String addByComments(@RequestParam Map param) {
		String serial = UUID.randomUUID().toString().split("-")[0];
			param.put("serial", serial);
		try {
			int r = parcelRepository.addByComments(param);
			return "parcel.detail";
		}catch(Exception e) {
			e.printStackTrace();
			return "parcel.detail";
		}
	}


}
