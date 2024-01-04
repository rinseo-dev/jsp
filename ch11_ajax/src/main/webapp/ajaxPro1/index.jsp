<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax-index</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
</head>
<body>
	<h1>AJAX개요</h1>
	<p>
		Asynchronous JavaScript And XML의 약자로<br>
		서버로부터 데이터를 가져와 전체 페이지를 새로 고치지 않고 일부만 로드할 수 있게 하는 기법<BR>
		
		* 동기식 / 비동기식<br>
		> 동기식(a, form, submit)
		<ul>
			<li>요청 처리 후 그에 해당하는 응답페이지가 돌아와야만 그 다음 작업 가능</li>
			<li>서버에 요청한 결과까지의 시간이 지연되면 무작정 계속 기다려야됨(흰페이지로 보여짐)</li>
			<li>전체 페이지를 응답해주기 때문에 기본적으로 페이지가 깜박거림</li>
		</ul>
		
		> 비동기식 (ajax)
		<ul>
			<li>현재 페이지를 그대로 유지하면서 중간중간마다 추가적으로 필요한 요청을 보내 줄 수 있음</li>
			<li>요청을 보냈다고 해서 다른 페이지로 넘어가지 않음 (현재 페이지 그대로 유지)</li>
			<li>요청 보내놓고 그에 해당 하는 응답 (데이터)이 돌아올때 까지 현재페이지에서 다른 작업을 할 수 있음</li>
			<li>페이지가 깜박거리지 않음</li>
		</ul>
		ex) 실시간 급상승 검색어 로딩, 검색어 자동완성, 아이디 중복체크, 찜하기/해제하기, 추천, 댓글, 무한스크롤링 (페이징 대체) 등등...
		<br><br>
		
		* 비동기식의 단점 <br>
		- 현재 페이지에 지속적으로 리소스가 쌓임 => 페이지가 느려질 수 있음 <br>
		- 에러 발생시 디버깅 어려움 <br>
		- 요청 처리 후에 돌아온 응답데이터를 가지고 현재페이지에 새로운 요소를 만들어서 뿌려줘야 함 => dom요소들을 새롭게 만들어내는 구문을 잘익혀둬야됨
		<br><br>
		
		* AJAX 구현 방식 => 순수 JavaScript방식 / jQuery방식(코드가 간결하고 사용하기 쉬움)
	</p>
	
	<pre>
	* jQuery방식으로 AJAX통신
	
	$.ajax({
		속성명:속성값,
		속성명:속성값,
		속성명:속성값,
		...
	});

	$.ajax({
	    url : "요청할 url" (action url),
	    type : "전송 방식" (get, post방식), // type 기본값은 get
	    data : "요청시 전달할 값",
		// 부수적인 속성들 여기에 넣으면 됨
	    success : function(data){
	        전송에 성공하면 실행될 코드;
	    },
	    error:function(){
	        전송에 실패하면 실행될 코드;
	    },
		// complete : function(){} 이건 잘 사용되지 않음
		
	})

	* 주요속성
	- url : 요청할 url(필수속성)
	- type|mothod : 요청전송방식(get/post)
	- data : 요청시 전달할 값
	- success : ajax통신이 성공했을 때 실행할 함수 정의
	- error : ajax 통신이 실패했을 때 실행할 함수 정의
	- complete : ajax 통신의 성공과 실패에 상관없이 무조건 실행할 함수 정의
	
	* 부수적인속성
	- async : 서버와의 비동기 처리 방식 설정 여부(기본값 true:비동기)
	- contentType : request의 데이터 인코딩 방식 정의(보내는 측의 데이터 인코딩)
	- dataType : 서버에서 response로 오는 데이터의 데이터 형 설정, 값이 없다면 스마트하게 판단함
				xml - 트리 형태의 데이터 구조
				json - 맵 형식의 데이터 구조(일반적인 데이터 구조)
				script - javascript 및 일반 String 형태 데이터
				html - html 태그 자체를 return 하는 방식
				text - String 데이터
	- accept : 파라미터의 타입을 설정 (사용자 특화 된 파라미터 타입 설정 가능)
	- beforesend : ajax 요청을 하기 전 실행되는 이벤트 callback 함수 (데이터 가공 및 header 관련 설정)
	- cache : 요청 및 결과값을 scope에서 갖고 있지 않도록 하는 것 (기본값 true)
	- contents : JQuery에서 response의 데이터를 파싱하는 방식 정의
	- context : ajax 메소드 내 모든 영역에서 파싱 방식 정의
	- crossDomain : 타 도메인 호출 가능 여부 설정(기본값 false)
	- dataFilter : response를 받았을 때 정상적인 값을 return 할 수 있도록 데이터와 데이터 타입 설정
	- global : 기본 이벤트 사용 여부(ajaxstart, ajaxstop) (버퍼링 같이 시작과 끝을 나타낼 때, 선처리 작업)
	- password : 서버에 접속 권한(비밀번호)이 필요한 경우
	- processData : 서버로 보내는 값에 대한 형태 설정 여부(기본 데이터를 원하는 경우 false설정)
	- timeout : 서버 요청 시 응답 대기 시간(milisecond)
	</pre>
	
	<h1>jQuery 방식을 이용한 AJAX 테스트</h1>
	<h3>1. 버튼 클릭시 get방식으로 서버에 요청 및 응답</h3>
	
	입력 : <input id="input1">&emsp;
		  <button id="btn1">전송</button> <!-- 기본타입 submit -->
	응답 : <span id="output1">현재 응답 없음</span>
	
	<script>
	// 중괄호로 넘겨준건 객체.
	// 키:값 형태로 넘어가고 있음
		$(()=>{
			$("#btn1").click(function(){
				/*
				<form action="ajax1.do" method="get">
					<input id="input1">
					<button>전송</button>
				여기서 action은 url과 연결되고 input안에 들어간 값은 val()로 가져옴
				method방식은 type으로 표현
				*/
				$.ajax({ // AjaxController1.servlet과 연결됨
					url:"ajax1.do",
					data:{input:$("#input1").val()}, // 사용자가 넣은 값
					// AjaxController1에서 str로 data에 'input' 값을 가져옴
					type:"get", // 안써도 get방식
					
			// success, error, complete는 java의 try-catch-finally와 같음
					success:function(result){
						console.log("ajax 통신 성공");
						console.log(result);
						$("#output1").text(result);
					},
					error:function(){
						console.log("ajax 통신 실패")	
					},
					complete:function(){
						console.log("ajax통신과 상관없이 무조건 출력");
					}
				})
			})
		})
	</script>
	
	<h4>*idCheck하기</h4>
	<!--
		1번 - 클릭으로 아이디 체크
	<form action="idCheck.me" method="get" name="regFrm">
		<p>아이디 <input name="id" id="id" required>
				<input type="button" value="ID중복확인" onclick="idCheck();">
		</p>
		<input type="submit" value="회원가입" disabled>
	</form>
	
	<script>
		//$(()=>{
		function idCheck(){
			//jQuery에서 사용하는 변수라는 표시로 $를 붙임. 안붙여도 됨
			/*
			const $idInput = $("form input[name=id]");
			form아래 input중 속성이 name=id인것을 찾아옴
			*/
			const $idInput = $("#id"); // #id값 input에 추가해줌
			$.ajax({
				url:"idCheck.me", // action주소값
				// mapping값은 ajaxPro1/idCheck.me 이렇게 넣음
				data:{checkId:$idInput.val()},// 중괄호 안쪽에도 키:값 형태
				success:function(result){ // 성공했을 때 값을 result에 받아줌
					console.log(result);
					if(result == 'idN'){
						alert("이미 사용중이거나 탈퇴한 아이디 입니다");
						$idInput.val("");
						$idInput.focus();
						// 중복 아이디가 존재하면 input박스를 비워주고 focus넣어줌
					}else{
						if(confirm("사용가능한 아이디 입니다. 사용하시겠습니까?")){
							$("form :submit").removeAttr("disabled");
							// form애 submit이 구동(?)해서 확인(yes)하면 disabled값을 삭제함
							
							$idInput.attr("readonly",true);
							// 한번 ok되면 못바꾸게.. 이렇게 사용하는 경우는 없다고 함
						}else{
							$idInput.focus();
						}
					}
				},
				error:function(){
					console.log("아이디 중복체크 ajax통신 실패");
				}
			})
		}
	</script> -->
	
	<!-- 키 입력(3글자 이상)으로 중복 체크 하기 / 깃허브-->
	<form action="idCheck.me" method="get" name="regFrm" id="enrollFrm">
		<p>아이디 <input name="id" id="id" required>&emsp;</p>
		<div id="checkResult" style="font-size:0.8em; display:none">
		</div>
		<input type="submit" value="회원가입" disabled>
		<input type="reset">
	</form>
	
	<script type="text/javascript">
	$(()=>{
		const $idInput = $("#id");
		$idInput.keyup(function(){ // keyup은 소문자 / keydown도 가능
			// 최소 3글자 이상 입력되었을 때 ajax요청으로 중복체크
			if($idInput.val().length>=3){ // 1글자부터 체크하려면 if문 없어도 됨
				$.ajax({
					url:"idCheck.me", // /ajaxPro1/idCheck.me
					data:{checkId:$idInput.val()},
					// 사용자가 입력한 아이디값을 checkId로 AjaxIdCheckController에 넘겨줌
					success:function(result){
						if(result == "idN"){
							$("#checkResult").show();
							$("#checkResult").css("color","red")
											 .text("이미 사용중이거나 탈퇴한 아이디 입니다");
							$("#enrollFrm :submit").attr("disabled",true);
						}else{
							$("#checkResult").show();
							$("#checkResult").css("color","green")
											 .text("사용 가능한 아이디 입니다");
							$("#enrollFrm :submit").attr("disabled",false);
						}
					},
					error:function(){
						console.log("아이디 중복체크 ajax통신 실패");
					}
				})
			} else{
				// input창에 2글자 이하가 입력된 경우
				$("#checkresult").hide();
				$("#enrollFrm :submit").attr("disabled",true);
			}
		})	
	})
	</script>
	
	<h3>2. 버튼 클릭시 post방식으로 서버에 여러개의 데이터 전송 및 응답</h3>
	
	이름 : <input id="input2_1"><br>
	나이 : <input type="number" id="input2_2"><br>
	<button onclick="test2();">전송</button><br>
	
	<!-- ver1
	응답 : <label id="output2"></label>
	
	<script>
		 function test2(){
			$.ajax({
				url:"ajax2.do",
				data:{
					name:$("#input2_1").val(),
					age:$("#input2_2").val()
				},
				type:"post",
				success:function(value){ // value는 변수 이름
					$("#output2").text(value); // 받아온 value값 넣어줌.
				},
				
				error:function(){
					console.log("ajax통신 실패");
				}
			}) 
	 
		 }
	</script>
	 -->
	 
	 응답 : 
	 <ul id="output2">
	 </ul>
	 <script>
	 	function test2(){
	 		$.ajax({
				url:"ajax2.do",
				data:{
					name:$("#input2_1").val(),
					age:$("#input2_2").val()
				},
				type:"post",
				success:function(value){ // value는 변수 이름
					
					// ver2. 로 받았을 때 하나의 문자열로 들어옴
					// console.log(value); // 찍어보면 김22 처럼 이름나이 붙어서 하나의 문자열로 나옴
					// console.log(value.name); // 이미 value라는 하나의 문자열이 돼서 name도 따로 뽑을 수 없음
					
					// ver3. JSONArray로 받았을 때 - 인덱스번호 사용가능
					/*
					console.log(value);
					console.log(value[0]);
					console.log(value[1]);
					
					const output = "<li>"+ value[0] +"</li>"
								 + "<li>"+ value[1] +"</li>";
					*/
					
					// ver4. JSONObject로 받았을 때
					console.log(value); // {키:값, 키:값}형태로 출력
					console.log(value.name); // 받아온 값을 하나씩 뽑을 수 있음
					console.log(value.age);
					const output = "<li>"+ value.name +"</li>"
								 + "<li>"+ value.age +"</li>";
					
					$("#output2").html(output);
				},
				
				error:function(){
					console.log("ajax통신 실패");
				}
			}) 
	 	}
	 </script>
	 
	 <h3>3. 서버에 데이터 전송 후, 조회된 bean객체를 응답데이터로</h3>
	 검색하고자 하는 회원번호 ID : <input id="input3">
	 <button onclick="test3();">조회</button>
	 
	 <div id="output3"></div>
	 
	 <script type="text/javascript">
	 	function test3(){
			$.ajax({
				url : "ajax3.do",
				data : {id:$("#input3").val()}, // 키가 id
				success:function(result){
					console.log(result);
					
					// value는 controller3에서 가져온 jObj값들
					/*
					const value = "***** 검색 결과 *****<br>"
								+ "ID : " + result.userId + "<br>"
								+ "이름 : " + result.userName + "<br>"
								+ "성별 : " + result.gender + "<br>"
								+ "이메일 : " + result.email + "<br>";
					*/
					// GSON으로 출력
					const value = "***** 검색 결과 *****<br>"
						+ "ID : " + result.id + "<br>"
						+ "이름 : " + result.name + "<br>"
						+ "성별 : " + result.gender + "<br>"
						+ "이메일 : " + result.email + "<br>";
					$("#output3").html(value);
					//#output3에 html로 value값 넣기
				},
				error:function(){
					console.log("ajax통신 실패")
				}
			})	 		
			
	 	}
	 </script>
	 
	 <h3>4. 응답 데이터로 조회된 여러 bean 객체들이 담겨있는 ArrayList 받기</h3>
	 
	 <button onclick="test4();">회원 전체 조회</button><br>
	 
	 <table id="output4" border="1">
	 	<thead>
	 		<th>ID</th>
	 		<th>이름</th>
	 		<th>성별</th>
	 		<th>EMAIL</th>
	 	</thead>
	 	<tbody>
	 		
	 	</tbody>
	 </table>
	 
	 <script>
	 	function test4(){ // controller4에서 ArrayList<Member>로 가져옴
	 		$.ajax({
	 			url:"ajax4.do",
	 			success:function(result){ // result에 ArrayList가 들어옴
	 				console.log(result);
	 				
	 				let value="";
	 				for(let i=0; i<result.length; i++){
	 					value += "<tr>"
	 						  + "	<td>" + result[i].id + "</td>"
	 						  + "	<td>" + result[i].name + "</td>"
	 						  + "	<td>" + result[i].gender + "</td>"
	 						  + "	<td>" + result[i].email + "</td>"
	 						  + "</tr>";
	 				}
	 				$("#output4 tbody").html(value);
	 			},
	 			error:function(){
	 				console.log("ajax 통신 실패");
	 			}
	 		})
	 		
	 	}
	 </script>
</body>
</html>