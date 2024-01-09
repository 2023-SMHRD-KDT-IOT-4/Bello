package com.smhrd.bello;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.smhrd.bello.mapper.MemberMapper;
import com.smhrd.bello.model.SpringMember;

// 컨트롤러 기본구조 만들기
//Controller 어노테이션 : request (요청)에 관련된 파라미트 처리, View(->String 파일의 이름만 작성) or model을 반환해주는 역할을 함
@Controller
public class MainController {
	
	@Autowired
	MemberMapper mapper;

	@RequestMapping(value="/", method= RequestMethod.GET) // 겟방식으로 루트로 요청
	public String index() {
		return "home";
				
	}
	//localhost:8083/myapp/success => joinSuccess.jsp 를 응답(리턴)하는 구조
	@RequestMapping(value="/success", method=RequestMethod.GET)
	public String success(@RequestParam("user_id") String user_id, Model model) {
		///System.out.println(user_id);
		model.addAttribute("user_id", user_id); // EL표기법 위해 모델 사용
		return "joinSuccess";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String update() {
		return "update"; //뷰 리졸버를 통해 업데이트로 연결됨
	}
	
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public String login() {
		return "login"; //뷰 리졸버를 통해 로그인 페이지로 연결됨
	}
	
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public String join() {
		return "join"; //뷰 리졸버를 통해 회원가입 페이지로 연결됨
	}
	
	@RequestMapping(value="/main", method=RequestMethod.GET)
	public String main() {
		return "main"; //뷰 리졸버를 통해 메인 페이지로 연결됨
	}	
	
	@RequestMapping(value="/select", method=RequestMethod.GET)
	public String select(Model model) {
		
		List<SpringMember> list =mapper.memberList();  //전체 다 불러오는 기능이기 때문에 조건이 따로 필요없어서 ->  넘겨줄 파라미터(member)안써도 됨
		model.addAttribute("list", list);
		
		return "select";
		}

	
	
	
	

}
