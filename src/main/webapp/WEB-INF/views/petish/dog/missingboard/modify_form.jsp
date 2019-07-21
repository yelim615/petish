<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "com.community.petish.dog.missingboard.dto.*" %>
<%
	DogLostPostResponseDetailDTO dto = (DogLostPostResponseDetailDTO)request.getAttribute("dto");

	System.out.println("게시글 아이디 : " + dto.getID());
%>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title></title>


<!-- 부트스트랩 추가 -->
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<!-- Bootstrap CSS-->
<link rel="stylesheet"
	href="/resources/vendor/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome CSS-->
<link rel="stylesheet"
	href="/resources/vendor/font-awesome/css/font-awesome.min.css">
<!-- Google fonts - Roboto-->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:300,400,700">
<!-- Bootstrap Select-->
<link rel="stylesheet"
	href="/resources/vendor/bootstrap-select/css/bootstrap-select.min.css">
<!-- owl carousel-->
<link rel="stylesheet"
	href="/resources/vendor/owl.carousel/assets/owl.carousel.css">
<link rel="stylesheet"
	href="/resources/vendor/owl.carousel/assets/owl.theme.default.css">
<!-- theme stylesheet-->
<link rel="stylesheet" href="/resources/css/style.lightblue.css"
	id="theme-stylesheet">
<!-- Custom stylesheet - for your changes-->
<link rel="stylesheet" href="/resources/css/custom.css">
<!-- Favicon and apple touch icons-->
<link rel="shortcut icon" href="/resources/img/favicon.ico"
	type="image/x-icon">
<link rel="apple-touch-icon" href="/resources/img/apple-touch-icon.png">
<link rel="apple-touch-icon" sizes="57x57"
	href="/resources/img/apple-touch-icon-57x57.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="/resources/img/apple-touch-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="/resources/img/apple-touch-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="/resources/img/apple-touch-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="/resources/img/apple-touch-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="/resources/img/apple-touch-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="/resources/img/apple-touch-icon-152x152.png">
	
<!-- datetimepicker 추가 -->
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.css" >

	
<!-- Tweaks for older IEs-->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script><![endif]-->
        <link rel="stylesheet" href="/resources/css/write-modify.css">
        <link rel="stylesheet" href="/resources/css/kakaomap.css">
</head>

<body>
	<div id="all">
		
		<%@ include file="/WEB-INF/views/commons/top.jspf" %>

		<div id="heading-breadcrumbs">
			<div class="container">
				<div class="row d-flex align-items-center flex-wrap">
					<div class="col-md-7">
						<h1 class="h2">강아지 실종견게시판</h1>
					</div>
					<div class="col-md-5">
						<ul class="breadcrumb d-flex justify-content-end">
							<li class="breadcrumb-item"><a href="index.html">강아지</a></li>
							<li class="breadcrumb-item active">실종견게시판</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div id="content">
			<div class="container">
				<div>
					<div id="customer-account">
						<div class="box mt-5" style="margin-top: 20px;">
							<div class="heading" id="head">
								<h3 class="text-uppercase">글 수정</h3>
							</div>
							<div class="col-lg-10 text-right p-3" style="display:inline-block;">
										<a href="/dog/missingboard/list" class="btn btn-template-outlined"
											style="margin-top: 10px;">목록</a>
							</div>
							<h4 style="display:inline-block;">[실종견 정보]</h4>
							<div class="col-md-10 text-right" style="display:inline-block;">
								<input type="checkbox" name="FOUND"><span style="color: red;"><b>반려견을 찾았습니다.</b></span>
							</div>
							<form action="/dog/missingboard/modify" method="POST">
								<div class="row">
									
									<input type="hidden" name="ID" value=<%=dto.getID() %>>
									
									<div class="col-sm-6 col-md-2">
										<div class="form-group">
											<label for="category">이름</label>
											<input type="text" name="DOG_NAME" value=<%=dto.getDOG_NAME() %> class="form-control">
										</div>
									</div>
									<div class="col-sm-6 col-md-2">
										<div class="form-group">
											<label for="category">나이</label>
											<input type="text" name="DOG_AGE" value=<%=dto.getDOG_AGE() %> class="form-control">
										</div>
									</div>
								</div>
								<div class="row">	
									<div class="col-sm-6 col-md-4">
										<div class="form-group">
											<label for="category">종</label>
											<select id="species" name="SPECIES_ID"
												class="form-control">
												<option value="">종</option>
												<option value="1">믹스견</option>
												<option value="2">스피츠</option>
												<option value="3">시츄</option>
												<option value="4">요크셔테리어</option>
												<option value="5">말티즈</option>
												<option value="6">포메라니안</option>
												<option value="7">푸들</option>
												<option value="8">치와와</option>
												<option value="9">미니핀</option>
												<option value="10">슈나우저</option>
												<option value="11">페키니즈</option>
												<option value="12">닥스훈트</option>
												<option value="13">빠삐용</option>
												<option value="14">비숑프리제</option>
												<option value="15">보스턴테리어</option>
												<option value="16">샤페이</option>
												<option value="17">웰시코기</option>
												<option value="18">비글</option>
												<option value="19">코카스파니엘</option>
												<option value="20">불독</option>
												<option value="21">사모에드</option>
												<option value="22">피레니즈</option>
												<option value="23">리트리버</option>
												<option value="24">말라뮤트</option>
												<option value="25">한국토종견</option>
												<option value="26">허스키</option>
												<option value="27">세퍼트</option>
												<option value="28">하운드</option>
												<option value="29">달마시안</option>
												<option value="30">콜리</option>
												<option value="31">쉽독</option>
												<option value="32">기타 강아지</option>
												
											</select>
										</div>
									</div>
									
									<div class="col-sm-6 col-md-2">
										<div class="form-group">
											<label>성별</label>
											<div class="checkbox" style="padding-top:10px;">
											<%
												if(dto.getDOG_GENDER().equals("수컷")) {
											%>
												<input type="radio" value="수컷" name="DOG_GENDER" checked><label>수컷</label>
												<input type="radio" value="암컷" name="DOG_GENDER" ><label>암컷</label>
											<%
												} else {
											%>
												<input type="radio" value="수컷" name="DOG_GENDER" ><label>수컷<label>
												<input type="radio" value="암컷" name="DOG_GENDER" checked><label>암컷</label>
											<%
												}
											%>
											</div>
											
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											
											<input type="file" name="DOG_IMAGE" value=<%=dto.getDOG_IMAGE() %>>
												
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-8">
										<div class="form-group">
											<label for="password_old">특징</label> 
											<input type="text" name="DOG_DESCRIPTION" value="<%=dto.getDOG_DESCRIPTION() %>" class="form-control">
												
										</div>
									</div>
								</div>
								<hr>
								<h4>[실종 관련 정보]</h4>
								<div class="row">
									<div class="col-sm-6 col-md-4">
										<div class="form-group">
											<label for="category">연락처</label> <input type="text" name="PHONE_NUMBER" value="<%=dto.getPHONE_NUMBER() %>" class="form-control">
											
										</div>
									</div>
									<div class="col-sm-6 col-md-4">
										<div class="form-group">
											<label for="category">사례금</label>
											<input type="text" name="FOUND" value="<%=dto.getREWARD() %>" class="form-control">
											
										</div>
									</div>
								</div>
								
								<div class="row">
																	
									<div class="col-sm-6 col-md-4">
										<div class="form-group">
											<label for="category">실종 일시</label>
											<input id="datetimepicker" name="DOG_LOST_DATE" type="datetime" value="<%=dto.getDOG_LOST_DATE() %>" class="form-control">
											
										</div>
									</div>									
								</div>
								
								<div class="row" >
									<div class="col-md-6">
										<div class="form-group">
											<label for="category">실종 장소</label>									
											<input id="place" name="DOG_LOST_ADDRESS" type="text" value="<%=dto.getDOG_LOST_ADDRESS() %>" class="form-control">
										</div>
									</div>
									<div class="col-md-1.5" style="padding-top: 6px;">
										<div class="form-group">
											<label for="category">    </label>									
											<input type="button" class="form-control" value="검색" onclick="openZipcode(this.form)" />
										</div>
									</div>
								</div>
								
								<div class="map_wrap">
    								<div id="map" style="width:100%;height:350px;position:relative;overflow:hidden;"></div>
    							</div>								
																
								<div class="row" style="padding-top: 10px;">
									<div class="col-md-3">
										<a href="/dog/missingboard/delete/<%=dto.getID() %>" class="btn btn-template-outlined"
											style="margin-top: 0px;">삭제</a>
									</div>
									<div class="col-md-9 text-right">
										<input type="submit" value="수정" class="btn btn-template-outlined">
										<input type="reset" value="취소" class="btn btn-template-outlined">
									</div>
								</div>
							</form>						
						</div>

					</div>

				</div>
			</div>
		</div>


	</div>
	<!-- Javascript files-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/popper.js/umd/popper.min.js">
		
	</script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/vendor/jquery.cookie/jquery.cookie.js">
		
	</script>
	<script src="/resources/vendor/waypoints/lib/jquery.waypoints.min.js">
		
	</script>
	<script src="/resources/vendor/jquery.counterup/jquery.counterup.min.js">
		
	</script>
	<script src="/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script
		src="/resources/vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.min.js"></script>
	<script src="/resources/js/jquery.parallax-1.1.3.js"></script>
	<script
		src="/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
	<script src="/resources/vendor/jquery.scrollto/jquery.scrollTo.min.js"></script>
	<script src="/resources/js/front.js"></script>
	
	<!-- 다음지도 api 추가 -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59e90ffa4462049931ee4536f504c27b&libraries=services"></script>
	
	<script src="/resources/datetimepicker/build/jquery.datetimepicker.full.min.js"></script>
	
	<script src="/resources/js/datepicker.js"></script>
	<script src="/resources/js/boardMap/modify_map.js"></script>
	<script src="/resources/js/region.js"></script>
	
	<!-- 지역 선택시 카테고리변경 함수 -->
	<script>
	
	<!-- selectbox값 가져오기 -->
	//selectbox 값을 db에서 가져온다
	var inputVal = "2"; //db에서 받아온값(selctbox option value값)
	var gender = "female";	// db에서 가져온 성별 값
	
	//input[value=""] value에 받아온 gender값을 넣는다.
	$('input:radio[name="gender"]:input[value="female"]').prop("checked", true);
	$("#species").val(inputVal);
	$("#region").val(inputVal);
	var selectRegion =	document.getElementById('region');
	categoryChange(selectRegion);
	$("#sml_region").val("수원시");
	
	
	</script>
	
		
	

</body>
</html>