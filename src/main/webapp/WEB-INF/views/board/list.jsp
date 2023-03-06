<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>

<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/board/list.css">
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
			<div class="top_area">
				<div class="logo_area">
					<a href="/main"><img src="/resources/img/myLogo.png"></a>
				</div>
				<div class="title">
				<span>게시판</span>
				</div>
				<div class="table_wrap">
					<table>
						<thead>
							<tr>
								<th class="bno_width">번호</th>
								<th class="title_width">제목</th>
								<th class="writer_width">작성자</th>
								<th class="regdate_width">작성일</th>
								<th class="updatedate_width">수정일</th>
							</tr>
						</thead>
						<c:forEach items="${list}" var="list">
							<tr>
								<td><c:out value="${list.bno}" /></td>
								<td><a class="move" href='<c:out value="${list.bno}"/>'>
										<c:out value="${list.title}" />
								</a></td>
								<td><c:out value="${list.memberId}" /></td>
								<td><fmt:formatDate pattern="yyyy/MM/dd"
										value="${list.regdate}" /></td>
								<td><fmt:formatDate pattern="yyyy/MM/dd"
										value="${list.updateDate}" /></td>
							</tr>
						</c:forEach>
					</table>
					
					<div class="search_wrap">
						<div class="search_area">
						<a href="/board/enroll" class="top_btn">게시판 등록</a>
							<input type="text" name="keyword"
								value="${pageMaker.cri.keyword }">
							<button>Search</button>
						</div>
					</div>
					<div class="pageInfo_wrap">
						<div class="pageInfo_area">
							<!-- 이전페이지 버튼 -->
							<c:if test="${pageMaker.prev}">
								<li class="pageInfo_btn previous"><a
									href="${pageMaker.pageStart-1}">Previous</a></li>
							</c:if>
							<!-- 페이지 번호 -->
							<c:forEach begin="${pageMaker.pageStart}"
								end="${pageMaker.pageEnd}" var="num">
								<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? "active":""}">

									<a href="${num}">${num}</a>
								</li>
							</c:forEach>
							<!-- 다음페이지 버튼 -->
							<c:if test="${pageMaker.next}">
								<li class="pageInfo_btn next"><a
									href="${pageMaker.pageEnd + 1 }">Next</a></li>
							</c:if>
						</div>
					</div>
					<form id="moveForm" method="get">
						<input type="hidden" name="pageNum"
							value="${pageMaker.cri.pageNum }"> <input type="hidden"
							name="amount" value="${pageMaker.cri.amount }"> <input
							type="hidden" name="keyword" value="${pageMaker.cri.keyword }">
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
	</div>
	<script>
		$(document).ready(function() {

			let result = '<c:out value="${result}"/>';

			checkAlert(result);

			function checkAlert(result) {

				if (result === '') {
					return;
				}

				if (result === "enrol success") {
					alert("등록이 완료되었습니다.");
				}

				if (result === "modify success") {
					alert("수정이 완료되었습니다.");
				}
				if (result === "delete success") {
					alert("삭제가 완료되었습니다.");
				}

			}

		});
		let moveForm = $("#moveForm");

		$(".move").on(
				"click",
				function(e) {
					e.preventDefault();

					moveForm.append("<input type='hidden' name='bno' value='"
							+ $(this).attr("href") + "'>");
					moveForm.attr("action", "/board/get");
					moveForm.submit();
				});
		$(".pageInfo_area a").on("click", function(e) {

			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/board/list");
			moveForm.submit();

		});
		$(".search_area button").on("click", function(e) {
			e.preventDefault();
			let val = $("input[name='keyword']").val();
			moveForm.find("input[name='keyword']").val(val);
			moveForm.find("input[name='pageNum']").val(1);
			moveForm.submit();
		});
	</script>

</body>
</html>