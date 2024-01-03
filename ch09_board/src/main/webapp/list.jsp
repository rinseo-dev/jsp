<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.*, java.util.* " %><!-- board에 담아서 가져옴 -->
<jsp:useBean id="bDao" class="board.BoardDao"/> <!-- DB사용 -->
<%
	// 페이징 처리 변수들
	int totalRecord = 0; // 전체 레코드 수(DB 행의 수)
	int numPerPage = 5; // 페이지당 보여줄 레코드 수
	int pagePerBlock = 5; // 블록당 페이지수 [1][2][3][4][5] -> 하단 페이징
	
	int totalPage = 0; // 전체 페이지 수
	/* 만약 총 글 수가 53, 페이지당 글10개를 보여준다면
	ceil(53/10) = 6으로 [1][2][3][4][5][6]으로 총 6페이지가 존재하게 됨 */

	int totalBlock = 0; // 전체 블록 수
	/* 페이지가 6개라면 블록수는 2개가 됨.
		블록당 페이지수 5를 기준으로 6개 페이지가 나오게 되면 그 다음블록으로 넘어가게
		첫 블록 1 2 3 4 5 > / 두번째 블록 < 6 7 8 9  10 > 이런 형식으로
		뾰족괄호를 통해서 5개 페이지씩 옆으로 이동할 수 있게끔 */
		
	int nowPage = 1; // 현재 해당하는 페이지
	int nowBlock = 1; // 현재 해당하는 블록
	/* 현재 내가 보고 있는 페이지가 1~5면 1블록, 6~10이면 2블록 */
	
	int start = 0; // DB테이블의 select 시작번호(한 페이지에 필요한 만큼 게시물만 가져오기)
	int end = 0; // 가져온 레코드 중에서 10개씩 가져오기(한 페이지에 글10개를 보여줄거니까)
	int listSize = 0; // 현재 읽어온 게시물의 수
	
	// 키필드, 키워드에 대한 값이 들어올 것이므로 변수를 만듦
	String keyField = "", keyWord="";
	if(request.getParameter("keyWord") != null){ // 사용자가 찾기튼을 눌렀다면
		keyField = request.getParameter("keyField");
		keyWord = request.getParameter("keyWord");
	}
	
	// [처음으로]를 누르면 keyField, keyWord를 지워줌
	if(request.getParameter("reload") != null
	   && request.getParameter("reload").equals("true")){ 
		// function에서 list.Frm을 찾고, 문서에서도 list.Frm을 찾음
		keyField ="";
	   	keyWord = "";
	 // 처음으로를 눌렀을때 keyField, keyWord에 비어있는 값을 넣어줌
	}
	
	// 다른 페이지로 이동했다 다시 돌아왔을때와 [처음으로]를 눌렀을때 모두 적용됨
	if(request.getParameter("nowPage") != null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
		// nowPage를 request로 받으면 String 형이라 int로 형변환해줌
	}
	
	totalRecord = bDao.getTotalCount(keyField, keyWord);
	
	start = (nowPage*numPerPage)-numPerPage+1; // 각 페이지당 시작 번호
	end = nowPage*numPerPage;
	totalPage = (int)Math.ceil((double)totalRecord / numPerPage); // 전체 페이지 수
	/* 전체 레코드수 / 10(numPerPage) 하면 총 페이지 개수가 나옴
		단, 무조건 정수형으로 떨어지진 않으므로 계산할 값 중 하나를 double 형으로 가져감*/
		
	nowBlock = (int)Math.ceil((double)nowPage / pagePerBlock); // 현재 블럭 계산
	totalBlock = (int)Math.ceil((double)totalPage / pagePerBlock); // 전체 블럭 계산
	
	/* 페이징에 사용한 산술식은 전부 ceil으로 올림을 사용함 */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List</title>
<style>
	*{margin:0 auto;}
	h2{text-align:center;}
</style>
<script>
	function list(){ // list() function을 실행하면 name=listFrm 을 호출함 - 아래 hidden으로 돼있음
		document.listFrm.action = "list.jsp";
		document.listFrm.submit();
		// submit을 누르게 되면 ch09_board/list.jsp?reload=true&nowPage=1 형식으로 넘어옴
		// 이 reload가 getParemaeter("reload")로 넘어가게 됨 - [처음으로]을 누르면 keyfield어쩌구 그부분
	}
	
	function read(num){ // 제목을 클릭하면 이게 실행되고 num값을 넘겨줌
		// read에 있는 모든걸 넘겨줘야함
		document.readFrm.num.value = num;
		document.readFrm.action = "read.jsp";
		document.readFrm.submit();
		// nanme = readFrm을 찾아서 name=num인 곳에 readFrm.num.value로 받은 값을 넣어줌.
		// 여차저차해서 read.jsp로 넘어감
	}
	
	function pageing(page){
		// readFrm을 만들어서 값을 넘겨받는..
		document.readFrm.nowPage.value = page; // nowPage 값에 현재 페이지를 넘겨줌
		document.readFrm.submit();
	}
	
	function block(value){ // 이전 블록을 하나 넘겨준 상태..?
		document.readFrm.nowPage.value = <%=pagePerBlock %> * (value-1)+1;
		// value = 이전블록 또는 다음 블럭 / 블럭2에서 prev,next가 뜸
		/* 5페이지를 보고 있었을 때 5 * (1-1)+1  => 1부터 시작
		 (value-1)+1는 첫 블럭에서 1을 맞춰주기 위해서임. value가 1일 때 1-1로 0을 만들고
		 페이지블럭과 곱하면 0. 거기에 +1을 해줘서 1페이지 값을 만들어줌 */
		document.readFrm.submit();
		
	}
</script>
</head>
<body>
	<h2>게 시 판</h2>
	<table>
		<tr>
			<td colspan="5">Total : <%=totalRecord %>  Articles(<%=nowPage %> / <%=totalPage %>)</td>
		</tr>
		<tr>
			<th>번 호</th>
			<th>제 목</th>
			<th>이 름</th>
			<th>날 짜</th>
			<th>조회수</th>
		</tr>
		
		
		<%  // DB에서 조회한 결과 보여주기
			ArrayList<Board> alist = bDao.getBoardList(keyField, keyWord, start, end);
			// 조회한 결과를 ArrayList에 담아서 보여줘야함 - java.util필요 import해줌
			
			// ArrayList의 사이즈를 변수 listSize에 넣어서 사용
			listSize = alist.size();
			for(int i=0; i<end;i++ ){ // size()까지 도는 게 아니라 end까지 돎
				if(i==listSize){
					break;
				}
				Board board = alist.get(i);
				int num = board.getNum();
				String name = board.getName();
				String subject = board.getSubject();
				String regdate = board.getRegdate().substring(0,10);
				int count = board.getCount();
				int depth = board.getDepth();
			%>
			<tr>
			<!-- 게시물 리스트를 표시 할 때 가장 번호가 큰 숫자부터 작은숫자 순으로 표시해줌 -->
				<td><%=totalRecord-((nowPage-1)*numPerPage) - i %></td>
				<!-- nowPage가 1이면 1-1로 0*numPerPage가 되므로
					((nowPage-1)*numPerPage)는 시작번호를 가지게 됨
					[1] : 53 - 0 = 53
					[2] : 53 - (2 - 1)*10 = 43 / (2페이지-1)*10이 되는것
					[3] : 53 - (3 - 1)*10 = 33	
				-->
				<td>
					<%
						if(depth > 0){
							for(int j=0; j<depth; j++){
								out.print("&emsp;"); //depth만큼 띄어쓰기
							}
						out.print(">");
						}
					%>
					<a href="javascript:read('<%=num %>');"><%=subject %></a>
					<!-- read를 할 때도 num값을 이용하면 됨. -->
				</td>
				<td><%=name %></td>
				<td><%=regdate %></td>
				<td><%=count %></td>
			</tr>
			<%
			}
		%>
		
		<tr>
			<td colspan="5"><br><br></td>
		</tr>
		<tr>
			<!--  페이징 처리 시작 -->
			<td colspan="3">
			<%
				int pageStart = (nowBlock-1) * pagePerBlock+1; // 어느 블록에 속하는지, 그 블록에 따른 첫번째 페이지
								// nowBlock이 첫번째 블럭이면 1-1로 0이 되고, +1로 1이 되게 함.
				//int pageEnd = pageStart + pagePerBlock;
				int pageEnd = (pageStart + pagePerBlock  -1 <= totalPage) ? pageStart + pagePerBlock -1 : totalPage;
			
				if(totalPage != 0){ // 페이지 앞 뒤로 < > 표시 넣어줄것
					if(nowBlock > 1){%>
						<!-- out.print("<a href='"+(nowBlock-1)+"'>prev...</a>"); -->
						<a href="javascript:block('<%=nowBlock-1%>')">prev...<</a>
					<%}
					for(;pageStart<=pageEnd; pageStart++){ // 첫 조건 자리에 아무것도 안넣으면 '처음부터'
					%>
						<a href="javascript:pageing('<%=pageStart%>')">[<%=pageStart%>]</a>
					<%
					}
					out.print("&nbsp;");
					if(totalBlock > nowBlock){ %>
						<!-- out.print("<a href = '"+(nowBlock+1)+"'>...next</a>"); -->
						<a href="javascript:block('<%=nowBlock+1%>')">>...next</a>&nbsp;
					<%}
				} %>
				
				<!--  
			start .. end
			  [1] .. [5]  => 1블럭
			  [6] .. [10] => 2블럭  2block 11 < 6 // 6+5 = 11 <= 13 이면 현재 페이지 11..?
			 [11] .. [13] => 3블럭  15 <= 13
			 5페이지가 1블록인데 페이지가 15가 아니가 13까지만 존재한다면?
			
			추가설명
			2블럭부터 시작한다고 하면 [6][7][8][9][10]으로 pageStart => 6
			pageStart + pagePerBlock -1 => 10인 상태
		 	for(;pageStart<=pageEnd; pageStart++){는 pageStart는 6, pageEnd는 10이므로 6~10까지가 됨
			
			-->
			</td>
			<!--  페이징 처리 끝 -->
			<td colspan="2">
				<a href="post.jsp">[글쓰기]</a>
				<a href="javascript:list();">[처음으로]</a>
			</td>
		</tr>
		<tr>
			<td colspan="5"><hr></td>
		</tr>
	</table>
	<form method="get" action="list.jsp">
		<table>
			<tr>
				<td align="center">
					<select name="keyField">
						<option value="name">이름</option>
						<option value="subject">제목</option>
						<option value="content">내용</option>
					</select>
					<input name="keyWord" required>
					<input type="submit" value="찾기">
					
					<!-- 현재페이지의 정보를 넘겨줘야 다시 돌아올 수 있음(?) -->
					<!-- <input type="hidden" name="nowPage" value="1"> 남들은 이거 있어도 됨-->
				</td>
			</tr>
		</table>
	</form>
	
	<!-- [처음으로] 누르면 화면 reload -->
	<form method="get" name="listFrm">
		<input type="hidden" name="reload" value="true">
		<!-- <input type="hidden" name="nowPage" value="1"> -->
	</form>

	<form method="get" name="readFrm">
	<!-- post로 넘기면 header로 들어가서 계속 갱신이 되어야 함.
		하지만 값이 바뀌지 않고 고정되기 때문에 get방식으로 변경함.
		get으로 보내면 방식이 갱신이 됨. -->
		<input type="hidden" name="num">
		<input type="hidden" name="nowPage" value="<%=nowPage %>">
		<input type="hidden" name="keyField" value="<%=keyField %>">
		<input type="hidden" name="keyWord" value="<%=keyWord %>">
	</form>

<!-- 테스트용
<a href="post.jsp">글쓰기</a>
<a href="reply.jsp">댓글등록</a>
<a href="update.jsp">수정하기</a>
<a href="read.jsp">글읽기</a>
-->

</body>
</html>