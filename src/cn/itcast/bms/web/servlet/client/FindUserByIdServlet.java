package cn.itcast.bms.web.servlet.client;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.bms.domain.Books;
import cn.itcast.bms.domain.User;
import cn.itcast.bms.service.BookService;
import cn.itcast.bms.service.UserService;

/**
 * Servlet implementation class FindUserByIdServlet
 */
@WebServlet("/FindUserByIdServlet")
public class FindUserByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sid = request.getParameter("id");
		//System.out.println(sid);	
		int id = Integer.parseInt(sid);
		String type = request.getParameter("type");
		
		UserService service = new UserService();
		User  u = service.findUserById(id);
		request.setAttribute("u", u);
		//前台不传递type值，跳转前端商品详细信息info.jsp
		if(type == null) {
			request.getRequestDispatcher("/client/info.jsp").forward(request, response);
		}
		request.getRequestDispatcher("/admin/users/edit.jsp").forward(request, response);
		return ;		
	}

}
