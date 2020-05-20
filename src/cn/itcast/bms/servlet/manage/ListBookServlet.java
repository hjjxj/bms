package cn.itcast.bms.servlet.manage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.bms.domain.Books;
import cn.itcast.bms.service.BookService;


/**
 * Servlet implementation class ListProductServlet
 */
@WebServlet("/ListBookServlet")
public class ListBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		BookService service = new BookService();
		List<Books> bs = service.listAll();
		request.setAttribute("bs", bs);
		request.getRequestDispatcher("/admin/books/list.jsp").forward(request, response);
		return ;	
	}

}


