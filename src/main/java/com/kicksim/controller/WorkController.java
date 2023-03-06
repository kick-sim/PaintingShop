package com.kicksim.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kicksim.mapper.AttachMapper;
import com.kicksim.model.AttachImageVO;
import com.kicksim.model.Criteria;
import com.kicksim.model.PageDTO;
import com.kicksim.model.WorkVO;
import com.kicksim.service.AdminService;
import com.kicksim.service.WorkService;

@Controller
public class WorkController {
	private static final Logger logger = LoggerFactory.getLogger(WorkController.class);

	@Autowired
	private AttachMapper attachMapper;

	@Autowired
	private WorkService workService;
	@Autowired
	private AdminService adminService;

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public void mainPageGET(Model model,Criteria cri) {
		logger.info("메인 페이지 접속");
		/* 상품 리스트 데이터 */
		
		List ls = adminService.goodsList(cri);
		
		model.addAttribute("ls", ls);
	}

	@GetMapping("/display")
	public ResponseEntity<byte[]> getImage(String fileName) {
		logger.info("getImage().........." + fileName);
		File file = new File("c:\\upload\\" + fileName);
		ResponseEntity<byte[]> result = null;

		try {

			HttpHeaders header = new HttpHeaders();

			header.add("Content-type", Files.probeContentType(file.toPath()));

			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);

		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;
	}

	/* 이미지 정보 반환 */
	// 반환 데이터가 JSON형석이 되도록 지정해주기 위해서 produces사용
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<AttachImageVO>> getAttachList(int workId) {

		logger.info("getAttachList.........." + workId);

		return new ResponseEntity<List<AttachImageVO>>(attachMapper.getAttachList(workId), HttpStatus.OK);

	}

	/* 상품 검색 */
	@GetMapping("/search")
	public String searchGoodsGET(Criteria cri, Model model) {

		logger.info("cri : " + cri);

		List<WorkVO> list = workService.getGoodsList(cri);
		logger.info("pre list : " + list);
		if (!list.isEmpty()) {
			model.addAttribute("list", list);
			logger.info("list : " + list);
		} else {
			model.addAttribute("listcheck", "empty");

			return "search";
		}

		model.addAttribute("pageMaker", new PageDTO(cri, workService.goodsGetTotal(cri)));

		String[] typeArr = cri.getType().split("");

		for (String s : typeArr) {
			if (s.equals("T") || s.equals("A")) {
				model.addAttribute("filter_info", workService.getCateInfoList(cri));
			}
		}

		return "search";

	}
	/* 상품 상세 
	 * 전송한 식별자 값을 변수로 인식하도록 하기 위한 템플릿 변수{workid}*/
	@GetMapping("/goodsDetail/{workId}")
	public String goodsDetailGET(@PathVariable("workId")int workId, Model model) {
		
		logger.info("goodsDetailGET()..........");
		
		model.addAttribute("goodsInfo", workService.getGoodsInfo(workId));
		
		return "/goodsDetail";
	}

}
