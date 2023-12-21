package ch05;

import java.sql.*;

public class OracleDBTest1 {
	public static void main(String[] args) {
		Connection con;
		try {
			// Class.forName("com.mysql.jdbc.Driver");
			Class.forName("oracle.jdbc.OracleDriver");
			// JDBC에서 Class.forName()메소드는 DB 드라이버 클래스를 로드하는 데 사용됨 -> 결과적으로 DB연결
			// forName()메소드는 java에서 동적으로 클래스를 로드하기 위해 사용되는 메소드
			// forName()메소드에 들어온 매개변수를 로드해서 Class객체를 반환하는 역할을 함. java reflection 기능 중 하나
			
			/*
				선생님 답변 : forName()메소드 안에 들어온 매개변수의 이름을 읽어냄.
				forName()에는 static이 달려있음-그래서 따로 정의하지 않아도 사용 가능
				'Class'라는 클래스 안에 forName()메소드가 정의되어 있는 상태.
			*/
			
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","aie","aie");
			// DriverManager는 JDBC에서 DB드라이브를 관리하고 DB연결을 생성하기 위한 유틸리티 클래스
			// getConnection()메서드를 사용해서 DB연결을 생성함. DB연결을 위한 정보인 URL, username, password를 사용
			System.out.println("Success");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}