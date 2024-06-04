package com.shoppingmall.belleaf.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.shoppingmall.belleaf.banner.service.BannerService;
import com.shoppingmall.belleaf.banner.vo.BannerVO;
import com.shoppingmall.belleaf.common.awsImageUploader;

@Controller
public class AdminBannerController {
	@Autowired
	private BannerService bannerService;

	@Autowired
	private awsImageUploader imamgeUploader;
	
	public AdminBannerController() {
		// TODO Auto-generated constructor stub
	}
	

	@GetMapping("/admin/banner/insert")
	public String bannerWriteView(BannerVO banner, Model model) {
		BannerVO bannerOne = bannerService.SelectBannerOne(banner);
		model.addAttribute("banner",bannerOne);
		
		return "admin/adminBannerInsert";
	}
	
	@PostMapping("/admin/banner/insert")
	public String insertBanner(BannerVO banner, HttpSession session, 
			@RequestParam(value = "banner_pic", required = false) MultipartFile banner_pic) {
		if(banner_pic == null) {
			System.out.println("상품 썸네일이 없는 파일입니다");
			return "redirect:/admin/banner";
		}
		else if(!banner_pic.isEmpty()) {
			banner.setBanner_content(banner_pic.getOriginalFilename());
			imamgeUploader.uploadImage(banner_pic);
		}
		// user_id 가져오기
		String user_id = (String)session.getAttribute("user_id");
				
		banner.setUser_id(user_id);
		bannerService.InsertBanner(banner);
		return "redirect:/admin/banner";
	}
	
	// 베너 리스트
	@GetMapping("/admin/banner")
	public String getMyinfoBanner(HttpSession session, Model model) {
		
		// user_id 가져오기
		String user_id = (String)session.getAttribute("user_id");
		
		// 페이징 처리	
		List<BannerVO> list = bannerService.SelectBannerList(user_id);
		model.addAttribute("bannerList", list);

		return "admin/adminBannerList";
	}
	
	@GetMapping("/admin/banner/edit")
	public String editBanner(HttpSession session, BannerVO banner, Model model) {
		// user_id 가져오기
		String user_id = (String)session.getAttribute("user_id");
				
		banner.setUser_id(user_id);
		BannerVO vo = bannerService.SelectBannerOne(banner);
		model.addAttribute("banner", vo);
		return "admin/adminEditBanner";
	}
	
	@PostMapping("/admin/banner/edit")
	public String editBanner(HttpSession session, BannerVO banner,
			@RequestParam(value = "banner_pic", required = false) MultipartFile banner_pic,
			@RequestParam(value = "before_banner_pic", required = false) String before_banner_pic) {
		if(banner_pic == null) {
			System.out.println("상품 썸네일이 없는 파일입니다");
			return "redirect:/admin/banner";
		}
		else if(!banner_pic.isEmpty()) {
			imamgeUploader.deleteFile(before_banner_pic);
			imamgeUploader.uploadImage(banner_pic);
			banner.setBanner_content(banner_pic.getOriginalFilename());
		}
		
		// user_id 가져오기
		String user_id = (String)session.getAttribute("user_id");
				
		banner.setUser_id(user_id);
		System.out.println("editMyBanner -> " + banner);
		bannerService.UpdateBanner(banner);
		return "redirect:/admin/banner";
	}
	
	// 마이페이지 - 후기 삭제
	@RequestMapping("/admin/banner/delete")
	public String deleteBanner(BannerVO banner,
			@RequestParam(value = "before_banner_pic", required = false) String before_banner_pic) {
		bannerService.DeleteBanner(banner);
		imamgeUploader.deleteFile(before_banner_pic);
		return "redirect:/admin/banner";
	}
}
