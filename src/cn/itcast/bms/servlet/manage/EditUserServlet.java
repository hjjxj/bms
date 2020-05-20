package cn.itcast.bms.servlet.manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.bms.domain.User;
import cn.itcast.bms.service.UserService;


/**
 * Servlet implementation class EditUserServlet
 */
@WebServlet("/EditUserServlet")
public class EditUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User u = new User();
		String sid = request.getParameter("id");
		int id = Integer.parseInt(sid);
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String role = request.getParameter("role");
		String gender = request.getParameter("gender");	
		String num = request.getParameter("bnum");
		int bnum = Integer.parseInt(num);
		u.setId(id);		
		u.setPassword(password);
		u.setEmail(email);
		u.setGender(gender);
		u.setRole(role);
		u.setUsername(username);
		u.setBnum(bnum);
		System.out.println(u);
		// 调用service完成修改用户操作
		UserService service = new UserService();
		service.editUser(u);
		response.sendRedirect(request.getContextPath() + "/ListUserServlet");		
		return;
		
	}

}
