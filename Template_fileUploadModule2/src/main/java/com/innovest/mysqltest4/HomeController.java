package com.innovest.mysqltest4;

import java.io.File;
import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.innovest.dao.MemberDao;
import com.innovest.dto.MemberDto;
import com.innovest.fileupload.FileObject;
import com.innovest.fileupload.FileService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	MemberDao memberdao;
	FileService fileService = new FileService();

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate);

		int cnt = 0;

		// selctOne 시작
		cnt = memberdao.mysqlCheck("admin");
		System.out.println("this is usercheck and cnt is :" + cnt);
		// selctOne 끝

		// selctList 시작
		List<MemberDto> memberlist_result = memberdao.select_allList();
		for (int i = 0; i < memberlist_result.size(); i++) {
			System.out.println("this is memberlist_result and id: " + memberlist_result.get(i).admin_id + " and pw: "
					+ memberlist_result.get(i).admin_pw);
		}
		// selctList 끝

		// delte 시작
		// memberdao.deleteDatabaseDaoMethod(new Integer(6));

		// insertbyMaps 시작
		/*
		 * Map<String, Object> parms = new HashMap<String, Object>();
		 * parms.put("id_bymap", "map_idbyMap_2"); parms.put("cmd_bymap", new
		 * Integer(12)); parms.put("pw_bymap", "map_pwbyMap_2");
		 * memberdao.insertDatabseByMapDaoMehthod(parms);
		 */
		// insertbyMaps 끝

		// insertbyObj 시작
		/*
		 * MemberDto insertNewObjbyObj = new MemberDto("adminIDinsertTestbyObj2", new
		 * Integer(13), "adminPWinsertTestbyObj2");
		 * memberdao.insertDatabaseyByObjDaoMethod(insertNewObjbyObj);
		 */
		// insertbyObj 끝

		return "redirect:/fileupload";
	}

	@RequestMapping("/fileupload")
	public String fileupload(Locale locale, Model model) {

		return "fileupload";
	}

	@RequestMapping("/fileupload_process")
	public String fileupload_process(HttpServletRequest request, Locale locale, Model model, HttpSession session) {
		// MultipartHttpServletRequest multipartHttpServletRequest =
		// (MultipartHttpServletRequest)request;
		// Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		//
		// MultipartFile multipartFile = null;
		// String originalFileName = null;
		// String originalFileExtension = null;
		// String storedFileName = null;
		//
		// List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		// Map<String, Object> listMap = null;
		//
		// String boardIdx = (String)map.get("IDX");
		// String requestName = null;
		// String idx = null;
		//
		//
		// while(iterator.hasNext()){
		// multipartFile = multipartHttpServletRequest.getFile(iterator.next());
		// if(multipartFile.isEmpty() == false){
		// originalFileName = multipartFile.getOriginalFilename();
		// originalFileExtension =
		// originalFileName.substring(originalFileName.lastIndexOf("."));
		// storedFileName = CommonUtils.getRandomString() + originalFileExtension;
		//
		// multipartFile.transferTo(new File(filePath + storedFileName));
		//
		// listMap = new HashMap<String,Object>();
		// listMap.put("IS_NEW", "Y");
		// listMap.put("BOARD_IDX", boardIdx);
		// listMap.put("ORIGINAL_FILE_NAME", originalFileName);
		// listMap.put("STORED_FILE_NAME", storedFileName);
		// listMap.put("FILE_SIZE", multipartFile.getSize());
		// list.add(listMap);
		// }
		// else{
		// requestName = multipartFile.getName();
		// idx = "IDX_"+requestName.substring(requestName.indexOf("_")+1);
		// if(map.containsKey(idx) == true && map.get(idx) != null){
		// listMap = new HashMap<String,Object>();
		// listMap.put("IS_NEW", "N");
		// listMap.put("FILE_IDX", map.get(idx));
		// list.add(listMap);
		// }
		// }
		// }
		// return list;

		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		System.out.println("this is multipartHttpServletRequest :" + multipartHttpServletRequest);
		// multipartRequest 에서 FileName을 iterator에 넣는다.,
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();
		System.out.println("this is iterator :" + iterator);
		System.out.println("this is iterator toString() :" + iterator.toString());
		while (iterator.hasNext()) {
			// iterator에 있는 Request File Name으로 파일을 가졍ㄴ다.
			MultipartFile imageFile = multipartHttpServletRequest.getFile(iterator.next());
			// checkupinfo TABLE INSERT 시작
			System.out.println("this is fileupload_process");
			// 파일 업로드 시작
			FileObject fileInfo = fileService.save(imageFile, session);
			System.out.println("this is upload 2");

			// 파일 업로드 정보 page로 전달
			model.addAttribute("fileInfo", fileInfo);
			System.out.println("this is upload 3");
		}

		return "fileuploadcomplete";
	}

	@RequestMapping(value = "/fileUpload/post") // ajax에서 호출하는 부분
	@ResponseBody
	public String upload(MultipartHttpServletRequest multipartRequest) { // Multipart로 받는다.
		System.out.println("this is upload() started");
		Iterator<String> itr = multipartRequest.getFileNames();

		String filePath = "C:/"; // 설정파일로 뺀다.

		while (itr.hasNext()) { // 받은 파일들을 모두 돌린다.

			/*
			 * 기존 주석처리 MultipartFile mpf = multipartRequest.getFile(itr.next()); String
			 * originFileName = mpf.getOriginalFilename();
			 * System.out.println("FILE_INFO: "+originFileName); //받은 파일 리스트 출력'
			 */

			MultipartFile mpf = multipartRequest.getFile(itr.next());

			String originalFilename = mpf.getOriginalFilename(); // 파일명

			String fileFullPath = filePath + "/" + originalFilename; // 파일 전체 경로

			try {
				// 파일 저장
				mpf.transferTo(new File(fileFullPath)); // 파일저장 실제로는 service에서 처리

				System.out.println("originalFilename => " + originalFilename);
				System.out.println("fileFullPath => " + fileFullPath);

			} catch (Exception e) {
				System.out.println("postTempFile_ERROR======>" + fileFullPath);
				e.printStackTrace();
			}

		}

/*		 List<MultipartFile> mpf_list =  (List<MultipartFile>) multipartRequest.getFile(itr.next());
		 if (mpf_list.size() == 1 && mpf_list.get(0).getOriginalFilename().equals("")) {
            
	        } else {
	            for (int i = 0; i < mf.size(); i++) {
	                // 파일 중복명 처리
	                String genId = UUID.randomUUID().toString();
	                // 본래 파일명
	                String originalfileName = mf.get(i).getOriginalFilename();
	                 
	                String saveFileName = genId + "." + getExtension(originalfileName);
	                // 저장되는 파일 이름
	 
	                String savePath = realFolder + saveFileName; // 저장 될 파일 경로
	 
	                long fileSize = mf.get(i).getSize(); // 파일 사이즈
	 
	                mf.get(i).transferTo(new File(savePath)); // 파일 저장
	 
	                bbsService.fileUpload(originalfileName, saveFileName, fileSize);
	            }
	        }*/

		
		
		
		return "success";
	}

}
