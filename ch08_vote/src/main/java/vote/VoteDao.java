package vote;

import java.sql.*;
import java.util.ArrayList;

public class VoteDao {
	// Dao에는 DBConnectionPool을 사용하고 getInstance()를 가져옴
	private DBConnectionMgr pool;
	Connection con = null;
	Statement stmt = null;
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
	
	// 설문 등록하기
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
			if(result==1) { // 잘 되었다면 - update한게 1과 같으면 업데이트가 잘 된 상태
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
				flag = true; // result, result2가 모두 잘 실행된 경우 flag가 true가 됨
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
			/*
			pstmt = con.prepareStatement();
			rs = pstmt.executeQuery(sql);
			*/
			rs = con.createStatement().executeQuery(sql);
			
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
			pool.freeConnection(con,stmt,rs);
		}
		return alist;
	}
	
	// 설문 투표할 질문(1행) 가져오기
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
			
			rs = con.createStatement().executeQuery(sql);
			
			if(rs.next()) {
				vlist.setQuestion(rs.getString("question")); // 받아온 값 중에서 question가져오기
				vlist.setType(rs.getInt("type"));
				vlist.setActive(rs.getInt("active"));
				// 인덱스 번호가 아니라 값 이름??으로 가져옴
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,stmt,rs);
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
				
				num = getMaxNum(); // 아래 getMaxNum()메소드가 추가 생성됐음
			}
			
			/*
			sql = "select item from voteItem where listnum=?";
			// 여기 물음표 값에는 사용자가 넣은 설문 값의 개수 중에 하나가 들어옴
			// DB에서 listnum에 맞는 값만 가져오게 됨
			preaparedStatement에서 Statement로 바뀌어서 이것 저것 다 사라짐
			 */
			sql = "select item from voteItem where listnum="+num;
			rs = con.createStatement().executeQuery(sql);
			/*
			사라짐
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery(); // num값(번호)에 해당가는 executeQuery()값이 rs에 들어가게됨
			*/
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
			pool.freeConnection(con, stmt, rs);
		}
		return alist;
	}
	
	// 투표로 count 증가
	public boolean updateCount(int num, String[] itemnum) {
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "update VoteItem "
				+ "set count = count+1 "
				+ "where listnum=? and itemnum=?"; // +1로 카운트값 늘려줌
			pstmt = con.prepareStatement(sql);
			
			if(num == 0) {
				num = getMaxNum();
				// if가 0일 때 num에는 가장 큰 max값읋 넣음
			}
			
			// for문을 돌면서 num에 해당하는 값들을 돌려봄
			// listnum과 itemnum이 둘 다 pk이므로 둘 값이 모두 체크 됐을 때 count가 올라감
			for(int i=0; i<itemnum.length; i++) {
				if(itemnum[i] == null || itemnum[i].equals("")) {
					break;
					// null이거나 값이 없을 때 break로 for문 빠져나오기
				}
				
				pstmt.setInt(1, num);
				pstmt.setInt(2, Integer.parseInt(itemnum[i]));
				int result = pstmt.executeUpdate(); // update를 한 결과를 int형에 넣어줌
				if(result > 0) {
					flag = true;
				}
			}
		
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt);
		}
		
		return flag;
	}
	
	// listnum에 해당하는 전체 count얻어오기
	public int sumCount(int num) {
		int count = 0;
		
		try {
			con = pool.getConnection();
			sql = "select sum(count) from VoteItem where listnum=?";
					// 테이블에서 count 합계를 가져옴
			pstmt = con.prepareStatement(sql);
			if(num == 0) {
				pstmt.setInt(1, getMaxNum());
			}else {
				pstmt.setInt(1, num);
			}
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return count;
	}
	
	// listnum에 해당하는 각각의 item, count값 얻어오기
	public ArrayList<VoteItem> getView(int num){
		ArrayList<VoteItem> alist = new ArrayList<VoteItem>();
		try {
			con = pool.getConnection();
			sql = "select item, count from VoteItem where listnum = ?";
			// sql문을 실행하면 select한 결과로 item, count를 모아둔 테이블이 생성됨
			pstmt = con.prepareStatement(sql);
			
			if(num == 0) {
				pstmt.setInt(1, getMaxNum());
			}else {
				pstmt.setInt(1, num);
			}
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				VoteItem vitem = new VoteItem();
				// Bean에 item은 배열 count는 int로 되어 있음
				/*
				 vitem으로 빈 객체를 생성함.
				 -------
				 	0     count
				   null   item
				    0     itemnum
				    0     listnum
				 -------
				 */
				
				String[] item = new String[1];
				// 배열 한개만 있어도 값을 표현할 수 있음
				// 1개짜리 item이라는 배열을 만듦
				item[0] = rs.getString(1); // 1번은 컬럼의 인덱스번호로 item을 가리킴
				// item[0]번인 배열에 rs.getString(1)값을 넣음.
				vitem.setItem(item);
				vitem.setCount(rs.getInt(2)); // 2번은 count
				// VoteItem부터 여기까지는 객체를 만들었고 아래 add로 넣어줌.
				alist.add(vitem);	
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return alist; // 주소가 저장되어 있는 alist만 가져감
		// get(0)하면 alist에 있는 0번 인덱스 값을 가져오게 되는 것
	}
	
	
	// VoteList중에서 num이 가장 큰 값 얻어오기
	public int getMaxNum() { // getMaxNum()메소드를 사용하면 가장 큰 값을 가져올 수 있게 됨
		int maxNum = 0;
		
		try {
			con = pool.getConnection();
			sql = "select max(num) from votelist"; // maxNum을 구하기 위한 sql
			// sql문에서는 가장 큰 num값 하나가 들어와있는 상태
			/*
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			이 두 줄을 아래 한줄로 합침 */
			rs = con.createStatement().executeQuery(sql);
			if(rs.next()) { // rs에 들어와있는 값이 true이면. 값이 있다면
				maxNum = rs.getInt(1); // DB 인덱스번호는 1번부터이므로 첫 컬럼을 지칭함.
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,stmt,rs);
		}
		
		return maxNum;
	}
	
}