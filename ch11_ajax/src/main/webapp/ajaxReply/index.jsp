<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int ref = 1;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reply index</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<style>
	body{text-align:center;}
	img{width:700px; margin:20px 0;}
	table{border:2px solid black; width:700px; border-collapse:collapse;}
	td{border:2px solid black;}
</style>
</head>
<body>
	<!-- img 위치가 원글 상세보기 위치 -->
	<img src="../resources/img/fubao.jpg">
	<table id="reply" align="center">
		<thead>
			<tr>
				<td>댓글 작성</td>
				<!--
				<td>
					<textarea rows="3" cols="50" id="replyContent"></textarea>
				</td>
				<td>
					<button onclick="insertReply();">댓글등록</button>
				</td> -->
				
				<!-- 로그인한 사람만 댓글 등록 -->
				<%if(true){ %> <!-- bean을 가져와서 null과 같지않으면도 가능 -->
					<td>
						<textarea rows="3" cols="50" id="replyContent"></textarea>
					</td>
					<td>
						<button onclick="insertReply();">댓글등록</button>
					</td>
				<%}else{ %>
					<td>
						<textarea rows="3" cols="50" readonly>로그인 후 이용 가능한 서비스</textarea>
					</td>
					<td>
						<button disabled>댓글등록</button>
					</td>
				<%} %>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	
	<script>
	$(()=>{
		selectReplyList(); // 실행하면 한번 호출되게
		
		// setInterval()로 하면 새로고침은 되지만 리소스 엄청 먹음
		//setInterval(selectReplyList, 1000); // 1초마다 selectReplyList함수 호출
		// selectReplyList 호출 할때 괄호 안붙여도 됨
	})
	
	function selectReplyList(){ // 댓글이 올라오면 얘가 무조건 호출되게
		$.ajax({
			url:"rlist.bo", // servlet과 연결 / /ajaxReply/rlist.bo
			data:{bnum:<%=ref%>}, // ref값을 bnum에
			success:function(list){ // list는 배열값임.
				console.log(list);
				let result = "";
				for(let i=0; i<list.length; i++){
					result += "<tr>"
						   +	"<td>"+list[i].name+"</td>"
						   +	"<td>"+list[i].content+"</td>"
						   +	"<td>"+list[i].regdate.substring(0,10)+"</td>"
						   +  "</tr>";
				}
				$("#reply tbody").html(result);
			},
			error:function(){
				console.log("댓글목록조회 ajax통신 실패");
			}
		})
	}
	
	function insertReply(){
		$.ajax({
			url:"rinsert.bo", // /ajaxReply/rinsert.bo
			data:{
				bnum:<%=ref %>, // 부모글 번호
				name:"블렌더",
				content:$("#replyContent").val() // 사용자가 replyContent에 입력한 값
			},
			type:"post", // 넘길 컨텐츠 내용이 많을 경우 url보다 post로 넘겨주는게 좋음
			success:function(result){
				console.log(result);
				if(result > 0){ // result값이 0 or 1인데 1이면 성공
					selectReplyList();
					$("#replyContent").val("");
				}
			},
			error:function(){
				console.log("댓글 등록 ajax통신 실패");
			}
		})
	}
	</script>
</body>
</html>