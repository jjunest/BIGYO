package com.nnoco.example;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class ImageUploadController {
	@Resource(name="imageView") ImageView imageView;
	@Autowired ImageService imageService;
	
	/**
	 * 이미지 업로드를 위한 페이지 매핑 
	 */
	@RequestMapping("/uploadPage")
	private String uploadView() {
		return "upload";
	}
	
	
	
	/**
	 * 이미지 업로드 페이지의 폼에서 전송 시 받게 되는 메서드 
	 */
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	private String upload(@RequestParam MultipartFile imageFile, ModelMap modelMap, HttpSession session) {
		System.out.println("this is upload 11 imageFile:"+imageFile);
		File fileInfo = imageService.save(imageFile, session);
		System.out.println("this is upload 2");
		modelMap.put("imageFile", fileInfo);
		System.out.println("this is upload 3");
		return "uploadComplete";
	}
	
	@RequestMapping(value="/upload2", method=RequestMethod.POST)
	private String upload2(@RequestParam MultipartFile imageFile, ModelMap modelMap, HttpSession session) {
		System.out.println("this is upload 12 imageFile:"+imageFile);
		File fileInfo = imageService.save(imageFile, session);
		System.out.println("this is upload 2");
		modelMap.put("imageFile", fileInfo);
		System.out.println("this is upload 3");
		return "uploadComplete";
	}
	
/*	@RequestMapping("/image/{imageId}")
	private ImageView getImage(@PathVariable String imageId, ModelMap modelMap) {
		File imageFile = imageService.get(imageId);
		
		modelMap.put("imageFile", imageFile);
		
		return imageView;
	}*/
}
