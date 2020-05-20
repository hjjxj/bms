package cn.itcast.bms.web.servlet.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.bms.domain.Books;
import cn.itcast.bms.service.BookService;


/**
 * Servlet implementation class FindBookByIdServlet
 */
@WebServlet("/FindBookByIdServlet")
public class FindBookByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String type = request.getParameter("type");
		
		BookService service = new BookService();	
		Books b = service.findBookById(id);
		request.setAttribute("b", b);
		//前台不传递type值，跳转前端商品详细信息info.jsp
		if(type == null) {
			request.getRequestDispatcher("/client/info.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("/admin/books/edit.jsp").forward(request, response);
		}
		
		return ;		
	}
}
