<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>My page</title>
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

<link rel="stylesheet" href="/resources/css/mypage.css">
<script src="/resources/js/mypage.js"></script>
</head>

<body>
	<div id="all">

		<%@ include file="/WEB-INF/views/commons/top.jspf"%>

		<div id="heading-breadcrumbs">
			<div class="container">
				<div class="row d-flex align-items-center flex-wrap">
					<div class="col-md-7">
						<h1 class="h2">My page</h1>
					</div>
					<div class="col-md-5">
						<ul class="breadcrumb d-flex justify-content-end">
							<li class="breadcrumb-item"><a href="index.html">Home</a></li>
							<li class="breadcrumb-item active">My page</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<!-- 테이블 -->
		<div id="content">
			<div class="container">
				<div class="row bar mb-0">
					<div class="col-lg-3 mt-4 mt-lg-0" padding-left="2cm">
						<!-- CUSTOMER MENU -->
						<div class="panel panel-default sidebar-menu">
							<div class="panel-heading">
								<h3 class="h4 panel-title">Customer section</h3>
							</div>
							<div class="panel-body">
								<ul class="nav nav-pills flex-column text-sm">
									<li class="nav-item"><a href="/mypage/modifyForm"
										class="nav-link active">회원정보수정</a></li>
									<li class="nav-item"><a href="/mypage/message"
										class="nav-link">쪽지함</a></li>
									<li class="nav-item"><a href="/mypage/question/list"
										class="nav-link">문의하기</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<h3 class="margin-bottom">회원정보 수정</h3>
						<div class="tile-body">
							<form>
								<table class="col-md-12">
									<tr style="height: 1.5cm;">
										<td class="font-grey"><label class="control-label col-md-8">이메일</label></td>
										<td style="padding-right:15px;"><input type="text" value="yelim615@google.com"
											readonly class="form-control" name="email"></td>
									</tr>
									<tr style="height: 1.5cm;">
										<td rowspan="3" class="font-grey"><label class="control-label col-md-10">비밀번호</label></td>
										<td style="padding-right:15px;"><input type="password" placeholder="기존비밀번호 입력"
											class="form-control" name="ex_pw"></td>
									</tr>
									<tr style="height: 1.5cm;">
										<td style="padding-right:15px;"><input type="password" placeholder="새 비밀번호 입력"
											class="form-control" name="new_pw">
									</tr>
									<tr style="height: 1.5cm;">
										<td style="padding-right:15px;"><input type="password" placeholder="새 비밀번호 확인"
											class="form-control" name="new_pw_check">
									</tr>
									<tr style="height: 1.5cm;">
										<td class="font-grey"><label class="control-label col-md-8">닉네임</label></td>
										<td style="padding-right:15px;"><input type="text" value="땡이누나" class="form-control" name="nickname"></td>
									</tr>
									<tr style="height: 1.5cm;">
										<td class="font-grey"><label class="control-label col-md-8">휴대폰</label></td>
										<td><input type="button" value="휴대폰인증">
										<input type="hidden" value="" name="phone"></td>
									</tr>
									<tr style="height: 1.5cm;">
										<td class="font-grey"><label class="control-label col-md-8">주소</label></td>
										<td><div><input type="text" name="address"
											style="width: 70%; height: 0.961cm;"><button class="btn btn-template-main" onclick="openMap(this.form)"
											><i class="fa fa-search"></i></button></div></td>
									</tr>
									<tr style="height: 1.5cm;">
										<td class="font-grey"><label class="control-label col-md-8">성별</label></td>
										<td><label class="form-check-label"
											style="margin-left: 20px; margin-right: 30px;"> <input
												class="form-check-input" type="radio" name="gender">여자
										</label> <label class="form-check-label"> <input
												class="form-check-input" type="radio" name="gender">남자
										</label></td>
									</tr>
									<tr style="height: 1.5cm;">
										<td class="font-grey"><label class="control-label col-md-12">프로필사진</label></td>
										<td><input type="file" name="picture" class="form-check-label"></td>
									</tr>
									<tr style="height: 1.5cm;">
										<td class="font-grey"><label class="control-label col-md-8">관심사</label></td>
										<td><label class="form-check-label"
											style="margin-left: 20px; margin-right: 30px;"> <input
												class="form-check-input" type="radio" name="interest">강아지
										</label> <label class="form-check-label"
											style="margin-left: 20px; margin-right: 30px;"> <input
												class="form-check-input" type="radio" name="interest"">고양이
										</label> <label class="form-check-label"
											style="margin-left: 20px; margin-right: 30px;"> <input
												class="form-check-input" type="radio" name="interest"">기타
										</label></td>
									</tr>
								</table>
								<div class="box-footer d-flex flex-wrap align-items-center justify-content-between" style="margin-top:30px;">
									<div class="left-col">
										<a href="" class="btn btn-secondary mt-0" id="deleteUser">회원
											탈퇴</a>
									</div>

									<div class="right-col">
										<a href="" class="btn btn-outline-primary" id="modifyUser">수정하기<i
											class="fa fa-save"></i></a>
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
	<script src="/resources/vendor/popper.js/umd/popper.min.js"></script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/vendor/jquery.cookie/jquery.cookie.js"></script>
	<script src="/resources/vendor/waypoints/lib/jquery.waypoints.min.js"></script>
	<script
		src="/resources/vendor/jquery.counterup/jquery.counterup.min.js"></script>
	<script src="/resources/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script
		src="/resources/vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.min.js"></script>
	<script src="/resources/js/jquery.parallax-1.1.3.js"></script>
	<script
		src="/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
	<script src="/resources/vendor/jquery.scrollto/jquery.scrollTo.min.js"></script>
	<script src="/resources/js/front.js"></script>
</body>
</html>