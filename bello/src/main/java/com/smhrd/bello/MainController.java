package com.smhrd.bello;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.bello.mapper.MemberMapper;



@Controller
public class MainController {
	
	@Autowired
	MemberMapper mapper;

	@RequestMapping(value="/", method= RequestMethod.GET) 
	public String index() {
		return "home";
				
	}
	
	@RequestMapping(value="/success", method=RequestMethod.GET)
	public String success(@RequestParam("user_id") String user_id, Model model) {
		
		model.addAttribute("user_id", user_id); 
		return "joinSuccess";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "login"; 
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() {
		return "join";
	}
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String main() {
		return "main"; 
	}	
	


}
