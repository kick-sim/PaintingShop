package com.kicksim.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kicksim.model.AttachImageVO;
import com.kicksim.model.WorkVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminServiceTests {
	@Autowired
	private AdminService service;
	/* 상품 등록 & 상품 이미지 등록 테스트 */
	@Test
	public void workEnrollTests() {

		WorkVO work = new WorkVO();
		// 상품 정보
		work.setWorkName("service test");
		work.setAuthorId(9);
		work.setExhibitYear("2021-03-18");
		work.setExhibiter("출품사");
		work.setCateCode("202001");
		work.setWorkPrice(20000);
		work.setWorkStock(300);
		work.setWorkDiscount(0.23);
		work.setWorkIntro("그림 소개 ");
		work.setWorkContents("그림 목차 ");

		// 이미지 정보
		List<AttachImageVO> imageList = new ArrayList<AttachImageVO>(); 
		
		AttachImageVO image1 = new AttachImageVO();
		AttachImageVO image2 = new AttachImageVO();
		
		image1.setFileName("test Image 1");
		image1.setUploadPath("test image 1");
		image1.setUuid("test1111");
		
		image2.setFileName("test Image 2");
		image2.setUploadPath("test image 2");
		image2.setUuid("test2222");
		
		imageList.add(image1);
		imageList.add(image2);
		work.setImageList(imageList);
		
		// workEnroll() 메서드 호출
		service.workEnroll(work);
		
		System.out.println("등록된 VO : " + work);
		
		
	}
}
