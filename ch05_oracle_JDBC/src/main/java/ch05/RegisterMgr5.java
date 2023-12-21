package ch05;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class RegisterMgr5 {
	// 데이터베이스 url, id, db를 변수에 넣어주면 추후에 수정하기 편함
	// 바뀔 일이 없는 값들은 final로 처리해줌
	private final String JDBC_DRIVER = "oracle.jdbc.OracleDriver";
	private final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
	private final String USER  = "aie";
	private final String PASS  = "aie";
	
	public RegisterMgr5() {
		try {
			Class.forName(JDBC_DRIVER);
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	/*
	 forName()은 try-catch문으로 감싸는 것이 일반적임.
	 이 예외는 주로 해당 클래스가 존재하지 않을 경우에 발생하며
	 에외처리를 통해서 해결하게 됨 
	 */
	
	// 내가 필요하니 select, insert, delete, update등을 메소드로 정의
	
	/*
	1명분의 데이터를 Bean으로 만듦.
	Bean1에는 emp_id가 200인 사람의 모든 정보가 들어옴
	그 다음 사람은 Bean2,3,..로 만들어지고 데이터의 총 데이터 수만큼 만들어짐
	
	여러 값을 담으려면 배열을 사용해야 하지만 현재 EmployeeBean5에서 배열은 사용되지 않음
	ArrayList를 만들어서 총인원에 대한 배열을 만들어준 다음
	각 배열에는 만들어진 Bean의 주소가 들어감.
	*/
	public ArrayList<EmployeeBean5> getEmpList(){
		ArrayList<EmployeeBean5> alist = new ArrayList<EmployeeBean5>();
		// ArrayList를 만들어서 alist에 넣어서 사용
		// EmployeeBean5라는 객체 여러개가 리스트형태로 저장된 것이 ArrayList<EmployeeBean5>
		
		try {
			Connection con = DriverManager.getConnection(JDBC_URL, USER, PASS);
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
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return alist;
	}
}
