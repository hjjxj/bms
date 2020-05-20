package cn.itcast.bms.servlet.manage;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.bms.domain.Books;
import cn.itcast.bms.service.BookService;


/**
 * Servlet implementation class FindProductServlet
 */
@WebServlet("/FindBookServlet")
public class FindBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {			
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String category = request.getParameter("category");
		String minprice = request.getParameter("minprice");
		String maxprice = request.getParameter("maxprice");
		//System.out.println(id+" "+name+" "+category);
		BookService service = new BookService();
		@SuppressWarnings("unchecked")
		List<Books> bs =(List<Books>) service.findBooks(id, name, category, minprice, maxprice);
			
		request.setAttribute("bs", bs);
		request.getRequestDispatcher("/admin/books/list.jsp").forward(request, response);
		return ;	
	}

}
