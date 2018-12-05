package com.ddos.web.read.ctl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ddos.web.read.ReadService;
import com.ddos.web.read.ReadVO;

@Controller
public class ReadController {

	@Autowired
	ReadService readserivce;
	
	@RequestMapping("setRoom")
	public String setRoom(Model model, ReadVO vo) {
		model.addAttribute("setList", readserivce.setRoom(vo));
		return "read/Setting";
	}
	
	
	@RequestMapping("read")
	public String read() {
		return "read/ReadChoose";
	}
	
	
}
