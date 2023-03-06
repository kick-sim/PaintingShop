<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/board/modify.css">
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
		</div>
	</div>
	<form id="modifyForm" action="/board/modify" method="post">
		<div class="input_wrap">
			<label>게시판 번호</label> <input name="bno" readonly="readonly"
				value='<c:out value="${pageInfo.bno}"/>'>
		</div>
		<div class="input_wrap">
			<label>게시판 제목</label> <input name="title"
				value='<c:out value="${pageInfo.title}"/>'>
		</div>
		<div class="input_wrap">
			<label>게시판 내용</label>
			<textarea rows="3" name="content"><c:out
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
			<a class="btn" id="modify_btn">수정 완료</a>  
			<a class="btn" id="delete_btn">삭제</a>
		</div>
	</form>
	<form id="infoForm" action="/board/modify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.bno}"/>'> 
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'> 
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
	<script>
		let form = $("#infoForm"); // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
		let mForm = $("#modifyForm"); // 페이지 데이터 수정 from

		/* 목록 페이지 이동 버튼 */
		$("#list_btn").on("click", function(e) {
			form.find("#bno").remove();
			form.attr("action", "/board/list");
			form.submit();
		});

		/* 수정 하기 버튼 */
		$("#modify_btn").on("click", function(e) {
			mForm.submit();
		});

		/* 취소 버튼 */
		$("#cancel_btn").on("click", function(e) {
			form.attr("action", "/board/get");
			form.submit();
		});
		/* 삭제 버튼 */
		$("#delete_btn").on("click", function(e) {
			form.attr("action", "/board/delete");
			form.attr("method", "post");
			form.submit();
		});
	</script>
</body>
</html>