package com.kicksim.service;

import java.util.List;

import com.kicksim.model.CateVO;
import com.kicksim.model.Criteria;
import com.kicksim.model.WorkVO;

public interface AdminService {
	/* 상품 등록 */
	public void workEnroll(WorkVO work);
	/* 카테고리 리스트 */
	public List<CateVO> cateList();
	/* 상품 리스트 */
	public List<WorkVO> goodsGetList(Criteria cri);
	public List<WorkVO> goodsList(Criteria cri);
	
	/* 상품 총 개수 */
	public int goodsGetTotal(Criteria cri);	
	/* 상품 조회 페이지 */
	public WorkVO goodsGetDetail(int workId);	
	/* 상품 수정 */
	public int goodsModify(WorkVO vo);	
	/* 상품 정보 삭제 */
	public int goodsDelete(int workId);
	/*이미지 정보 삭제*/
	public int imageDelete(int workId);
	
}
