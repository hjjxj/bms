package cn.itcast.bms.servlet.manage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.bms.service.BookService;
import cn.itcast.bms.service.OrderService;

/**
 * Servlet implementation class AgreeLendServlet
 */
@WebServlet("/AgreeLendServlet")
public class AgreeLendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		OrderService service = new OrderService();
		service.updateFlag(id);
		response.sendRedirect(request.getContextPath()+"/ListOrderServlet?flag=false");
		return ;	
	}

}
