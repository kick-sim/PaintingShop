package com.kicksim.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kicksim.mapper.AdminMapper;
import com.kicksim.mapper.AttachMapper;
import com.kicksim.mapper.WorkMapper;
import com.kicksim.model.AttachImageVO;
import com.kicksim.model.CateFilterDTO;
import com.kicksim.model.Criteria;
import com.kicksim.model.WorkVO;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class WorkServiceImpl implements WorkService {
	private static final Logger log = LoggerFactory.getLogger(WorkServiceImpl.class);
	@Autowired
	private WorkMapper workMapper;

	@Autowired
	private AttachMapper attachMapper;
	
	@Autowired
	private AdminMapper adminMapper;

	/* 상품 검색 */
	@Override
	public List<WorkVO> getGoodsList(Criteria cri) {

		log.info("getGoodsList().......");

		String type = cri.getType();
		String[] typeArr = type.split("");
		String[] authorArr = workMapper.getAuthorIdList(cri.getKeyword());

		// 작가이름으로 검색이 포함되는 경우
		if (type.equals("A") || type.equals("AC") || type.equals("AT") || type.equals("ACT")) {
			// 존재하지 않는 작가일경우 빈 list반환
			if (authorArr.length == 0) {
				return new ArrayList();
			}
		}

		for (String t : typeArr) {
			if (t.equals("A")) {
				cri.setAuthorArr(authorArr);
			}
		}
		List<WorkVO> list = workMapper.getGoodsList(cri);
		list.forEach(work -> {

			int workId = work.getWorkId();

			List<AttachImageVO> imageList = attachMapper.getAttachList(workId);

			work.setImageList(imageList);

		});
		return list;
	}

	/* 상품 총 갯수 */
	@Override
	public int goodsGetTotal(Criteria cri) {

		log.info("goodsGetTotal().......");

		return workMapper.goodsGetTotal(cri);

	}

	/* 검색결과 카테고리 필터 정보 */
	@Override
	public List<CateFilterDTO> getCateInfoList(Criteria cri) {

		List<CateFilterDTO> filterInfoList = new ArrayList<CateFilterDTO>();

		String[] typeArr = cri.getType().split("");
		String[] authorArr;

		for (String type : typeArr) {
			if (type.equals("A")) {
				authorArr = workMapper.getAuthorIdList(cri.getKeyword());
				if(authorArr.length == 0) {
					return filterInfoList;
				}
				cri.setAuthorArr(authorArr);
			}
		}

		String[] cateList = workMapper.getCateList(cri);

		String tempCateCode = cri.getCateCode();

		for (String cateCode : cateList) {
			cri.setCateCode(cateCode);
			CateFilterDTO filterInfo = workMapper.getCateInfo(cri);
			filterInfoList.add(filterInfo);
		}

		cri.setCateCode(tempCateCode);

		return filterInfoList;
	}
	@Override
	public WorkVO getGoodsInfo(int workId) {
		
		WorkVO goodsInfo = workMapper.getGoodsInfo(workId);
		goodsInfo.setImageList(adminMapper.getAttachInfo(workId));
		
		return goodsInfo;
	}
}
