<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Search Hospital</title>
	<meta name="description" content="">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="robots" content="all,follow">

	<!-- 평점 별  -->
	<link rel="stylesheet" href="/resources/css/hospital/star.css">
	<!-- 평점 별  -->
	
	<link rel="stylesheet" href="/resources/css/hospital/main_search.css">
	<link rel="stylesheet" href="/resources/css/commons/kakaomap.css">
	<script src="/resources/js/region.js"></script>
	

</head>

<%@ include file="/WEB-INF/views/commons/link.jspf" %>
<body>
	
	<%@ include file="/WEB-INF/views/commons/top.jspf"%>
	
	<div class="container" id="totalHtml">

		<div class="container">
			<div class="row">
				<div class="col-md-12" style="background-color: #38A7BB;">
					<div class="card-body">
						<div class="row pb-2">
							<div class="col-md-12">
								<h4>Search Hospital</h4>
							</div>
						</div>
						<div class="row">
							<div class="col-md-3">
								<div class="form-group">
									<select id="region" onchange="categoryChange(this)" class="form-control">
										<option value="0">지역</option>
										<option value="1">서울</option>
										<option value="2">경기</option>
										<option value="3">인천</option>
										<option value="4">강원</option>
										<option value="5">대전</option>
										<option value="6">세종</option>
										<option value="7">충남</option>
										<option value="8">충북</option>
										<option value="9">부산</option>
										<option value="10">울산</option>
										<option value="11">경남</option>
										<option value="12">경북</option>
										<option value="13">대구</option>
										<option value="14">광주</option>
										<option value="15">전남</option>
										<option value="16">전북</option>
										<option value="17">제주</option>
									</select>
								</div>
							</div>
							<div class="col-md-3">
								<div class="form-group">
									<select id="sml_region" class="form-control">
										<option value="0" selected>시 / 군 / 구</option>
									</select>
								</div>
							</div>

							<input id="emergency" type="checkbox"> 응급진료

							<div class="col-md-3">
								<button type="button" id="hos_search" class="btn btn-primary btn-block" style="background-color: gray;">Search</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<br>

		<!-- 지도 화면 시작-->
				<div class="container">
					<div class="map_wrap">
						<div id="map" style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
					</div>
					<br>
					<!-- 지도 화면 끝 -->
					<div id="content">
						<div class="container">
								<div class="row">
									<div class="col-md-12">
										<div class="hospital_list">
											<h2>PET Hospital List</h2>
										</div>
										
										<p class="lead"></p>
										<div class="row text-center" id="hospList">
											
											
										</div>
										<!-- 번호   -->
										<div aria-label="Page navigation" class="d-flex justify-content-center">
											<ul class="pagination" id="paging">
												
           									</ul>
       									 </div>
									</div>
								</div>				
							</div>
						</div>
					</div>
				</div>

	<!-- /////////////////////////////////// 지  도  //////////////////////////////////////// -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=59e90ffa4462049931ee4536f504c27b&libraries=services"></script>
	<script src="/resources/js/hospital/hospital.js"></script>

	<!-- Javascript files-->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>
	<script src="/resources/vendor/popper.js/umd/popper.min.js"> </script>
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<script src="/resources/vendor/jquery.cookie/jquery.cookie.js"> </script>
	<script src="/resources/vendor/waypoints/lib/jquery.waypoints.min.js"> </script>
	<script src="/resources/vendor/jquery.counterup/jquery.counterup.min.js"> </script>
	<script src="/resources/js/jquery.parallax-1.1.3.js"></script>
	<script src="/resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
	<script src="/resources/vendor/jquery.scrollto/jquery.scrollTo.min.js"></script>
	
	<script>
	//지역 시/군 을 저장할 변수
	var region = '';
	
	//지도 api 선택한 곳 마커 표시하기(주소까지 출력)
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
 	mapOption = {
   	  center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
  	   level: 3 // 지도의 확대 레벨
	 };  

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 

	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	var marker = new kakao.maps.Marker();
	// 마커를 담을 배열입니다
	var markers = [];

	// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
	var bounds = new kakao.maps.LatLngBounds(); 
	
	var infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(map, marker,name,address_name,hours) {
		
		var content = '<div class="bAddr"><span class="title">' + name + '</span><div>주소 : '+address_name+'</div><div>진료시간 : '+hours+'</div></div>';

	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}
	
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}
	// 마커를 찍는 함수
	function createMarker(fa,ga, imgsrc,name,addr,hours){
		// 마커 이미지의 이미지 크기 입니다
		   var imageSize = new kakao.maps.Size(35, 35); 
		// 마커 이미지를 생성합니다    
	  	  var markerImage = new kakao.maps.MarkerImage(imgsrc, imageSize);
	 	// 마커를 생성합니다
	    var marker = new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	        position: new kakao.maps.LatLng(ga, fa),
	        image : markerImage // 마커 이미지 
	    });
	  //마커 클릭시 병원이름, 병원주소가 나오는 클릭이벤트.
		kakao.maps.event.addListener(marker, 'mouseover',function(){
			displayInfowindow(map, marker,name,addr,hours);
		});
		kakao.maps.event.addListener(marker, 'mouseout',function(){
			infowindow.close();
		});
	  //마커 배열에 현재마커를 추가
		markers.push(marker);
	}
		
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	//var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	//검색된 마커들 위치로 지도를 재조정
	function setBounds(){
		map.setBounds(bounds);
	}
	//페이지 버튼 클릭 이벤트
	function pageClick(page){
		gethospital(region, $('#emergency').prop('checked') ,page);
	}
	//-- check hash
	function checkForHash() {	
		//뒤로가기를 했으면
		if(document.location.hash)
		{
		//hash 가 있다면 ^ 를 구분자로 하나씩 string을 추출하여 각각 페이지정보를 가져옵니다.
			var str_hash = document.location.hash;
			str_hash = str_hash.replace("#","");
			var back=str_hash.split("^");
						
			// 지역 변수에 뒤로가기전에 검색했던 지역을 저장
			region = back[0];
			setSelectbox($('#region').val());
			
			$('#sml_region').val(decodeURI(back[0]));
			console.log(back[0]);
			//ajax콜 날릴 함수
			gethospital(back[0],$('#emergency').prop('checked'),back[1]);
		} 
		else 
		{
			//nothing..asdfsadfsadfsfad
		}
	}
function setSelectbox(val){
 		console.log('setselect');
 		var seoul = ["종로구", "중구", "용산구", "성동구", "광진구", "동대문구", "중랑구", "성북구", "강북구", "도봉구", "노원구", "은평구", "서대문구", "마포구", "양천구", "강서구", "구로구", "금천구", "영등포구", "동작구", "관악구", "서초구", "강남구", "송파구", "강동구"];
        var gyeonggi = ["수원시", "수원시 장안구", "수원시 권선구", "수원시 팔달구", "수원시 영통구", "성남시", "성남시 수정구", "성남시 중원구", "성남시 분당구", "의정부시", "안양시", "안양시 만안구", "안양시 동안구", "부천시", "광명시", "평택시", "동두천시", "안산시", "안산시 상록구", "안산시 단원구", "고양시", "고양시 덕양구", "고양시 일산동구", "고양시 일산서구", "과천시", "구리시", "남양주시", "오산시", "시흥시", "군포시", "의왕시", "하남시", "용인시", "용인시 처인구", "용인시 기흥구", "용인시 수지구", "파주시", "이천시", "안성시", "김포시", "화성시", "광주시", "양주시", "포천시", "여주시", "연천군", "가평군", "양평군"];
        var inchun = ["중구", "동구", "미추홀구", "연수구", "남동구", "부평구", "계양구", "서구", "강화군", "옹진군"];
        var kangwon = ["춘천시", "원주시", "강릉시", "동해시", "태백시", "속초시", "삼척시", "홍천군", "횡성군", "영월군", "평창군", "정선군", "철원군", "화천군", "양구군", "인제군", "고성군", "양양군"];
        var daejeon =["동구", "중구", "서구", "유성구", "대덕구"];
        var saejong = ["반곡동", "소담동", "보람동", "대평동", "가람동", "한솔동", "나성동", "새롬동", "다정동", "어진동", "종촌동", "고운동", "아름동", "도담동", "조치원읍", "연기면", "연동면", "부강면", "금남면", "장군면", "연서면", "전의면", "전동면", "소정면"]
        var chungnam =['천안시', '천안시 동남구', '천안시 서북구', '공주시', '보령시', '아산시', '서산시', '논산시', '계룡시', '당진시', '금산군', '부여군', '서천군', '청양군', '홍성군', '예산군', '태안군'];
        var chungbuk =['청주시', '청주시 상당구', '청주시 서원구', '청주시 흥덕구', '청주시 청원구', '충주시', '제천시', '보은군', '옥천군', '영동군', '증평군', '진천군', '괴산군', '음성군', '단양군'];
        var busan = ['중구', '서구', '동구', '영도구', '부산진구', '동래구', '남구', '북구', '해운대구', '사하구', '금정구', '강서구', '연제구', '수영구', '사상구', '기장군'];
        var ulsan = ['중구', '남구', '동구', '북구', '울주군'];
        var kyungnam=['창원시', '창원시 의창구', '창원시 성산구', '창원시 마산합포구', '창원시 마산회원구', '창원시 진해구', '진주시', '통영시', '사천시', '김해시', '밀양시', '거제시', '양산시', '의령군', '함안군', '창녕군', '고성군', '남해군', '하동군', '산청군', '함양군', '거창군', '합천군'];
        var kyungbuk =['포항시', '포항시 남구', '포항시 북구', '경주시', '김천시', '안동시', '구미시', '영주시', '영천시', '상주시', '문경시', '경산시', '군위군', '의성군', '청송군', '영양군', '영덕군', '청도군', '고령군', '성주군', '칠곡군', '예천군', '봉화군', '울진군', '울릉군'];
        var daegu = ['중구', '동구', '서구', '남구', '북구', '수성구', '달서구', '달성군'];
        var gwangju=['동구', '서구', '남구', '북구', '광산구'];
        var jeonnam=['목포시', '여수시', '순천시', '나주시', '광양시', '담양군', '곡성군', '구례군', '고흥군', '보성군', '화순군', '장흥군', '강진군', '해남군', '영암군', '무안군', '함평군', '영광군', '장성군', '완도군', '진도군', '신안군'];
        var jeonbuk =['전주시', '전주시 완산구', '전주시 덕진구', '군산시', '익산시', '정읍시', '남원시', '김제시', '완주군', '진안군', '무주군', '장수군', '임실군', '순창군', '고창군', '부안군'];
        var jeju=['제주시', '서귀포시'];
        //지역 마다 변경될 카테고리
        var target = document.getElementById("sml_region");
       //지역(큰범위) 카테고리의 option value 값을 비교
        if(val == "1") var d = seoul;
        else if(val == "2") var d = gyeonggi;
        else if(val == "3") var d = inchun;
        else if(val == "4") var d = kangwon;
        else if(val == "5") var d = daejeon;
        else if(val == "6") var d = saejong;
        else if(val == "7") var d = chungnam;
        else if(val == "8") var d = chungbuk;
        else if(val == "9") var d = busan;
        else if(val == "10") var d = ulsan;
        else if(val == "11") var d = kyungnam;
        else if(val == "12") var d = kyungbuk;
        else if(val == "13") var d = daegu;
        else if(val == "14") var d = gwangju;
        else if(val == "15") var d = jeonnam;
        else if(val == "16") var d = jeonbuk;
        else if(val == "17") var d = jeju;
       
        target.options.length = 0;
       //var d=seoul 일때 seoul 배열의 갯수만큼 변경되는 카테고리안에 <option value=seoul[x]>seoul[x]</option> 태그를 추가
       //여기서 x는 인덱스
        for (x in d) {
          var opt = document.createElement("option");
          opt.value = d[x];
          opt.innerHTML = d[x];
          
          //<option value=seoul[x]>seoul[x]</option> 태그를 추가
          target.appendChild(opt);
        } 
		
	}
	</script>
	<script>
	$(document).ready(function(){
		
		//-- 문서가 로드 될때마다 hash 체크  뒤로가기를 위한 함수
		checkForHash();

		//--click 이벤트를 걸어 이벤트가 발생할때마다 현재 페이지를 내부링크처럼 hash에 저장해둡니다.
		
		
		

		$('#hos_search').click(function(event){
			if($('#sml_region').val()=="0" || $('#region').val()=="0" ){
				
				alert('지역을 선택해 주세요.');
			}
			else{
				region = $('#sml_region').val();
				gethospital(region,$('#emergency').prop('checked') ,1);
			}
		});
	});
	//$('#sml_region') 지역구 카테고리로 검색하고 병원리스트 가져오는 함수.
	function gethospital(addr, isEmer,page){
		$('#hospList').empty();
		$('#paging').empty();
		 $.ajax({
			url:'/hospital/search/'+addr+'/'+isEmer+'/'+page,
			type:'GET',
			contentType:'application/json; charset=UTF-8',
			dataType:'json',
			success:function(data){
				console.log(page);
				
				// 지도에 표시되고 있는 마커를 제거합니다
			    removeMarker();
				//console.log(data.length);
				//좌표 객체 초기화
				bounds = new kakao.maps.LatLngBounds(); 
				$.each(data.list, function(index, item){
					
					console.log('리스트불러오는중');
					geocoder.addressSearch(item.hospital_addr, function(result, status){
						
				        //응급지료가능 병원일경우 마커 이미지교체
				        if(item.isEmergency == 1){
				    		 createMarker(result[0].x, result[0].y, "/resources/img/placeholder_red.png",item.hospital_name, item.hospital_addr ,item.hospital_hours);
				        }
				        else{
				        	
							/* //새로운 마커를 찍음						
							var marker = new kakao.maps.Marker();
							//마커 위치설정
							marker.setPosition(new kakao.maps.LatLng(result[0].y, result[0].x));
							//마커 찍음
							marker.setMap(map); */
				        	// 마커 이미지의 이미지 크기 입니다
				     		createMarker(result[0].x, result[0].y,"/resources/img/placeholder.png",item.hospital_name, item.hospital_addr ,item.hospital_hours);
				        }
						
						// LatLngBounds 객체에 좌표를 추가합니다
					    bounds.extend(new kakao.maps.LatLng(result[0].y, result[0].x));
						
						//console.log('index='+index);
						//표시된 마커들로 지도를 재조정하는 함수
						setBounds();
						//병원 리스트 지도 밑에 출력
						var output='';
						output += '<div data-animate="fadeInUp" class="col-md-3">';
						output += '<div class="team-member">';
						output += '<div class="image">';
						output += '<a href="'+item.hospital_name+'">';
						output += '<img src="/resources/img/hospital/'+item.hospital_img+'" alt="" class="img-fluid rounded-circle" style="height: 250px;"></a>';
						output += '</div>';
						output += '<h4 style="font-size: 25px;">';
						output += '<a href="/hospital/'+item.id+'"name="link">'+item.hospital_name+'</a></h4>';
						output += '<p style="font-size: 25px;">★★★★★</p>';
						output += '<div class="text">';
						output += '<div>'+item.hospital_addr+'</div>'
						output += '<div>'+item.hospital_phone+'</div>';
						output += '</div></div></div>';
						$('#hospList').append(output);
						
						//병원 상세보기를 클릭했을때 발생하는 이벤트
						$('a[name=link]').click(function(e) {
							//상세보기를 눌렀을때의 페이지
							var currentPage=page;
													

							//상세보기를 누르기 전에 불러왔던 페이지 정보와 지역정보를 hash에 저장
							document.location.hash = "#" + region + "^"+currentPage;

						});
						
						
					});
				});
				//페이징 처리 반복문
				for(var i = data.paging.startPage; i<=data.paging.endPage; i++){
					var output='';
					if(i == data.paging.startPage){
						output += '<li class="page-item"><a href="#" class="page-link" onclick="pageClick('+1+')"> <i class="fa fa-angle-double-left"></i></a></li>';
						if(page != 1){
							output += '<li class="page-item"><a href="#" class="page-link" onclick="pageClick('+(page-1)+')"> <i class="fa fa-angle-left"></i></a></li>';
						}
					}
					output += '<li class="page-item"id="page'+i+'"><a href="#" class="page-link" onclick="pageClick('+i+');">'+i+'</a></li>';
					if(i == data.paging.endPage){
						if(page != data.paging.realEnd){
							output += '<li class="page-item"><a href="#" class="page-link" onclick="pageClick('+(page+1)+')"> <i class="fa fa-angle-right"></i></a></li>';
						}
						output += '<li class="page-item"><a href="#" class="page-link" onclick="pageClick('+data.paging.realEnd+')"> <i class="fa fa-angle-double-right"></i></a></li>';
					}
					$('#paging').append(output);
					$("#page"+page).attr('class','page-item active');
				}
				
				
				
			},
			error:function(){
				alert("ajax 통신 실패!!!");
			}
		 });
		//window.location.href = "/hospital/search"+"?"+$.param({"hospital_addr":addr});
	}
	
	</script>
</body>
</html>