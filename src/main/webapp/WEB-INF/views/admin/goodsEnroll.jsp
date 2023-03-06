<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="../resources/css/admin/goodsEnroll.css?after">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<!-- 위지웍 설치 -->
<script
	src="https://cdn.ckeditor.com/ckeditor5/26.0.0/classic/ckeditor.js"></script>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style type="text/css">
	#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
	#result_card {
		position: relative;
	}
	.imgDeleteBtn{
	    position: absolute;
	    top: 0;
	    right: 5%;
	    background-color: #ef7d7d;
	    color: wheat;
	    font-weight: 900;
	    width: 30px;
	    height: 30px;
	    border-radius: 50%;
	    line-height: 26px;
	    text-align: center;
	    border: none;
	    display: block;
	    cursor: pointer;	
	}
	
</style>
</head>
</head>
<body>

	<%@include file="../includes/admin/header.jsp"%>
	<div class="admin_content_wrap">
		<div class="admin_content_subject">
			<span>상품 등록</span>
		</div>
		<div class="admin_content_main">
			<form action="/admin/goodsEnroll" method="post" id="enrollForm">
				<div class="form_section">
					<div class="form_section_title">
						<label>그림 제목</label>
					</div>
					<div class="form_section_content">
						<input name="workName"> <span
							class="ck_warn workName_warn">그림 이름을 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>작가</label>
					</div>
					<div class="form_section_content">
						<input id="authorName_input" readonly="readonly"> <input
							id="authorId_input" name="authorId" type="hidden">
						<button class="authorId_btn">작가 선택</button>
						<span class="ck_warn authorId_warn">작가를 선택해주세요</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>출품일</label>
					</div>
					<div class="form_section_content">
						<input name="exhibitYear" autocomplete="off" readonly="readonly">
						<span class="ck_warn exhibitYear_warn">출품일을 선택해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>출품사</label>
					</div>
					<div class="form_section_content">
						<input name="exhibiter"> <span
							class="ck_warn exhibiter_warn">출품사를 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>그림 카테고리</label>
					</div>
					<div class="form_section_content">
						<div class="cate_wrap">
							<span>대분류</span> <select class="cate1">
								<option selected value="none">선택</option>
							</select>
						</div>
						<div class="cate_wrap">
							<span>중분류</span> <select class="cate2">
								<option selected value="none">선택</option>
							</select>
						</div>
						<div class="cate_wrap">
							<span>소분류</span> <select class="cate3" name="cateCode">
								<option selected value="none">선택</option>
							</select>
						</div>
						<span class="ck_warn cateCode_warn">카테고리를 선택해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 가격</label>
					</div>
					<div class="form_section_content">
						<input name="workPrice" value="0"> <span
							class="ck_warn workPrice_warn">상품 가격을 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 재고</label>
					</div>
					<div class="form_section_content">
						<input name="workStock" value="0"> <span
							class="ck_warn workStock_warn">상품 재고를 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 할인율</label>
					</div>
					<div class="form_section_content">
						<input id="discount_interface" maxlength="2" value="0"> <input
							name="workDiscount" type="hidden" value="0"> <span
							class="step_val">할인 가격 : <span class="span_discount"></span></span>
						<span class="ck_warn workDiscount_warn">상품 할인율을 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>그림 소개</label>
					</div>
					<div class="form_section_content">

						<textarea name="workIntro" id="workIntro_textarea"></textarea>
						<span class="ck_warn workIntro_warn">그림 소개를 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>그림 목차</label>
					</div>
					<div class="form_section_content">

						<textarea name="workContents" id="workContents_textarea"></textarea>
						<span class="ck_warn workContents_warn">그림 목차를 입력해주세요.</span>
					</div>
				</div>
				<div class="form_section">
					<div class="form_section_title">
						<label>상품 이미지</label>
					</div>
					<div class="form_section_content">
						<input type="file" id="fileItem" name='uploadFile' style="height: 30px;">
						<div id="uploadResult"></div>
						<div class="form_section_content">
							
						</div>
					</div>
				</div>
			</form>
			<div class="btn_section">
				<button id="cancelBtn" class="btn">취 소</button>
				<button id="enrollBtn" class="btn enroll_btn">등 록</button>
			</div>
		</div>
	</div>
	<%@include file="../includes/admin/footer.jsp"%>
	<script>
		let enrollForm = $("#enrollForm")

		/* 취소 버튼 */
		$("#cancelBtn").click(function() {

			location.href = "/admin/goodsManage"

		});

		/* 상품 등록 버튼 */
		$("#enrollBtn").on("click", function(e) {

			e.preventDefault();
			/* 체크 변수 */
			let workNameCk = false;
			let authorIdCk = false;
			let exhibitYearCk = false;
			let exhibiterCk = false;
			let cateCodeCk = false;
			let priceCk = false;
			let stockCk = false;
			let discountCk = false;
			let introCk = false;
			let contentsCk = false;
			
			/* 체크 대상 변수 */
			let workName = $("input[name='workName']").val();
			let authorId = $("input[name='authorId']").val();
			let exhibitYear = $("input[name='exhibitYear']").val();
			let exhibiter = $("input[name='exhibiter']").val();
			let cateCode = $("select[name='cateCode']").val();
			let workPrice = $("input[name='workPrice']").val();
			let workStock = $("input[name='workStock']").val();
			let workDiscount = $("#discount_interface").val();
			let workIntro = $(".bit p").html();
			let workContents = $(".bct p").html();
			
			if(workName){
				$(".workName_warn").css('display','none');
				workNameCk = true;
			} else {
				$(".workName_warn").css('display','block');
				workNameCk = false;
			}
			
			if(authorId){
				$(".authorId_warn").css('display','none');
				authorIdCk = true;
			} else {
				$(".authorId_warn").css('display','block');
				authorIdCk = false;
			}
			
			if(exhibitYear){
				$(".exhibitYear_warn").css('display','none');
				exhibitYearCk = true;
			} else {
				$(".exhibitYear_warn").css('display','block');
				exhibitYearCk = false;
			}	
			
			if(exhibiter){
				$(".exhibiter_warn").css('display','none');
				exhibiterCk = true;
			} else {
				$(".exhibiter_warn").css('display','block');
				exhibiterCk = false;
			}
			
			if(cateCode != 'none'){
				$(".cateCode_warn").css('display','none');
				cateCodeCk = true;
			} else {
				$(".cateCode_warn").css('display','block');
				cateCodeCk = false;
			}	
			
			if(workPrice != 0){
				$(".workPrice_warn").css('display','none');
				priceCk = true;
			} else {
				$(".workPrice_warn").css('display','block');
				priceCk = false;
			}	
			
			if(workStock != 0){
				$(".workStock_warn").css('display','none');
				stockCk = true;
			} else {
				$(".workStock_warn").css('display','block');
				stockCk = false;
			}		
			
			if(!isNaN(workDiscount)){
				$(".workDiscount_warn").css('display','none');
				discountCk = true;
			} else {
				$(".workDiscount_warn").css('display','block');
				discountCk = false;
			}	
			
			if(workIntro != '<br data-cke-filler="true">'){
				$(".workIntro_warn").css('display','none');
				introCk = true;
			} else {
				$(".workIntro_warn").css('display','block');
				introCk = false;
			}	
			
			if(workContents != '<br data-cke-filler="true">'){
				$(".workContents_warn").css('display','none');
				contentsCk = true;
			} else {
				$(".workContents_warn").css('display','block');
				contentsCk = false;
			}

			if(workNameCk && authorIdCk && exhibitYearCk && exhibiterCk && cateCodeCk && priceCk && stockCk && discountCk && introCk && contentsCk ){
				//alert('통과');
				enrollForm.submit();
			} else {
				return false;
			}

		});
		/* 위지윅 적용 */
		 
		/* 그림 소개 */
		ClassicEditor
			.create(document.querySelector('#workIntro_textarea'))
			.catch(error=>{
				console.error(error);
			});
			
		/* 그림 목차 */	
		ClassicEditor
		.create(document.querySelector('#workContents_textarea'))
		.catch(error=>{
			console.error(error);
		});
		
		/* 캘린더 설정 */
		const config = {
			dateFormat: 'yy-mm-dd',
			showOn : "button",
			buttonText:"날짜 선택",
		    prevText: '이전 달',
		    nextText: '다음 달',
		    monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
		    dayNames: ['일','월','화','수','목','금','토'],
		    dayNamesShort: ['일','월','화','수','목','금','토'],
		    dayNamesMin: ['일','월','화','수','목','금','토'],
		    yearSuffix: '년',
	        changeMonth: true,
	        changeYear: true
		}
		/* 출판일 캘린더*/
		$(function() {
			  $( "input[name='exhibitYear']" ).datepicker(config);
			});
		/* 작가 선택 버튼 */
		$('.authorId_btn').on("click",function(e){
			
			e.preventDefault();
			let popUrl = "/admin/authorPop";
			let popOption = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";
			
			window.open(popUrl,"작가 찾기",popOption);
			
		});
		/* 카테고리 JSON객체를 자바스크립트 객체로 변환하는 메서드*/
		let cateList = JSON.parse('${cateList}');
		
		let cate1Array = new Array();
		let cate2Array = new Array();
		let cate3Array = new Array();
		let cate1Obj = new Object();
		let cate2Obj = new Object();
		let cate3Obj = new Object();
		
		let cateSelect1 = $(".cate1"); //class가 cate1인 객체 
		let cateSelect2 = $(".cate2");
		let cateSelect3 = $(".cate3");
		/* 카테고리 배열 초기화 메서드
		   tier의 값에 따라서 obj에 저장 obj를 array에 push*/
		function makeCateArray(obj,array,cateList, tier){
			for(let i = 0; i < cateList.length; i++){
				if(cateList[i].tier === tier){
					obj = new Object();
					
					obj.cateName = cateList[i].cateName;
					obj.cateCode = cateList[i].cateCode;
					obj.cateParent = cateList[i].cateParent;
					
					array.push(obj);				
					
				}
			}
		}	
		/* 배열 초기화 */
		makeCateArray(cate1Obj,cate1Array,cateList,1);
		makeCateArray(cate2Obj,cate2Array,cateList,2);
		makeCateArray(cate3Obj,cate3Array,cateList,3);
		
		for(let i = 0; i < cate1Array.length; i++){
			cateSelect1.append("<option value='"+cate1Array[i].cateCode+"'>" + cate1Array[i].cateName + "</option>");
		}
		
		/* 중분류 <option> 태그 */
		$(cateSelect1).on("change",function(){
			//대분류에서 선택된 객체의 value 가져오기
			let selectVal1 = $(this).find("option:selected").val();
			
			cateSelect2.children().remove();
			cateSelect3.children().remove();
			
			cateSelect2.append("<option value='none'>선택</option>");
			cateSelect3.append("<option value='none'>선택</option>");
			
			for(let i = 0; i < cate2Array.length; i++){
				if(selectVal1 === cate2Array[i].cateParent){
					cateSelect2.append("<option value='"+cate2Array[i].cateCode+"'>" + cate2Array[i].cateName + "</option>");	
				}
			}
			
		});
		/* 소분류 <option>태그 */
		$(cateSelect2).on("change",function(){
			
			let selectVal2 = $(this).find("option:selected").val();
			
			cateSelect3.children().remove();
			
			cateSelect3.append("<option value='none'>선택</option>");		
			
			for(let i = 0; i < cate3Array.length; i++){
				if(selectVal2 === cate3Array[i].cateParent){
					cateSelect3.append("<option value='"+cate3Array[i].cateCode+"'>" + cate3Array[i].cateName + "</option>");	
				}
			}
			
		});
		/* 할인율 Input 설정 */
		$("#discount_interface").on("propertychange change keyup paste input", function(){
			
			let userInput = $("#discount_interface");
			let discountInput = $("input[name='workDiscount']");
			
			let discountRate = userInput.val();	// 사용자가 입력할 할인값
			let sendDiscountRate = discountRate / 100;	// 서버에 전송할 할인값
			let goodsPrice = $("input[name='workPrice']").val(); // 원가
			let discountPrice = goodsPrice * (1 - sendDiscountRate); // 할인가격
			     
			if(!isNaN(discountRate)){
				$(".span_discount").html(discountPrice);
				discountInput.val(sendDiscountRate);	
			}
			
		});	
		//금액->할인률 입력후 금액을 수정할때 할인가격 수정
		$("input[name='workPrice']").on("change", function(){
			
			let userInput = $("#discount_interface");
			let discountInput = $("input[name='workDiscount']");
			
			let discountRate = userInput.val();					// 사용자가 입력한 할인값
			let sendDiscountRate = discountRate / 100;			// 서버에 전송할 할인값
			let goodsPrice = $("input[name='workPrice']").val();			// 원가
			let discountPrice = goodsPrice * (1 - sendDiscountRate);		// 할인가격
			if(!isNaN(discountRate)){
				$(".span_discount").html(discountPrice);
			}
		});
		/* 이미지 업로드 */
		$("input[type='file']").on("change", function(e){
			/* 이미지 존재시 삭제 */
			if($(".imgDeleteBtn").length > 0){
				deleteFile();
			}
			//key value 형식 key와 추후 추가할 url매핑 메서드의 매개변수명이 동일하여야함
			let formData = new FormData();
			let fileInput = $('input[name="uploadFile"]');
			let fileList = fileInput[0].files;
			let fileObj = fileList[0];
			if(!fileCheck(fileObj.name, fileObj.size)){
				return false;
			}
			formData.append("uploadFile", fileObj);
			$.ajax({
				url: '/admin/uploadAjaxAction',
		    	processData : false,
		    	contentType : false,
		    	data : formData,
		    	type : 'POST',
		    	dataType : 'json',
		    	success : function(result){
		    		console.log(result);
		    		showUploadImage(result);
		    	},
		    	error : function(result){
		    		alert("이미지 파일이 아닙니다.");
		    	}
			});	
			
			console.log("fileList : " + fileList);
			console.log("fileObj : " + fileObj);
			console.log("fileName : " + fileObj.name);
			console.log("fileSize : " + fileObj.size);
			console.log("fileType(MimeType) : " + fileObj.type);
		});
		/* var, method related with attachFile */
		let regex = new RegExp("(.*?)\.(jpg|png)$");
		let maxSize = 1048576; //1MB	
		
		function fileCheck(fileName, fileSize){

			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
				  
			if(!regex.test(fileName)){
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			
			return true;		
			
		}
		/* 이미지 출력 */
		function showUploadImage(uploadResultArr){
			
			/* 전달받은 데이터 검증 */
			if(!uploadResultArr || uploadResultArr.length == 0){return}
			
			let uploadResult = $("#uploadResult");
			
			let obj = uploadResultArr[0];
			
			let str = "";
			
			let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
			
			str += "<div id='result_card'>";
			str += "<img src='/display?fileName=" + fileCallPath +"'>";
			str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
			str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
			str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
			str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";
			str += "</div>";		
			
	   		uploadResult.append(str);     
	        
		}
		/* 이미지 삭제 버튼 동작 '#uploadReulst" <div> 태그를 식별자로 하여 그 내부에 있는 
		'imgDeleteBtn' <div> 태그를 클릭(click) 하였을 때 콜백 함수가 호출된다는 의미입니다.*/
		$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
			
			deleteFile();
			
		});
		/* 파일 삭제 메서드 */
		function deleteFile(){
			
			let targetFile = $(".imgDeleteBtn").data("file");
			
			let targetDiv = $("#result_card");
			
			$.ajax({
				url: '/admin/deleteFile',
				data : {fileName : targetFile},
				dataType : 'text',
				type : 'POST',
				success : function(result){
					console.log(result);
					
					targetDiv.remove();
					$("input[type='file']").val("");
					
				},
				error : function(result){
					console.log(result);
					
					alert("파일을 삭제하지 못하였습니다.")
				}
			});
		}
	</script>
</body>
</html>
