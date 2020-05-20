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
 * Servlet implementation class AddUserServlet
 */
@WebServlet("/AddUserServlet")
public class AddUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		User u = new User();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender");
		u.setPassword(password);
		u.setEmail(email);
		u.setGender(gender);
		u.setRole("普通用户");
		u.setUsername(username);
		u.setBnum(8);
		UserService service = new UserService();
		try {
			// 调用service完成添加用户操作					
			service.register(u);			
			response.sendRedirect(request.getContextPath()
					+ "/ListUserServlet");
			return;
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().write("添加用户失败");
			return;
		}
	}

}
