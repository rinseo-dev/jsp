package ch05;

import java.sql.*;

public class OracleDBTest2 {
	public static void main(String[] args) {	
		Connection con;
		try {
			// Class.forName("com.mysql.jdbc.Driver");
			Class.forName("oracle.jdbc.OracleDriver"); // try-catch문 안에 넣어야 함
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","aie","aie");
			System.out.println("Success");
			
			// 아래 두 줄은 결과값을 가져옴
			Statement st = con.createStatement(); // 여기서 결과를 가져오고
			/*
			 createStatement() : Connection 객체에서 호출하여 Statement객체를 생성하는 메소드
			 Statement객체를 생성하면 해당 Statement객체를 사용하여 SQL문을 DB에 보낼 수 있음
			 
			 Statement : JDBC에서 SQL문을 실행하기 위한 인터페이스.
			 SQL 문을 실행하고 결과를 반환하는 역할을 하는 인터페이스.
			 단순한 SQL문을 실행할 때 사용하지만 SQL injection공격에 취약해서
			 보안에 민감한 경우 PreparedStatement를 사용하는것을 권장
			 */
			
			ResultSet rs = st.executeQuery("select * from department"); // 여기 저장해서 표현..?
			/* ResultSet은 JDBC에서 DB로부터 쿼리 결과를 받아오는 인터페이스.
			 여기서는 select된 값을 가져와서 rs변수에 넣은거겠지?
			 executeQuery() : JDBC statement객체를 사용해 DB에 SQL쿼리를 실행하고
			 그 결과를 ResultSet객체로 받아오는 메서드. 주로 SELECT 쿼리를 실행할 때 사용됨.
			 */
		
			
			// while문은 조건이 true인 동안 특정한 블록을 반복적으로 실행하는 java 제어문
			// re.next()로 rs에 다음 조건이 있을 때 반복 수행되고 rs값이 없으면 멈춤
			while(rs.next()) {
				String id = rs.getString(1); // rs에 있는 값 중 첫번째 행 값을 가져옴
				String title = rs.getString(2);
				String location = rs.getString(3);
				System.out.println(id + ", " + title + ", " + location);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}