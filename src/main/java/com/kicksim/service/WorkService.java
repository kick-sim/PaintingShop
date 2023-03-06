package com.kicksim.service;

import java.util.List;

import com.kicksim.model.CateFilterDTO;
import com.kicksim.model.Criteria;
import com.kicksim.model.WorkVO;

public interface WorkService {
	/* 상품 검색 */
	public List<WorkVO> getGoodsList(Criteria cri);
	
	/* 상품 총 갯수 */
	public int goodsGetTotal(Criteria cri);
	
	/* 검색결과 카테고리 필터 정보 */
	public List<CateFilterDTO> getCateInfoList(Criteria cri);
	/* 상품 정보 */
	public WorkVO getGoodsInfo(int workId);
}
