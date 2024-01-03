package ajaxPro1;

import java.io.IOException;

import org.json.simple.JSONObject;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AjaxController3 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		// id를 갖고와서 id에 해당하는 정보를 Bean에 넘겨준다고..?
		// MemberDao에 getMember()를 추가해줌.
		
		String id = request.getParameter("id");
		Member bean = new MemberDao().getMember(id);
		// Member라는 객체가 만들어진 주소가 bean에 들어가있음(?)
		
		// 1. 하나의 문자열로 반환
		System.out.println(bean); 
		// response.getWriter().print(bean); 아래 넘겨주는거랑 겹쳐서 주석
		// toString으로 Override해놓아서 bean을 출력하면
		// 해당 id에 맞는 id, name, gender, email가 하나의 문자열로 출력됨.
		
		// 2. JSONObject(객체)로 변환
		/*
		JSONObject jObj = new JSONObject();
		jObj.put("userId", bean.getId()); // bean에서 값을 얻어옴
		jObj.put("userName", bean.getName());
		jObj.put("gender", bean.getGender());
		jObj.put("email", bean.getEmail());
		// 키:값 형태로 구성되고, userId를 호출하면 beadn에 있는 id값을 가져옴
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jObj);
		*/
		
		// 3. GSON(Google json)
		/*
		 위의 JSONObject의 과정을 알아서 해주는 라이브러리
		 Gson gson = new Gson(); // 객체 생성
		 gson.toJson(); // gson객체.toJson(응답할자바객체, 응답할스트림); 
		 */
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(bean,response.getWriter());
					//응답할자바객체:bean / 응답할스트림:response.getWriter()
		// gson이용하여 bean객체 하나만 응답시
		// JSONObject{key:value, key:value, ...}형태로 만들어져 응답
		//			  key = 해당 bean객체의 필드명을 알아서 세팅(필드명이 키에 들어감)
		// 그래서 Bean에 있는 필드명과 똑같아야 함. 임의로 바꿀 수 없음.
		// "userId", bean.getId()이렇게 사용하지 못하고 Bean에 있는 그대로 "id",bean.getId()형태 고정
		// 자바배열...
	}

}
