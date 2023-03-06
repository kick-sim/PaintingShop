package com.kicksim.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kicksim.mapper.AdminMapper;
import com.kicksim.mapper.AttachMapper;
import com.kicksim.mapper.WorkMapper;
import com.kicksim.model.AttachImageVO;
import com.kicksim.model.CateVO;
import com.kicksim.model.Criteria;
import com.kicksim.model.WorkVO;

@Service
public class AdminServiceImpl implements AdminService {
	private static final Logger log = LoggerFactory.getLogger(AdminServiceImpl.class);
	@Autowired
	private AdminMapper adminMapper;
	@Autowired
	private WorkMapper workMapper;

	@Autowired
	private AttachMapper attachMapper;
	/* 상품 등록 */
	@Transactional
	@Override
	public void workEnroll(WorkVO work) {

		log.info("(srevice)workEnroll........");

		adminMapper.workEnroll(work);
		if (work.getImageList() == null || work.getImageList().size() <= 0) {
			return;
		}
		work.getImageList().forEach(attach -> {

			attach.setWorkId(work.getWorkId());
			adminMapper.imageEnroll(attach);

		});

	}

	/* 카테고리 리스트 */
	@Override
	public List<CateVO> cateList() {

		log.info("(service)cateList........");

		return adminMapper.cateList();
	}

	/* 상품 리스트 */
	@Override
	public List<WorkVO> goodsGetList(Criteria cri) {
		log.info("goodsGetTotalList()..........");
		return adminMapper.goodsGetList(cri);
	}
	@Override
	public List<WorkVO> goodsList(Criteria cri) {
		log.info("goodsGetTotalList()..........");
		List<WorkVO> list = workMapper.getGoodsList(cri);
		list.forEach(work -> {

			int workId = work.getWorkId();

			List<AttachImageVO> imageList = attachMapper.getAttachList(workId);

			work.setImageList(imageList);

		});
		return list;
	}


	/* 상품 총 갯수 */
	public int goodsGetTotal(Criteria cri) {
		log.info("goodsGetTotal().........");
		return adminMapper.goodsGetTotal(cri);
	}

	/* 상품 조회 페이지 */
	@Override
	public WorkVO goodsGetDetail(int workId) {

		log.info("(service)workGetDetail......." + workId);

		return adminMapper.goodsGetDetail(workId);
	}

	/* 상품 정보 수정 */
	@Transactional
	@Override
	public int goodsModify(WorkVO vo) {
//		log.info("goodsModify........");
//
//		return adminMapper.goodsModify(vo);
		int result = adminMapper.goodsModify(vo);
		
		if (result == 1 && vo.getImageList() != null && vo.getImageList().size() > 0) {

			adminMapper.deleteImageAll(vo.getWorkId());

			vo.getImageList().forEach(attach -> {

				attach.setWorkId(vo.getWorkId());
				adminMapper.imageEnroll(attach);

			});

		}
		if(result==1&&vo.getImageList()==null) {
			adminMapper.deleteImageAll(vo.getWorkId());
		}

		return result;

	}

	/* 상품 정보 삭제 */
	@Override
	public int goodsDelete(int workId) {

		log.info("goodsDelete..........");

		return adminMapper.goodsDelete(workId);
	}
	/*이미지 정보 삭제*/
	public int imageDelete(int workId) {
		log.info("imageDelete.........");
		
		return adminMapper.deleteImageAll(workId);
	}

}
