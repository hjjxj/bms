package cn.itcast.bms.web.servlet.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.bms.domain.User;
import cn.itcast.bms.service.UserService;

/**
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		UserService service = new UserService();
		User user = service.login(username);

		if (user == null) {
			request.setAttribute("error", "用户不存在");
			request.getRequestDispatcher("client/login.jsp").forward(request, response);
			return;
		} else if (!user.getPassword().equals(password)) {
			request.setAttribute("error", "密码错误");
			request.getRequestDispatcher("client/login.jsp").forward(request, response);
			return;
		} else if (user.getRole().equals("管理员")) {
			request.getSession().setAttribute("user", user);
			request.getRequestDispatcher("admin/home.jsp").forward(request, response);
		} else if (user.getRole().equals("普通用户")) {
			request.getSession().setAttribute("user", user);
			request.getRequestDispatcher("client/myAccount.jsp").forward(request, response);
		}

	}

}
