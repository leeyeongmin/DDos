package com.ddos.web.assets.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ddos.web.assets.AssetsService;
import com.ddos.web.assets.AssetsVO;

@Controller
public class AssetsController {

	@Autowired
	AssetsService assetsService;
	
	//클릭시 자산으로
	@RequestMapping("assets")
	public String getAssetsList(Model model, AssetsVO vo) {
		model.addAttribute("getAssetsList", assetsService.getAssetsList(vo));
		System.out.println("컨트롤 자산리스트");
		return "assets/getAssetsList";
	}
}
