package app.controller.board;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
public class SearchController {
	@Autowired
	Gson gson;
	
	
	@GetMapping("/search.do")
	@ResponseBody
	public String searchHandle(@RequestParam Map map,ModelMap modelmap) {
		System.out.println("param>"+map);
		modelmap.addAttribute("info", map);
		return "redirect:/";
	};
	
}
