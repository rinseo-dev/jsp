package ajaxPro1;

import java.io.IOException;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AjaxController4 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<Member> alist = new MemberDao().getAllMember();
		/*
		// JSONArray에 넣어줌[{key:value},{key:value},...]
		JSONArray jArr = new JSONArray();
		for(Member m : alist) { // Member 객체를 생성해서 alist에 인덱스마다 값을 넣음(?)
			JSONObject jObj = new JSONObject(); // 멤버 하나하나를 객체로 넣어줌
			jObj.put("id",m.getId());
			jObj.put("name",m.getName());
			jObj.put("gender",m.getGender());
			jObj.put("email",m.getEmail());
			// 앞에 키값은 마음대로 해도 됨. 꼭 id, name 등으로 맞추지 않아도 됨.
			
			jArr.add(jObj);
		}
		
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jArr); // Array로 값 넘겨줌
		*/
		// GSON사용시
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(alist,response.getWriter());
		
	}

}
