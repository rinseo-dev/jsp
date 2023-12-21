<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>member 회원가입</title>
<script src="script.js" charset="UTF-8"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
// 우편번호 넣기
function findAddr(){
    new daum.Postcode({
        oncomplete: function(data) {
        	let roadAddr = data.roadAddress;	// 도로명 주소
            let jibunAddr = data.jibunAddress;	// 지번 주소
            // 사용자가 검색하면 도로명, 지번주소가 자동으로 들어오게 됨
            let extraAddr = ""; // 확장주소 - 동이름+빌딩이름
            
            document.getElementById('postcode').value = data.zonecode; // 우편번호
            // 찾아온 id의 값에 data.zonecode를 넣어줄 것 - postcode에 zonecode가들어가게 됨
            
            // 사용자가 도로명을 선택하면 도로명주소, 아니면 지번주소를 넣어줌
            if(data.userSelectedType =='R'){ // R = 도로명
            	if(roadAddr != ''){ //roadAddr에 값이 들어있다면
            		if(data.bname != ''){ // 동 이름이 있다면
            			extraAddr += data.bname; // 동이름
            		}
            		if(data.buildingName != ''){ // 빌딩이름이 존재한다면
            			extraAddr += ', ' + data.buildingName; // 빌딩이름을 붙여줌
            		}        		
            	}
            	// 삼항연산자로 주소 연결부분 extraAddr를 붙일지 말지
        		roadAddr += extraAddr != '' ? '('+ extraAddr +')' : '';
        		// 동이나 빌딩명이 있으면(동이름, 빌딩명)으로 뒤에 부착
        		
            	document.getElementById('addr').value = roadAddr;
        		// 도로명(동이름, 빌딩명)을 input에 넣는다
            }else{
            	if(jibunAddr != ''){ //roadAddr에 값이 들어있다면
            		if(data.buildingName != ''){ // 빌딩이름이 존재한다면
            			extraAddr += data.buildingName; // 빌딩이름을 붙여줌
            		}
            	}
            	
            	jibunAddr += extraAddr != '' ? '(' + extraAddr + ')' : '';
            	document.getElementById('addr').value = jibunAddr;
            }
            document.getElementById('detailAddr').focus();
        }
    }).open();
}
</script>
<style>
	* {margin: 0 auto;}
    a {text-decoration: none; color:black;}
	div {width:1100px;}
	table {margin-top: 50px; border-collapse: collapse;}
	table th {text-align:center;}
 	td{height:30px;padding-left:5px;}
</style>
</head>
<body>
	<form action="memberProc.jsp" name="frm">
	  <table border="1">
	    <tr>
	      <th colspan="3"><font size=5em>회원가입</font></th>
	    </tr>
	    <tr>
	      <td>아이디</td>
	      <td>
		      <input name="id" onkeydown="inputIdChk();">
			  <!-- 아이디 중복 확인을 하고 나서 변화가 생기는지를 확인하는 inputIdChk() -->
			  <input type="button" value="ID중복확인" onclick="idCheck(this.form.id.value);">
			  <input type="hidden" name="idBtnCheck" value="idUnCheck">
			  <!-- 기본값은 idUnCheck / 키가 클릭됐을 때 value값이 무조건 idUnCheck가 됨
		      	아이디 중복확인 이후에 키가 입력됐을 때 중복체크가 취소되는 느낌
		      	중복확인이 idUnCheck->idCheck()로 바뀜-->
	      </td>
	      <td>영문과 숫자로만 입력</td>
	    </tr>
	    <tr>
	      <td>비밀번호</td>
	      <td><input type="password" name="pwd"></td>
	      <td>특수기호, 영문, 숫자가 각 1개 이상씩 들어가야 되고 8글자 이상</td>
	    </tr>
	    <tr>
	      <td>비밀번호 확인</td>
	      <td><input type="password" name="repwd"></td>
	      <td>위의 비밀번호를 한번 더 넣으세요</td>
	    </tr>
	    <tr>
	      <td>이름</td>
	      <td><input name="name"></td>
	      <td>한글로 입력</td>
	    </tr>
	    <tr>
	      <td>성별</td>
	      <td>
	        <input type="radio" name="gender" value="1">남&emsp;&emsp;
	        <input type="radio" name="gender" value="2">여
	      </td>
	      <td>성별을 선택해 주세요</td>
	    </tr>
	    <tr>
	      <td>생년월일</td>
	      <td><input name="birthday"></td>
	      <td>6글자로 입력. ex)190315</td>
	    </tr>
	    <tr>
	      <td>Email</td>
	      <td><input type="email"></td>
	      <td>ex) email@naver.com</td>
	    </tr>
	    <tr>
	      <td>우편번호</td>
	      <td>
	      	<input name="zipcode" id="postcode" readonly>
	      	<input type=button value="우편번호찾기" onclick="findAddr();">
	      </td>
	      <td>우편번호를 검색하세요</td>
	    </tr>
	    <tr>
	      <td>주소</td>
	      <td>
	          <input name="address" id="addr" size="60" readonly><br>
	          <input name="detailAddress" id="detailAddr" placeholder="상세주소 넣기">
	      </td>
	      <td>상세주소가 있으면 입력해주세요</td>
	    </tr>
	    <tr>
	      <td>취미</td>
	      <td>
	        <input type="checkbox" name="hobby" value="음악" checked>음악&ensp;
	        <input type="checkbox" name="hobby" value="여행">여행&ensp;
	        <input type="checkbox" name="hobby" value="게임">게임&ensp;
	        <input type="checkbox" name="hobby" value="영화">영화&ensp;
	        <input type="checkbox" name="hobby" value="운동">운동&ensp;
	      </td>
	      <td>취미를 선택하세요</td>
	    </tr>
	    <tr>
	      <td>직업</td>
	      <td>
	        <select name="job">
	          <option value="0" selected> 선택하세요</option>
	          <option value="통장브레이커">통장브레이커</option>
	          <option value="학생">학생</option>
	          <option value="구내식당감별사">구내식당감별사</option>
	        </select>
	      </td>
	      <td>직업을 선택하세요</td>
	    </tr>
	    <tr>
	      <td colspan="3" align="center">
	        <input type="button" value="회원가입" onclick="inputCheck();">&emsp;
	        <input type="reset" value="다시쓰기">&emsp;
	        <input type="button" value="로그인" onClick="location.href='login.jsp'">
	      </td>
	    </tr>
	  </table>
  </form>
</body>
</html>