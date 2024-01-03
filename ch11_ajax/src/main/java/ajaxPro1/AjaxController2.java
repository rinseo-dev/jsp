package ajaxPro1;

import java.io.IOException;

import org.json.simple.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AjaxController2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		
		// ver1. 응답 데이터가 하나의 문자열일 때
		/*
		String responseData = "이름 : " + name + ", 나이 : " + age;
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(responseData);
		*/
		
		// ver2. 응답 데이터가 여러개 일 때
		/*
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(name);
		response.getWriter().print(age);
		*/
		
		// ver3. 응답 데이터가 여러개 일때  json으로 넘겨줌
		/*
		 json(JavaScript Object Notation : 자바스크립트 객체 표기법)
		 - ajax 통신시 데이터 전송에 자주 사용되는 포맷 형식 중 하나
		 
		 > [value, value, value] => 자바스크립트에서의 배열 객체 => JSON Array라고 함
		 > {key:value, key:value} => 자바스크립트에서의 일반 객체 => JSON Object
		 */
		
		// ver3. 배열 JSONArray
		/*
		JSONArray jArr = new JSONArray();
		jArr.add(name);
		jArr.add(age);
		
		//response.setContentType("text/html; charset=UTF-8");
		// 이렇게 넘기면 무조건 하나의 문자열로 반환이 되므로 사용하지 않을 것
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jArr);
		*/
		
		// ver4. 객체 JSONObject
		JSONObject jObj = new JSONObject();
		jObj.put("name",name);
		jObj.put("age",age);
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jObj);
	}

}
