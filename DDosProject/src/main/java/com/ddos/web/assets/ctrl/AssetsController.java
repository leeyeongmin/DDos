package com.ddos.web.assets.ctrl;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		System.out.println("====================자산 등록 폼 컨드롤러" + vo);
		
		return "admin/assets/assetsInsert";
	}

	// 등록 처리
	@RequestMapping(value="assetsInsert", method=RequestMethod.POST)
	public String assetsInsert(AssetsVO vo, HttpServletRequest request, HttpSession session)  throws IllegalStateException, IOException {
		
		String path = request.getSession().getServletContext().getRealPath("/resources");
		
		// ServlertContext ==내장객체 application
		// 첨부파일이 있으면 첨부 파일을 업로드(업로드 폴더로 저장)
		MultipartFile uploadFile = vo.getUploadFile();
		if (!uploadFile.isEmpty() && uploadFile.getSize() > 0) { // 파일크기로 첨부여부 확인
			String filename = uploadFile.getOriginalFilename(); // 업로드 파일명
			uploadFile.transferTo(new File(path, filename)); // 파일 이름
			// 업로드 파일을 vo에 저장
			vo.setUploadFileName(filename);
		}
		assetsService.assetsInsert(vo, path);
		return "redirect:assets";
	}

	// 수정 처리 폼
	@RequestMapping("/assetsUpdateform")
	public String assetsUpdate(Model model, AssetsVO vo) {
		model.addAttribute("assets", assetsService.getAssets(vo));
		System.out.println("==========자산 수정폼 컨트롤러" + vo);
		return "admin/assets/assetsUpdate";
	}

	// 수정처리
	@RequestMapping("/assetsUpdate")
	public String assetsUpdate(AssetsVO vo) {
		assetsService.assetsUpdate(vo);
		System.out.println("+++++++++++++++++++++자산 수정처리 컨트롤러" + vo);
		return "redirect:assets";
	}
	// 파일 다운로드
		private String getBrowser(HttpServletRequest request) {
			String header = request.getHeader("User-Agent");
			if (header.indexOf("MSIE") > -1) {
				return "MSIE";
			} else if (header.indexOf("Trident") > -1) { // IE11 문자열 깨짐 방지
				return "Trident";
			} else if (header.indexOf("Chrome") > -1) {
				return "Chrome";
			} else if (header.indexOf("Opera") > -1) {
				return "Opera";
			}
			return "Firefox";
		}

		private void setDisposition(String filename, HttpServletRequest request, HttpServletResponse response)
				throws Exception {
			String browser = getBrowser(request);
			String dispositionPrefix = "attachment; filename=";
			String encodedFilename = null;
			if (browser.equals("MSIE")) {
				encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
			} else if (browser.equals("Trident")) { // IE11 문자열 깨짐 방지
				encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
			} else if (browser.equals("Firefox")) {
				encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
			} else if (browser.equals("Opera")) {
				encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
			} else if (browser.equals("Chrome")) {
				StringBuffer sb = new StringBuffer();
				for (int i = 0; i < filename.length(); i++) {
					char c = filename.charAt(i);
					if (c > '~') {
						sb.append(URLEncoder.encode("" + c, "UTF-8"));
					} else {
						sb.append(c);
					}
				}
				encodedFilename = sb.toString();
			} else {
				throw new IOException("Not supported browser");
			}
			response.setHeader("Content-Disposition", dispositionPrefix + encodedFilename);
			if ("Opera".equals(browser)) {
				response.setContentType("application/octet-stream;charset=UTF-8");
			}
		}

		@RequestMapping(value = "/FileDown")
		public void cvplFileDownload(@RequestParam Map<String, Object> commandMap, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			String atchFileId = (String) commandMap.get("atchFileId");
			String path = request.getSession().getServletContext().getRealPath("/resources");
			File uFile = new File(path, atchFileId);
			long fSize = uFile.length();
			if (fSize > 0) {
				String mimetype = "application/x-msdownload";
				response.setContentType(mimetype);
				// response.setHeader("Content-Disposition", "attachment; 한글이 첨부되어있어서
				// filename=\"" + URLEncoder.encode(fvo.getOrignlFileNm(), "utf-8") + "\"");
				setDisposition(atchFileId, request, response);
				BufferedInputStream in = null;
				BufferedOutputStream out = null;
				try {
					in = new BufferedInputStream(new FileInputStream(uFile));
					out = new BufferedOutputStream(response.getOutputStream());
					FileCopyUtils.copy(in, out);
					out.flush();
				} catch (IOException ex) {
				} finally {
					in.close();
					response.getOutputStream().flush();
					response.getOutputStream().close();
				}
			} else {
				response.setContentType("application/x-msdownload");
				PrintWriter printwriter = response.getWriter();
				printwriter.println("<html>");
				printwriter.println("<h2>Could not get file name:<br>" + atchFileId + "</h2>");
				printwriter.println("<center><h3><a href='javascript: history.go(-1)'>Back</a></h3></center>");
				printwriter.println("&copy; webAccess");
				printwriter.println("</html>");
				printwriter.flush();
				printwriter.close();
			}
		}
	
	
}
