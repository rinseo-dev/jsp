package mem;

import java.sql.*;

import commom.DBConnectionMgr;

public class MemberDao {
	// Dao에는 DBConnectionPool을 사용하고 getInstance()를 가져옴
	private DBConnectionMgr pool;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null; // 쿼리를 넣을 것이므로 변수 생성해줌.
	
	public MemberDao() {
		try { // pool을 try-catch안에 넣어줌
			// class 이름과 동일하게 만들고 DBConnectionMgr에서 Instance()를 가져옴
			pool = DBConnectionMgr.getInstance(); 
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	/*
	 로그인, id체크, 회원가입 할때마다 pool을 통해서 con,pstmt, rs를 사용하므로
	 사용이 끝날때마다 pool로 반납해줘야하기때문에 매번 freeConnectio()이 진행됨
	 */
	// 로그인 
	public boolean loginMember(String id, String pwd) {
		boolean flag = false;
		try {
			con = pool.getConnection(); // connection()을 얻어와서 con에 넣음
			sql = "select id from member where id=? and pwd=?";
				// sql문 ?에는 loginMember메소드인 id, pwd가 들어감 / 사용자가 입력했음
				// ?값이 맞으면 id만 가져오는 sql
				// 물음표?를 사용할 때는 preparedStatement를 사용함
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id); // index1번 = 첫번째 물음표
			pstmt.setString(2, pwd); // index2번 = 두번째 물음표
			rs = pstmt.executeQuery();
			/*
			rs.next(); // 여기선 반환값이 true, false임
			//.next()는 시작 부분의 다음부터 값을 찾으므로 while로 돌려서 사용함
			// 값이 없으면 false.
			*/
			/*
			 id, pwd가 일치하면 rs에 id가 들어와있는 상황.
			 rs.next()를 하면 id의 앞줄을 가리키던 게 rs안쪽의 id를 가리키게 됨
			 rs.next() 값이 있으면 true, 없으면 false값을 반환함 
			 */
			flag = rs.next(); // next()에서 받은 true, false값을 바로 flag에넣음
			// id가 들어오면 true, 아니면 false
			/*
			 여기서 rs.next();는 ResultSet 커서 위치에서 다음행으로 이동하고,
			 해당 행에 값이 존재하면 true를 반환하고 행더이상 없으면(값이 없으면) false를 반환함
			 
			 rs.next()에서 반환된 값 true or false값을 flag에 넣어서 사용하게 됨
			 
			 이 코드에서는 select쿼리를 실행한 결과로 반환된 데이터의 각 행을 확인하기 위헤 next()가 사용됐고
			 행 단위로 데이터를 처리할 수 있게 됨
			 */
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs); // 세개 다 반납
		}
		return flag;
	}
	// id 체크
	public boolean checkId(String id){ // 매개변수로 사용자가 체크한 id
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "select id from member where id=?";
			/*
			 sql = "select id from member where id="+id;
			 1개짜리는 위 구문을 사용해서 statement로 해도 되지만,
			 pstmt 변수 선언해놓은게 있어서 굳이 추가안하고 pstmt로 활용
			 */
			 pstmt = con.prepareStatement(sql);
			 pstmt.setString(1, id);
			 rs = pstmt.executeQuery();
			 
			 flag = rs.next();
			 /*
			 checkId 메서드에 주어진 id 값에 해당하는 회원이 DB에 존재하는지 판단하기 위해 사용됨
			 만약 해당 id의 회원이 존재하면 flag는 true, 아니면 false
			  */
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt, rs);
			// close라는 의미가 아니라 pool로 반환하는 형태
		}
		return flag;
	}
	
	// 회원가입
	public boolean insertMember(Member bean){// 변수이름은 bean 객체는 Member로 받음
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert into member values(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPwd());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getGender());
			pstmt.setString(5, bean.getBirthday());
			pstmt.setString(6, bean.getEmail());
			pstmt.setString(7, bean.getZipcode());
			pstmt.setString(8, bean.getAddress());
			pstmt.setString(9, bean.getDetailAddress());
			
			// hobby는 배열형태이므로 배열로 가져와야 함.
			String hobby[] = bean.getHobby();
			char hb[] = {'0','0','0','0','0'};
			String lists[] = {"음악","여행","게임","영화","운동"};
			if(hobby != null) { // 사용자가 선택을 했다면
				for(int i=0; i<hobby.length; i++) { // 사용자가 선택한 취미 개수만큼 돎
					for(int j=0; j<lists.length; j++) {
						if(hobby[i].equals(lists[j])) {
							hb[j] = '1';
							break;
					// 여기서 break걸어주면 equals에 적합한 값이 나왔을 때 뒤를 더 돌리지 않고 닫음
					// 그러면 다시 i for문이 돌면서 값을 찾음
			/*
				사용자가 여행, 게임을 선택했다면 i for문이 선택한 위치 개수인 2개만큼 돌게 됨
				j에서는 전체 lists의 배열을 돌면서 배열의 내용과 선택된 값이 같은지 확인함
				j가 2번째에서 hobby[1] 여행 글자가 lists[1]여행과 같음을 확인하고
				hb[1] 자리에 '1'을 넣어주고 break로 j for문을 빠져나옴.
				이미 값을 찾았으므로 2,3,4를 돌아야 할 필요가 없음.
				그 다음 i for문을 다시 돌면서 같은 방식으로 hobby[2]의 '게임'과
				lists[2]인 '게임'이 같은지 확인하고 hj[2]도 '1'로 바꿔줌.
				그렇게 3,4까지 돌고 나면 동일단 답은 hb[] = {'0','1','1','0','0'}이 됨
				lists[]에 대입해보면 여행, 게임임
			*/
						}
					}
				}
				
			}
			pstmt.setString(10, new String(hb));
			pstmt.setString(11, bean.getJob());
			
			// select는 executeQuery / DB가 바뀌는 insert, delete, update는 executeUpdate사용
			if(pstmt.executeUpdate() == 1) { // insert가 잘 되었으면 1반환, 안되었으면 0반환
				flag = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			pool.freeConnection(con,pstmt); // 반납. rs는 안썼음
		}
	
		return flag;
	}
	
	
}
