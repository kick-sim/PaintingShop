<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl사용을 위한 코드 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><!-- 천 단위마다 콤마가 출력되도록 하기위함 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome GiringurimMall</title>
<link rel="stylesheet" href="/resources/css/goodsDetail.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>

	<div class="wrapper">
		<div class="wrap">
			<div class="top_gnb_area">
				<ul class="list">
					<c:if test="${member == null}">
						<!-- 로그인 X -->
						<li><a href="/member/login">로그인</a></li>
						<li><a href="/member/join">회원가입</a></li>
					</c:if>
					<c:if test="${member != null }">
						<!-- 로그인 O -->
						<c:if test="${member.adminCk == 1 }">
							<!-- 관리자 계정 -->
							<li><a href="/admin/main">관리자 페이지</a></li>
						</c:if>
						<li><a id="gnb_logout_button">로그아웃</a></li>
						<li>마이룸</li>
						<li>장바구니</li>
						<li><a href="/board/list">게시판</a></li>
					</c:if>
					
				</ul>
			</div>
			<div class="top_area">
				<div class="logo_area">
					<a href="/main"><img src="/resources/img/myLogo.png"></a>
				</div>
				<div class="search_area">
					<div class="search_wrap">
						<form id="searchForm" action="/search" method="get">
							<div class="search_input">
								<select name="type">
									<option value="T">그림 제목</option>
									<option value="A">작가</option>
								</select> <input type="text" name="keyword"
									value="<c:out value="${pageMaker.cri.keyword}"/>">
								<button class='btn search_btn'>검 색</button>
							</div>
						</form>
					</div>
				</div>
				<div class="login_area">

					<!-- 로그인 하지 않은 상태 -->
					<c:if test="${member == null }">
						<div class="login_button">
							<a href="/member/login">로그인</a>
						</div>
						<span><a href="/member/join">회원가입</a></span>
					</c:if>

					<!-- 로그인한 상태 -->
					<c:if test="${ member != null }">
						<div class="login_success_area">
							<span>회원 : ${member.memberName}</span> <span>충전금액 : <fmt:formatNumber
									value="${member.money }" pattern="\#,###.##" /></span> <span>포인트
								: <fmt:formatNumber value="${member.point }" pattern="#,###" />
							</span> <a href="/member/logout.do">로그아웃</a>
						</div>
					</c:if>

					<div class="clearfix"></div>
				</div>

				<div class="content_area">
					<div class="line"></div>
					<div class="content_top">
						<div class="ct_left_area">
							<div class="image_wrap"
								data-workid="${goodsInfo.imageList[0].workId}"
								data-path="${goodsInfo.imageList[0].uploadPath}"
								data-uuid="${goodsInfo.imageList[0].uuid}"
								data-filename="${goodsInfo.imageList[0].fileName}">
								<img>
							</div>
						</div>
						<div class="ct_right_area">
							<div class="title">
								<h1>${goodsInfo.workName}</h1>
							</div>
							<div class="line"></div>
							<div class="author">
								<span> ${goodsInfo.authorName} 지음 </span> <span>|</span> <span>
									${goodsInfo.exhibiter} </span> <span>|</span> <span
									class="exhibityear"> ${goodsInfo.exhibitYear} </span>
							</div>
							<div class="line"></div>
							<div class="price">
								<div class="sale_price">
									정가 :
									<fmt:formatNumber value="${goodsInfo.workPrice}"
										pattern="#,### 원" />
								</div>
								<div class="discount_price">
									판매가 : <span class="discount_price_number"><fmt:formatNumber
											value="${goodsInfo.workPrice - (goodsInfo.workPrice*goodsInfo.workDiscount)}"
											pattern="#,### 원" /></span> [
									<fmt:formatNumber value="${goodsInfo.workDiscount*100}"
										pattern="###" />
									%
									<fmt:formatNumber
										value="${goodsInfo.workPrice*goodsInfo.workDiscount}"
										pattern="#,### 원" />
									할인]
								</div>
							</div>
							<div class="line"></div>
							<div class="button">
								<div class="button_quantity">
									주문수량 <input type="text" value="1"> <span>
										<button>+</button>
										<button>-</button>
									</span>
								</div>
								<div class="button_set">
									<a class="btn_cart">장바구니 담기</a> <a class="btn_buy">바로구매</a>
								</div>
							</div>
						</div>
					</div>
					<div class="line"></div>
					<div class="content_middle">
						<div class="work_intro">${goodsInfo.workIntro}</div>
						<div class="work_content">${goodsInfo.workContents }</div>
					</div>
					<div class="line"></div>
					<div class="content_bottom">리뷰</div>
				</div>
				<!-- Footer 영역 -->
				<div class="footer_nav">
					<div class="footer_nav_container">
						<ul>
							<li>회사소개</li>
							<span class="line">|</span>
							<li>이용약관</li>
							<span class="line">|</span>
							<li>고객센터</li>
							<span class="line">|</span>
							<li>광고문의</li>
							<span class="line">|</span>
							<li>채용정보</li>
							<span class="line">|</span>
						</ul>
					</div>
				</div>
				<!-- class="footer_nav" -->

				<div class="footer">
					<div class="footer_container">

						<div class="footer_left">
							<img src="/resources/img/myLogo.png">
						</div>
						<div class="footer_right">
							(주) kicksimpainting 대표이사 : 심찬희 <br> 사업자등록번호 : ooo-oo-ooooo <br>
							대표전화 : oooo-oooo(발신자 부담전화) <br> <br> COPYRIGHT(C) <strong>https://github.com/simch9712</strong>
							ALL RIGHTS RESERVED.
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
				<!-- class="footer" -->
			</div>
		</div>
		<script>
			$(document).ready(function() {
				/* 이미지 삽입 */
				const bobj = $(".image_wrap");
				
				if(bobj.data("workid")){
					const uploadPath = bobj.data("path");
					const uuid = bobj.data("uuid");
					const fileName = bobj.data("filename");
					
					const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
					
					bobj.find("img").attr('src', '/display?fileName=' + fileCallPath);
				} else {
					bobj.find("img").attr('src', '/resources/img/noimage.png');
				}
				/* exhibityear */
				const year = "${goodsInfo.exhibitYear}";
				
				let tempYear = year.substr(0,10);
				
				let yearArray = tempYear.split("-")
				let exhibitYear = yearArray[0] + "년 " + yearArray[1] + "월 " + yearArray[2] + "일";
				
				$(".exhibityear").html(exhibitYear);
			});
		</script>
</body>
</html>