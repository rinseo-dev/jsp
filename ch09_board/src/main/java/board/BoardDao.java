package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class BoardDao {
	/* 첫번째 작성 */
	private DBConnectionMgr pool;
	Connection con = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public BoardDao() {
		try {
			pool = DBConnectionMgr.getInstance(); 
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/* 두번째 작성 */
	// 글쓰기 등록
	public boolean insertBoard(Board board) {
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert into board values"
				+ "(seq_board.nextval,?,?,?,0,seq_board.currval,0,sysdate,?,?,default)";
			// 물음표? 순서대로 입력되니까 순서를 지켜줘야 함
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getName()); // 첫번째 물음표에 board에서 name을 얻어와서 넣어줌
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getPass());
			pstmt.setString(5, board.getIp());
			// pstmt.executeUpdate(); 이걸 아래 조건문으로 넣어줌.
			/*
			 pstmt.executeUpdate();를 그대로 쓰려면 int형에 넣어줘야 함
			 int result = pstmt.executeUpdate()
			 if(result == 1)
			  	flag = true;
			 이렇게 사용 할 수 있음
			 */
			
			if(pstmt.executeUpdate() == 1)
				flag = true;
			// false가 반환이 됐다면 '입력이 안됐다'는 알림이 뜨게 할 수 있음.
			// 하지만 false여도 DB에는 입력이 됨.
			
			/* 챗gpt답변
			  pstmt.executeUpdate() == 1 조건은
			  SQL문이 실행되고 영향을 받은 행이 1개인 경우에만 조건이 참이 됨.
			  한 행이 추가(insert)되었다는것을 의미함.
			  받은 행이 0이라면(행의 추가, 수정, 삭제가 없는 경우) false가 되는 것.
			  추가된 값이 있을 때, 즉 삽입 작업이 성공적으로 이뤄진 경우 flag를 true로 바꿔줌.
			 */
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt);
		}
		return flag;
	}
	
	/* 세번째 작성 */
	// 조회수 증가 - read.jsp와 연결됨.
	public void upCount(int num) { // return값 없어서 void
		try {
			con = pool.getConnection();
			sql = "update board set count = count+1 where num="+ num;
			con.createStatement().executeUpdate(sql);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,stmt);
		}
	}
	
	/* 네번째 작성 */
	// 게시물 상세보기
	public Board getBoard(int num) {
		// Board board = new Board(); 이렇게도 되지만 null값 줘도 됨
		Board board = null;
		
		try {
			con = pool.getConnection();
			sql = "select * from board where num="+ num;
			rs = con.createStatement().executeQuery(sql);
			/*Board board = new Board(); 사용할 때 방법
			if(rs.next())
				board.setNum(rs.getInt(1)); << 이걸 종류대로 11개 써야 함.
			*/
			if(rs.next()) {
				// 생성자를 호출해서 사용한 방법 
				board = new Board(rs.getInt(1), // rs.getInt("num"),
								  rs.getString(2), // rs.getString("name") 이렇게 작성해도 됨
								  rs.getString(3),
								  rs.getString(4),
								  rs.getInt(5),
								  rs.getInt(6),
								  rs.getInt(7),
								  rs.getString(8),
								  rs.getString(9),
								  rs.getString(10),
								  rs.getInt(11));
						
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,stmt,rs);
		}
		return board;
	}
	
	
	/* 다섯번째 작성 */
	// 게시물 삭제 -  delete.jsp에서 deleteBoard(num)로 num이 넘어옴
	public boolean deleteBoard(int num) {
		boolean flag = false; 
		try {
			con = pool.getConnection();
			sql = "select count(*) from board where ref =" + num;
					// 댓글이 있는지 확인
					/*ref = num => 개수(1개) -> 삭제
							    => 개수(2개이상) - > 삭제 안됨*/
			rs = con.createStatement().executeQuery(sql);
			/*if(rs.next()) {
				
				int result = rs.getInt(1);
				if(result == 1) {
					sql = "delete from board where num="+num;
					result = con.createStatement().executeUpdate(sql);
					
					if(result == 1)
						flag = true;
				}
			}
			 */
			if(rs.next()) {
				if(rs.getInt(1) <= 1) {
					sql = "delete from board where num="+num;
					if(con.createStatement().executeUpdate(sql) == 1)
						flag = true;
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		return flag;
	}
	
	/* 여섯번째 작성*/
	// 게시물 수정하기
	public void updateBoard(Board board) {
		try {
			con = pool.getConnection();
			sql = "update board set subject=?, content=? where num=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,board.getSubject()); // 받아온 곳(board)에서 getSubject
			pstmt.setString(2,board.getContent());
			pstmt.setInt(3,board.getNum());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt);
		}
	}
	
	/* 일곱번째 작성 */
	// 답글 위치값 증가
	public void replyUpBoard(int ref, int pos) {
		try {
			con = pool.getConnection();
			sql = "update board set pos = pos+1 where ref=? and pos > ?";
			// sql 구문 자체가 들어온 두번째 ?(pos)값이 기존 pos보다 작은지를 확인 해야 함.
			/*
			 답글은 부모가 갖고 있는 글 보다 pos가 큼.
			 ref가 12, pos가 0인 원 글에 답글을 달면
			 ref12, pos1 인 글이 추가 됨.
			 pos1인 글에 다시 답글을 단다면 ref12, pos2가 되는 것
			 */
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, pos);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		
	}
	
	/* 여덟번째 작성*/
	// 게시물 답글 등록
	public void replyBoard(Board board) {
		try {
			con = pool.getConnection();
			sql = "insert into board "
				+ "values(seq_board.nextval,?,?,?,?,?,?,sysdate,?,?,default)";
			
			//"insert into board values(seq_board.nextval,?,?,?,?,?,?,sysdate,?,?,default)";
			
			int pos = board.getPos() + 1;
			int depth = board.getDepth() + 1;
			// 답글이 달릴 때 pos와 depth가 하나식 증가하도록..?
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getName());
			pstmt.setString(2, board.getSubject());
			pstmt.setString(3, board.getContent());
			pstmt.setInt(4, pos);
			pstmt.setInt(5, board.getRef());
			pstmt.setInt(6, depth); // pos, depth는 변수에서 +1로 해놓은 값을 가져와서 사용
			pstmt.setString(7, board.getPass());
			pstmt.setString(8, board.getIp());
			
			pstmt.executeUpdate();
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
	}		
	
	
	/* 아홉번째 */
	// 게시물의 총 개수
	public int getTotalCount(String keyField, String keyWord) {
		int totalCount = 0;
		try {
			con = pool.getConnection();
			
			// keyField는 선택을 안해도 이름이 들어옴
			if(keyWord.equals("null") || keyWord.equals("")){
				sql = "select count(num) from board";
				pstmt = con.prepareStatement(sql);
			}else {
				sql = "select count(num) from board where " + keyField + " LIKE ?";
				// keyField 앞 뒤로 띄어쓰기 필요함. 붙여서 쓰면 sql구문이 한 단어로 인식함
				// %A% 를 사용하면 내용에 A가 포함되는 모든 것을 찾을 수 있음
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%"+keyWord+"%"); // %keyWord% 여야하므로 띄어쓰기X
			}
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				totalCount = rs.getInt(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return totalCount;
	}
	
	/* 열번째 */
	// 전체 게시글 또는 검색한 게시글 리스트 목록
	// -> 여러 값이 넘어오므로 ArrayList로
	public ArrayList<Board> getBoardList(String keyField, String keyWord, int start, int end) {
		ArrayList<Board> alist = new ArrayList<Board>();
		try {
			con = pool.getConnection();
			if(keyWord.equals("null") || keyWord.equals("")) {
				/*
				sql = "select * from board "
					+ "where ROWNUM >= ? AND ROWNUM <= ? " // 1?:start, 2?:end
					+ "order by ref desc, pos ";
				 */
				// ROWNUM으로 가져와서 정렬해야 하는데 order by가 뒤에서 실행되므로 서브쿼리 필요
				// select * from board order by ref desc, pos; 이걸로 정렬을 먼저 하고
				// where ROWNUN >= ? AND ROWNUM <= ? 를 해줘야 함
				sql = "select * from(select * from board order by ref desc, pos) "
					+ "where ROWNUM >= ? AND ROWNUM <= ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			}else {
				sql = "select * from(select * from board order by ref desc, pos) "
					+ "where ROWNUM >= ? AND ROWNUM <= ? AND " + keyField + " LIKE ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				pstmt.setString(3,"%"+keyWord+"%");
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setNum(rs.getInt("num"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setPos(rs.getInt("pos"));
				board.setRef(rs.getInt("ref"));
				board.setDepth(rs.getInt("depth"));
				board.setRegdate(rs.getString("regdate"));
				board.setCount(rs.getInt("count"));
				alist.add(board);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		return alist;
	}
	
	
	/* 기본 형태 */
	//
	public boolean Board(Board board) {
		boolean flag = false; 
		try {
			con = pool.getConnection();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		return flag;
	}
}
