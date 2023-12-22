package vote;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class VoteDao {
	// Dao에는 DBConnectionPool을 사용하고 getInstance()를 가져옴
	private DBConnectionMgr pool;
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null; // 쿼리를 넣을 것이므로 변수 생성해줌.
	
	public VoteDao() {
		try { // pool을 try-catch안에 넣어줌
			// class 이름과 동일하게 만들고 DBConnectionMgr에서 Instance()를 가져옴
			pool = DBConnectionMgr.getInstance(); 
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 설문 등록하기 ?? 깃허브
	public boolean voteInsert(VoteList vlist, VoteItem vitem) {
					// Bean으로 만든 2가지를 변수를 지정해서 가져옴.
		boolean flag = false;
		try {
			con = pool.getConnection(); // connection()을 얻어와서 con에 넣음
			sql = "insert into votelist values(seq_vote.nextval, ?, ?, ?, sysdate, ?, default)";
				// 1번 ? 자리에 vlist에 있는 question
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, vlist.getQuestion()); // index1번 = 첫번째 물음표
			pstmt.setString(2, vlist.getSdate()); // index2번 = 두번째 물음표
			pstmt.setString(3, vlist.getEdate());
			pstmt.setInt(4, vlist.getType());
			
			int result = pstmt.executeUpdate();
			//잘됐으면 1, 아니면 0
			
			int result2 = 0;
			if(result==1) { // 잘 되었다면
				sql = "insert into voteitem values(seq_vote.currval, ?, ?, default)";
				// vlist에 있는 num값이 listnum값으로 넘어옴..?
				// 물음표?는 voteitem테이블에 itemnum이 됨.
				// 첫번째 물음표는 아이템 넘버
				// item에는 사용자가 넣은 값이 들어감
				pstmt = con.prepareStatement(sql);
				String item[] = vitem.getItem();
				// item에는 여러값이 들어오므로 배열로 처리
				for(int i=0; i<item.length; i++) {
					if(item[i] == null || item[i].equals("")) {
						break; // null이거나 같은 값이 없을 때 if문을 빠져나가게
					}
					
					pstmt.setInt(1, i);
					pstmt.setString(2, item[i]);
					result2 = pstmt.executeUpdate();
				}
			}
			if(result2 == 1) { // 잘 된 경우
				flag = true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt); // 세개 다 반납
		}
		return flag;
	}
	// 전체 설문 목록 가져오기
	public ArrayList<VoteList> getList(){
		ArrayList<VoteList> alist = new ArrayList<VoteList>();
		
		try {
			con = pool.getConnection();
			sql = "select * from votelist order by num desc";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				VoteList vlist = new VoteList();
				vlist.setNum(rs.getInt(1)); // index번호로 써줌
				vlist.setQuestion(rs.getString(2));
				vlist.setSdate(rs.getString(3));
				vlist.setEdate(rs.getString(4));
				alist.add(vlist);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return alist;
	}
	
	// 설문 투표할 1개 질문 가져오기
	public VoteList getOneVote(int num) {
		VoteList vlist = new VoteList();
		try {
			con = pool.getConnection();
			
			// num이 0과 같다면, int형임. 아무것도 들어온게 없다면 가장 최신의 답을 반환
			if(num == 0) {
				sql = "select * from voteList order by num desc";
			}else {
				//sql = "select * from voteList where num=?";
				sql = "select * from voteList where num="+num;
			}
			// 물음표 안쓰는 이유가 뭐 오류가 발생한다고..? if문 true엔 없는데 else엔 있어서?
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vlist.setQuestion(rs.getString("question")); // 받아온 값 중에서 question가져오기
				vlist.setType(rs.getInt("type"));
				vlist.setActive(rs.getInt("active"));
				// 인덱스 번호가 아니라 값 이름??으로 가져옴
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return vlist;
	}
	
	// 설문 투표할 질문의 item 가져오기
	//public ArrayList<VoteItem> getItem(int num){
		//ArrayList<VoteItem> alist = new ArrayList<VoteItem>();
	public ArrayList<String> getItem(int num){ // 문자 하나만 가져올거라서 String으로 바꿈
		// item에 있는 문자만 가져오기 위해서 String으로 사용.
		// 전체적인 값을 가져와서 문자를 추출하려면 ArrayList<VoteItem>써야했음.
		/*
		데이터에 보면 num값 1에 대한 행이 여러개여서 문자열로 가져옴.
		String형이어서 객체를 만들어줌. 그 객체의 주소를 ArrayList에 넣는것.
		만약 1번에 대답한 값이 4개라면 ArrayList엔 4개의 주소가 들어감
		*/
		ArrayList<String> alist = new ArrayList<String>();
		// 여기서 String은 num의 가장 높은 값을 가져오는 것.???
		try {
			con = pool.getConnection();
			if(num == 0) { // 사용자가 설문을 선택하지 않으면 num=0을 넘겨줌
				sql = "select max(num) from votelist";
				// 0이 넘어오면 가장 최신의 설문을 보여줄것
				// num중에 가장 큰 값을 테이블에서 검색해옴
				// votelist에서 가장 큰 num값을 가진걸 가져와서 아래 if문 num에 넘겨줌
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				// Max는 값이 1개니까 while문 필요 없음
				if(rs.next()) {
					num = rs.getInt(1); // 테이블 검색 결과 가장 큰 값을 num에 넣어줌
					// 덮어쓰기로 하고 가장 큰 값이 들어올때만 뭐..?
				}
			}
			sql = "select item from voteItem where listnum=?";
			// 여기 물음표 값에는 사용자가 넣은 설문 값의 개수 중에 하나가 들어옴
			// DB에서 listnum에 맞는 값만 가져오게 됨
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery(); // num값(번호)에 해당가는 executeQuery()값이 rs에 들어가게됨
			while(rs.next()) {
				alist.add(rs.getString(1));
				/*
				만약 num 1번에 공부, 여행, 데이트가 선택되어있다면,
				String 객체에 '공부'가 들어온다면 alist에 공부가 들어감
				rs.next()가 없을 때 까지 계속 반복을 돌게 되므로
				list목록에는 공부, 여행, 데이트가 모두 반환됨
				*/
			}
			
			/*
			while(rs.next()) {
				VoteItem vi = new VoteItem();
				vi.setItem(rs.getString("item"));
			}
			alist.add(vi); 이렇게 해주면 ArrayList<VoteItem>를 사용할 수 있음
			*/
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			
		}
		return alist;
	}
}