package Controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import dto.UserDto;
import net.sf.json.JSONObject;

@WebServlet("/user")
public class UserController extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(req, resp);
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String param = req.getParameter("param");
		
		UserDao dao = UserDao.getInstance();
		
		if(param.equals("login")) {
			String userid = (String) req.getSession().getAttribute("myid");
			System.out.println(userid);
			if(userid != null) {
				req.getSession().invalidate();
				System.out.println("로그아웃");
			}else {
				System.out.println("아이디없음");
			}
			resp.sendRedirect("user/login.jsp");
			
		}
		else if(param.equals("account")) {
			resp.sendRedirect("user/account.jsp");
		}
		else if(param.equals("accountAf")) {
			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");
			String name = req.getParameter("name");
			int age = Integer.parseInt(req.getParameter("age"));
			String date = req.getParameter("date");
			String address = req.getParameter("address");
			int height = Integer.parseInt(req.getParameter("height"));
			
			UserDto dto = new UserDto(id, pwd, name, age, date, address, height);
			boolean isS = dao.addUser(dto);
			
			String msg = "OK";
			if(isS = false) {
				msg = "NG";
			}
			resp.sendRedirect("message.jsp?proc=&msg="+msg);
		}
		else if(param.equals("loginAf")) {
			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");
			
			int result = dao.login(id, pwd);
			
			String msg = "NO";
			if(result == 1) {
				msg = "OK";
			}
			else if(result == 0) {
				msg = "WRONG";
			}
			else if(result == -1) {
				msg = "NOT";
			}
			
			req.getSession().setAttribute("myid", id);
			resp.sendRedirect("message.jsp?proc=login&msg="+msg);
			
		}
		else if(param.equals("mypage")) {
			String userid = (String) req.getSession().getAttribute("myid");
			resp.sendRedirect("user/mypage.jsp?id="+userid);
		}
		else if(param.equals("checkId")) {
			String id = req.getParameter("id");
			System.out.println("id:" + id);
			boolean b = dao.getId(id);
			String str = "NO";
			if(b == false){
				str = "OK";
			}
			JSONObject obj = new JSONObject();
			obj.put("str", str);
			
			resp.setContentType("application/x-json; charset=utf-8");
			resp.getWriter().print(obj);
			
		}
		else if(param.equals("signout")) {
			String id = req.getParameter("id");
			System.out.println("id:" + id);
			boolean b = dao.signout(id);
			System.out.println("b="+b);
			String str = "NO";
			if(b == true){
				str = "OK";
			}
			resp.sendRedirect("message.jsp?proc=signout&msg="+str);
			
		}
		
		
		
	}
	
	
}
