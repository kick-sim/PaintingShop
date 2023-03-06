package com.kicksim.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kicksim.model.WorkVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminMapperTests {
	@Autowired
	private AdminMapper mapper;
	
	/* 상품 등록 */
//	@Test
//	public void workEnrollTest() throws Exception{
//		
//		WorkVO work = new WorkVO();
//		
//		work.setWorkName("mapper 테스트");
//		work.setAuthorId(9);
//		work.setExhibitYear("2021-03-18");
//		work.setExhibiter("출품사");
//		work.setCateCode("202001");
//		work.setWorkPrice(20000);
//		work.setWorkStock(1);
//		work.setWorkDiscount(0.23);
//		work.setWorkIntro("그림 소개 ");
//		work.setWorkContents("그림 목차 ");
//		System.out.println("Before WorkVO :" + work);
//		mapper.workEnroll(work);
//		System.out.println("After WorkVO :" + work);
//	}
	/* 카테고리 리스트 */
//	@Test
//	public void cateListTest() throws Exception{
//		
//		System.out.println("cateList()..........." + mapper.cateList());
//		
//	}
	/* 상품 리스트 & 상품 총 갯수 */
//	@Test
//	public void goodsGetListTest() {
//		
//		Criteria cri = new Criteria();
//		
//		/* 검색조건 */
//		cri.setKeyword("기린그림");
//		
//		/* 검색 리스트 */
//		List list = mapper.goodsGetList(cri);
//		for(int i = 0; i < list.size(); i++) {
//			System.out.println("result......." + i + " : " + list.get(i));
//		}
//		
//		/* 상품 총 갯수 */
//		int result = mapper.goodsGetTotal(cri);
//		System.out.println("resutl.........." + result);
//		
//		
//	}
//	/* 상품 조회 페이지 */
//	@Test
//	public void goodsGetDetailTest() {
//		
//		int workId = 20;
//		
//		WorkVO result = mapper.goodsGetDetail(workId);
//		
//		System.out.println("상품 조회 데이터 : " + result);
//		
//		
//	}
	/* 상품 정보 수정 */
//	@Test
//	public void goodsModifyTest() {
//		
//		WorkVO work = new WorkVO();
//		
//		work.setWorkId(1);
//		work.setWorkName("mapper 테스트");
//		work.setAuthorId(1);
//		work.setExhibitYear("2021-03-18");
//		work.setExhibiter("출품사");
//		work.setCateCode("103002");
//		work.setWorkPrice(20000);
//		work.setWorkStock(3);
//		work.setWorkDiscount(0.23);
//		work.setWorkIntro("그림 소개 ");
//		work.setWorkContents("그림 목차 ");
//		
//		mapper.goodsModify(work);
//		
//	}
	/* 상품 정보 삭제 */
//	@Test
//	public void goodsDeleteTest() {
//		
//		int workId = 90;
//		
//		int result = mapper.goodsDelete(workId);
//		
//		if(result == 1) {
//			System.out.println("삭제 성공");
//		}
//		
//	}
	/* 이미지 등록 */
//	@Test
//	public void imageEnrollTest() {
//		
//		AttachImageVO vo = new AttachImageVO();
//		
//		vo.setWorkId(137);
//		vo.setFileName("test");
//		vo.setUploadPath("test");
//		vo.setUuid("test2");
//		
//		mapper.imageEnroll(vo);
//		
//	}
//	@Test
//	public void checkImageListTest() {
//		
//		mapper.checkFileList();
//		
//	}

}
