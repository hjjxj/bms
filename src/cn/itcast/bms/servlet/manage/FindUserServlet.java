package cn.itcast.bms.servlet.manage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.bms.domain.User;
import cn.itcast.bms.service.UserService;

/**
 * Servlet implementation class FindUserService
 */
@WebServlet("/FindUserServlet")
public class FindUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {			
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		UserService service = new UserService();
		@SuppressWarnings("unchecked")
		List<User> us =(List<User>) service.findUsers(id, name, gender, email);
			
		request.setAttribute("us", us);
		request.getRequestDispatcher("/admin/users/list.jsp").forward(request, response);
		return ;	
	}

}
