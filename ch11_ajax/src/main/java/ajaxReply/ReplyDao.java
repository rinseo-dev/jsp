package ajaxReply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;


public class ReplyDao {
	private DBConnectionMgr pool;
	Connection con = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	public ReplyDao() {
		try {
			pool = DBConnectionMgr.getInstance(); 
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
										// data:{bnum:<%=ref %>}
	public ArrayList<Reply> getReplyList(int ref){ // ref는 bnum에 해당하는 값
		// reply객체를 행마다 하나씩 가져와서 Array에 담음
		
		ArrayList<Reply> alist = new ArrayList<Reply>();
		try {
			con = pool.getConnection();
			sql = "select * from reply where ref = ? order by no desc";
			// 날짜 원하는 형식으로 가져오려면 아래 방식으로 사용해도 됨.
			//"select no, content, name, TO_CHAR(regdate, 'YYYY-MM-DD') where ref=? order by no desc";
			// 위 sql문으로 사용하려면 ref값을 안가져오는 4개짜리 생성자를 사용하면 됨
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,ref); // 누구에게 댓글을 달건지 부모의 값이 ref
			//pstmt.executeQuery();
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				/*
				Reply bean = new Reply();
				bean.setNo(rs.getInt(1));
				bean.setName(rs.getString(2));
				..
				alist.add(bean);
				이렇게 작성해도 되지만, 생성자를 이용하는 방법도 있음.
				Reply Bean에 생성자로 no, content~regdate까지 모두 가져오게함
				*/
				/*
				Reply bean = new Reply();
				bean.setNo(rs.getInt(1));
				bean.setContent(rs.getString(2));
				bean.setRef(rs.getInt(3));
				bean.setName(rs.getString(4));
				bean.setRegdate(rs.getString(5));
			
				list.add(bean);
				*/
				
				//Reply(int no, String content, String name, String regdate)
				
				alist.add(new Reply(rs.getInt(1),
									   rs.getString(2),
									   rs.getInt(3), // 4개짜리 sql문에선 이게 필요 없음
									   rs.getString(4),
									   rs.getString(5)));
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return alist; // ArrayList<Reply> 이게 반환형
	}
	
	public int insertReply(Reply bean) {
		int result = 0;
		try {
			con = pool.getConnection();
			sql = "insert into reply values(seq_reply.nextval, ?, ?, ?, sysdate)";
			// bean에서 ?에 넣을 값 가져옴
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getContent());
			pstmt.setInt(2, bean.getRef());
			pstmt.setString(3, bean.getName());
			// content, ref, name은 DB의 순서와 같음
			result = pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt);
		}
		
		return result;
	}
	
}
