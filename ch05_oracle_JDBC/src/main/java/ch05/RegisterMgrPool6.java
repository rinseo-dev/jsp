package ch05;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class RegisterMgrPool6 {
	/*
	private final String JDBC_DRIVER = "oracle.jdbc.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER  = "aie";
	private final String PASS  = "aie";
	이 내용이 모두 DBConnectionPool.java에 있음
	*/
	private DBConnectionMgr pool = null; // DBConnectionMgr을 사용하기 위해 선언
	
	public RegisterMgrPool6() {
		try {
			pool = DBConnectionMgr.getInstance(); // 클래스이름.getInstance();
		}catch(Exception e) {
			System.out.println("거넥션 얻어오기 실패");
		}
	}

	public ArrayList<EmployeeBean5> getEmpList(){
		ArrayList<EmployeeBean5> alist = new ArrayList<EmployeeBean5>();
		// ArrayList를 만들어서 alist에 넣어서 사용
		
		try {
			//Connection con = DriverManager.getConnection(JDBC_URL, USER, PASS);
			// getConnection에 있는 값들을 ConnectionPool에서 가져오게 함
			Connection con = pool.getConnection();
			Statement st = con.createStatement(); // sql statement를 import
			String query = "select emp_id, emp_name, email, phone, salary, hire_date from employee";
			//String query = "select * from employee";
			ResultSet rs = st.executeQuery(query);
			while(rs.next()) {
				EmployeeBean5 bean = new EmployeeBean5(); // bean객체를 만들어서 값을 넣어줌
				/*
				String id = rs.getString(1);
				bean.setEmp_id(id); // 결과로 받은 id값을 괄호안에 넣어줌
				위 두 줄을 하나로 합칠것
				*/
				
				//인덱스번호로 생성하면 순서를 꼭 맞춰줘야함.
				bean.setEmp_id(rs.getString(1));
				bean.setEmp_name(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setPhone(rs.getString(4));
				bean.setSalary(rs.getInt(5));
				bean.setHire_date(rs.getString(6));
				
				// getString()에
				/*
				bean.setEmail(rs.getString("email"));
				bean.setPhone(rs.getString("phone"));
				bean.setEmp_id(rs.getString("emp_id"));
				bean.setSalary(rs.getInt("salary"));
				bean.setHire_date(rs.getString("hire_date"));
				bean.setEmp_name(rs.getString("emp_name"));
				*/
				
				alist.add(bean); // 가져온 행의 개수만큼 bean이 생성됨. 총 데이터 행 개수만큼
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return alist;
	}
}
