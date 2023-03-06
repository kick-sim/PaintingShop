<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/board/get.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="wrapper">
		<div class="wrap">
			<!-- gnv_area -->
			<div class="top_gnb_area">
				<ul class="list">
					<li><a href="/main">메인 페이지</a></li>
					<li><a href="/member/logout.do">로그아웃</a></li>
					<li><a href="/board/list">게시판</a></li>
				</ul>
			</div>
			
			<div class="logo_area">
				<a href="/main"><img src="/resources/img/myLogo.png"></a>
			</div>
			<div class="title">
				<span>게시판</span>
			</div>
			<br><br>
			<div class="input_wrap">
				<label>게시판 번호</label> <input name="bno" readonly="readonly"
					value='<c:out value="${pageInfo.bno}"/>'>
			</div>
			<div class="input_wrap">
				<label>게시판 제목</label> <input name="title" readonly="readonly"
					value='<c:out value="${pageInfo.title}"/>'>
			</div>
			<div class="input_wrap">
				<label>게시판 내용</label>
				<textarea rows="3" name="content" readonly="readonly"><c:out
						value="${pageInfo.content}" /></textarea>
			</div>
			<div class="input_wrap">
				<label>게시판 작성자</label> <input name="memberId" readonly="readonly"
					value='<c:out value="${pageInfo.memberId}"/>'>
			</div>
			<div class="input_wrap">
				<label>게시판 등록일</label> <input name="regdater" readonly="readonly"
					value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.regdate}"/>'>
			</div>
			<div class="input_wrap">
				<label>게시판 수정일</label> <input name="updateDate" readonly="readonly"
					value='<fmt:formatDate pattern="yyyy/MM/dd" value="${pageInfo.updateDate}"/>'>
			</div>
			<div class="btn_wrap">
				<a class="btn" id="list_btn">목록 페이지</a>
				<c:if test="${member.memberId == pageInfo.memberId }">
					<a class="btn" id="modify_btn">수정 하기</a>
				</c:if>
			</div>
			<form id="infoForm" action="/board/modify" method="get">
				<input type="hidden" id="bno" name="bno"
					value='<c:out value="${pageInfo.bno}"/>'> <input
					type="hidden" name="pageNum"
					value='<c:out value="${cri.pageNum}"/>'> <input
					type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
				<input type="hidden" name="keyword" value="${cri.keyword }">
			</form>
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
	<script>
		let form = $("#infoForm");

		$("#list_btn").on("click", function(e) {
			form.find("#bno").remove();
			form.attr("action", "/board/list");
			form.submit();
		});

		$("#modify_btn").on("click", function(e) {
			form.attr("action", "/board/modify");
			form.submit();
		});
	</script>
</body>
</html>