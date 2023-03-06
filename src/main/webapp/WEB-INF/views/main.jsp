<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl사용을 위한 코드 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%><!-- 천 단위마다 콤마가 출력되도록 하기위함 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome GiringurimMall</title>
<link rel="stylesheet" href="resources/css/main.css?after">
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<script type="text/javascript"
	src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
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
					<a href="/main"><img src="resources/img/myLogo.png"></a>
				</div>
				<div class="search_area">
					<div class="search_wrap">
						<form id="searchForm" action="/search" method="get">
							<div class="search_input">
								<select name="type">
									<option value="T">그림 제목</option>
									<option value="A">작가</option>
								</select> <input type="text" name="keyword">
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
				<div class="navi_bar_area">
					<div class="dropdown">
						<a class="dropbtn" href="/search?type=C&cateCode=001">자연</a>
					</div>
					<div class="dropdown">
						<a class="dropbtn" href="/search?type=C&cateCode=002">인물</a>
					</div>
					<div class="dropdown">
						<a class="dropbtn" href="/search?type=C&cateCode=003">지역</a>
					</div>
					<div class="dropdown">
						<a class="dropbtn" href="/search?type=C&cateCode=004">그래픽/일러스트</a>
					</div>

				</div>
				<div class="content_area">
					<div class="slide_div_wrap">
						<div class="slide_div">
							<div>
								<a> <img src="../resources/img/jeju.png">
								</a>
							</div>
							<div>
								<a> <img src="../resources/img/julian.png">
								</a>
							</div>
							<div>
								<a> <img src="../resources/img/lee.png">
								</a>
							</div>
						</div>
					</div>
					<div class="ls_wrap">
						<div class="ls_div_subject">평점순 상품</div>
						<div class="ls_div">
							<c:forEach items="${ls}" var="ls">
								<a href="/goodsDetail/${ls.workId}">
									<div class="ls_div_content_wrap">
										<div class="ls_div_content">
											<div class="image_wrap"
												data-workid="${ls.imageList[0].workId}"
												data-path="${ls.imageList[0].uploadPath}"
												data-uuid="${ls.imageList[0].uuid}"
												data-filename="${ls.imageList[0].fileName}">
												<img>
											</div>
											<div class="ls_category">${ls.cateName}</div>
											<div class="ls_workName">${ls.workName}</div>
										</div>
									</div>
								</a>
							</c:forEach>
						</div>
					</div>
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
							<img src="resources/img/myLogo.png">
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
				$(".slide_div").slick({
					dots : true,
					autoplay : true,
					autoplaySpeed : 5000
				});
				/* 이미지 삽입 */
				$(".image_wrap").each(function(i, obj){
					
					const bobj = $(obj);
					
					if(bobj.data("workid")){
						const uploadPath = bobj.data("path");
						const uuid = bobj.data("uuid");
						const fileName = bobj.data("filename");
						
						const fileCallPath = encodeURIComponent(uploadPath + "/s_" + uuid + "_" + fileName);
						
						$(this).find("img").attr('src', '/display?fileName=' + fileCallPath);
					} else {
						$(this).find("img").attr('src', '/resources/img/noimage.png');
					}
					
				});
				$(".ls_div").slick({
					slidesToShow: 4,//몇개의 슬라이드를 한화면에 보일 것인지
					slidesToScroll: 4,//다음 슬라이드 이동시 몇개씩 이동할 것인지
					prevArrow : "<button type='button' class='ls_div_content_prev'>이전</button>",		// 이전 화살표 모양 설정
					nextArrow : "<button type='button' class='ls_div_content_next'>다음</button>",		// 다음 화살표 모양 설정
				});
			});
			/* gnb_area 로그아웃 버튼 작동 */
			$("#gnb_logout_button").click(function() {
				//alert("버튼 작동");
				$.ajax({
					type : "POST",
					url : "/member/logout.do",
					success : function(data) {
						alert("로그아웃 성공");
						document.location.reload();//reload해주어야 세션의 변경사항이 화면에 반영된다
					}
				}); // ajax 
			});
		</script>
</body>
</html>