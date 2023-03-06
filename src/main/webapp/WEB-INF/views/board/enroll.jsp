<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/board/enroll.css">
</head>
<body>
	<div class="wrapper">
		<div class="wrap">
			<!-- gnv_area -->
			<div class="top_gnb_area">
				<ul class="list">
					<li><a href="/main">메인 페이지</a></li>
					<li><a href="/member/logout.do">로그아웃</a></li>
					<li><a href="/board/list">게시글 등록</a></li>
				</ul>
			</div>
			<div class="top_area">
				<div class="logo_area">
					<a href="/main"><img src="/resources/img/myLogo.png"></a>
				</div>
				<div class="title">
					<span>게시판</span>
				</div>
				<div class="content_wrap">
					<form action="/board/enroll" method="post">
						<div class="form_section">
							<div class="form_section_title">
								<label>Title</label><input name="title">
							</div>
							<div class="form_section_content">
								<label>Content</label>
								<textarea rows="3" name="content"></textarea>
							</div>
							<div class="input_wrap">
								<input type="hidden" name="memberId" value="${member.memberId}">
							</div>
							<button class="btn">등록</button>
						</div>
					</form>
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
						<br>
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
</body>
</html>