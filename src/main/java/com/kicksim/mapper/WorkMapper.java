package com.kicksim.mapper;

import java.util.List;

import com.kicksim.model.CateFilterDTO;
import com.kicksim.model.Criteria;
import com.kicksim.model.WorkVO;

public interface WorkMapper {
	/* 상품 검색 */
	public List<WorkVO> getGoodsList(Criteria cri);
	
	/* 상품 총 갯수 */
	public int goodsGetTotal(Criteria cri);
	/* 작가 id 리스트 요청 */
	public String[] getAuthorIdList(String keyword);
	/* 검색 대상 카테고리 리스트 */
	public String[] getCateList(Criteria cri);
	
	/* 카테고리 정보(+검색대상 갯수) */
	public CateFilterDTO getCateInfo(Criteria cri);
	/* 상품 정보 */
	public WorkVO getGoodsInfo(int workId);
}
