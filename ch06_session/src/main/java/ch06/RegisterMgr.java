package ch06;

import java.sql.*;

public class RegisterMgr {
	private DBConnectionMgr pool = null; // DBConnectionMgr을 사용하기 위해 선언
	
	public RegisterMgr() {
		try {
			pool = DBConnectionMgr.getInstance(); // 클래스이름.getInstance();
		}catch(Exception e) {
			System.out.println("커넥션 얻어오기 실패");
		}
	}
	
	// 내가 필요한 select, insert, delete, update등을 메소드로 정의
	public boolean login(String id, String pw) { // 아이디랑 패스워드를 매개변수로 받음
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean loginFlag = false;  // 리턴으로 받아올 변수
		try {
			con = pool.getConnection();
			String query = "select count(*) from member where mem_id=? and mem_pw=?";
			// 여기는 데이터베이스와 동일하게 입력해야 함
			// count(*)에 아이디랑 패스워드가 같은게 있으면 1이 들어옴
			
			//String query = "select count(*) from member where mem_id="+id+" and mem_pw="+pw;
			// Statement를 사용하면 이렇게 작성해야 하는데 끊어가는 부분이 있어서 비효율적
			
			pstmt = con.prepareStatement(query); // sql statement를 import
			// 물음표 자리만 제외하고 나머지를 compile을 해놓은 상태 - prepareStatement(query);
			
			/*
			 Statement는 컴파일한 쿼리를 보내서 데이터베이스에서 검색 
			 prepareStatement는 물음표 부분만 제외하고 미리 컴파일을 하고나서 물음표값을 가져옴
			 */
			
			// 물음표? 자리에 들어갈 1번은 id값, 2번은 pw값
			pstmt.setString(1,id); // 사용자가 입력한 물음표 값1
			pstmt.setString(2, pw); // 사용자가 입력한 물음표 값2
			rs = pstmt.executeQuery();
			if(rs.next() && rs.getInt(1) > 0) { // 위 query에서 count(*)값이 여기서 사용됨
			// 제일 처음 들어온 값이 0보다 크면 or 값이 존재하면 rs.getInt(1) == 1 이것도 가능. 값이 존재하면 1이고 없으면 0이므로
				loginFlag = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt, rs); // 반납
		}
		
		return loginFlag;
	}
}
