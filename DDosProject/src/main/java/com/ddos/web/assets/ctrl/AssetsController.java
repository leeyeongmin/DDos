package com.ddos.web.assets.ctrl;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ddos.web.assets.AssetsService;
import com.ddos.web.assets.AssetsVO;
import com.ddos.web.paging.PagingVO;

@Controller
public class AssetsController {

	@Autowired
	AssetsService assetsService;

	// 클릭시 자산으로
	@RequestMapping(value = "assets")
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
		System.out.println("자산  1건 조회 컨드롤러");
		return "admin/assets/getAssets";
	}

	// 등록 폼
	@RequestMapping("assetsInsertform")
	public String assetsInsertform(Model model, AssetsVO vo) {
		System.out.println("자산 등록 폼 컨드롤러");
		return "admin/assets/assetsInsert";
	}

	// 등록 처리
	@RequestMapping(value="assetsInsert", method=RequestMethod.POST)
	public String assetsInsert(AssetsVO vo, HttpServletRequest request)  throws IllegalStateException, IOException {
		System.out.println("자산 등록 처리 컨드롤러");
		String path = request.getSession().getServletContext().getRealPath("/file");
		System.out.println("path=========" + path);// 이미지 파일일 경우

		// ServlertContext ==내장객체 application
		// 첨부파일이 있으면 첨부 파일을 업로드(업로드 폴더로 저장)
		MultipartFile uploadFile = vo.getUploadFile();
		if (!uploadFile.isEmpty() && uploadFile.getSize() > 0) { // 파일크기로 첨부여부 확인
			String filename = uploadFile.getOriginalFilename(); // 업로드 파일명
			uploadFile.transferTo(new File(path, filename)); // 파일 이름
			// 업로드 파일을 vo에 저장
			vo.setUploadFileName(filename);
		}
		assetsService.assetsInsert(vo);
		System.out.println("==========자산 등록 처리 컨드롤러1");
		return "redirect:assets";
	}

	// 수정 처리 폼
	@RequestMapping("assetsUpdateform")
	public String assetsUpdate(Model model, AssetsVO vo) {
		model.addAttribute("assets", assetsService.getAssets(vo));
		System.out.println("==========자산 수정폼 컨트롤러");
		return "admin/assets/assetsUpdate";
	}

	// 수정처리
	@RequestMapping("assetsUpdate")
	public String assetsUpdate(AssetsVO vo) {
		assetsService.assetsUpdate(vo);
		System.out.println("==========자산 수정처리 컨트롤러");
		return "redirect:assets";
	}

}
