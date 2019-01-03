package com.ddos.web.assets.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.ddos.web.assets.AssetsService;
import com.ddos.web.assets.AssetsVO;
import com.ddos.web.paging.PagingVO;

@Controller
public class AssetsController {

	@Autowired
	AssetsService assetsService;

	// 클릭시 자산으로
	@RequestMapping(value = "/assets")
	public ModelAndView getAssetsList(Model model, AssetsVO vo, PagingVO paging) {
		ModelAndView mv = new ModelAndView();
		if (paging.getPage() == null) {
			paging.setPage(1);
		}
		paging.setPageUnit(10);
		vo.setFirst(paging.getFirst());
		vo.setLast(paging.getLast());

		paging.setTotalRecord(assetsService.getCount(vo));
		mv.addObject("paging", paging);
		mv.addObject("getAssetsList", assetsService.getAssetsList(vo));
		mv.setViewName("admin/assets/getAssetsList");
		return mv;
	}

	// 한개 조회
	@RequestMapping("getAssets")
	public String getAssets(Model model, AssetsVO vo) {
		model.addAttribute("assets", assetsService.getAssets(vo));
		return "admin/assets/getAssets";
	}

	// 등록 퐁
	@RequestMapping("assetsInsertform")
	public String assetsInsert(Model model, AssetsVO vo) {
		return "admin/assets/assetsInsertform";
	}

	// 등록 처리
	@RequestMapping("assetsInsert")
	public String assetsInsert(AssetsVO vo) {
		assetsService.assetsInsert(vo);
		return "redirect:assets";
	}

	// 수정 처리 폼
	@RequestMapping("assetsUpdateform")
	public String assetsUpdate(Model model, AssetsVO vo) {
		return "admin/assets/assetsUpdateform";
	}

	// 수정처리
	@RequestMapping("assetsUpdate")
	public String assetsUpdate(AssetsVO vo) {
		assetsService.assetsUpdate(vo);
		return "redirect:assets";
	}

}
