package com.ict.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ict.service.MyService;
import com.ict.vo.VO;

import oracle.jdbc.proxy.annotation.Methods;

@Controller
public class MyController {
	@Autowired
	private MyService myService;
	
	@RequestMapping("list.do")
	public ModelAndView listCommand() {
		return new ModelAndView("list");
	}
	
	// 결과가 VO면 json, 결과가 숫자나 문자인 String이면 text
	@RequestMapping(value = "list_ok.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public List<VO> listOkCommand() {
		try {
			return myService.selectAll();
		} catch (Exception e) {
		}
		return null;
	}
	
	@RequestMapping("write.do")
	public ModelAndView writeCommand() {
		return new ModelAndView("write");
	}
	
	@RequestMapping("write_ok.do")
	public ModelAndView writeOkCommand(VO vo) {
		try {
			int result = myService.insert(vo);
			if(result > 0) {
				return new ModelAndView("list");
			}
		} catch (Exception e) {
		}
		return null;
	}
	
	@RequestMapping("onelist.do")
	public ModelAndView onelistCommand(@ModelAttribute("idx")String idx) {
		return new ModelAndView("onelist");
	}
	
	@RequestMapping(value = "onelist_ok.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public VO onelistOkCommand(@RequestParam("idx")String idx) {
		try {
			return myService.selectOne(idx);
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	@RequestMapping("delete.do")
	public ModelAndView deleteCommand(@ModelAttribute("idx")String idx,
			@ModelAttribute("pw")String pw) {
		return new ModelAndView("delete");
	}
	
	@RequestMapping("delete_ok.do")
	public ModelAndView deleteOKCommand(@RequestParam("idx")String idx) {
		try {
			int result = myService.deleteOne(idx);
			if(result>0) {
				return new ModelAndView("list");
			}
		} catch (Exception e) {
		}
		return null;
	}
	
	@RequestMapping("update.do")
	public ModelAndView updateCommand(@ModelAttribute("idx")String idx) { 
		// update는 idx를 받아서 DB를 다시 갔다오는게 원래는 맞음 (pw 사용 x)
		try {
			ModelAndView mv = new ModelAndView("update");
			VO vo = myService.selectOne(idx); // DB를 갔다옴
			mv.addObject("vo", vo);
			return mv;
		} catch (Exception e) {
		}
		return null;
	}
	
	@RequestMapping("update_ok.do")
	public ModelAndView updateOKCommand(VO vo) {
		try {
			int result = myService.updateOne(vo);
			if(result>0) {
				return new ModelAndView("redirect:onelist.do?idx="+vo.getIdx());
			}
		} catch (Exception e) {
		}
		return null;
	}
}
