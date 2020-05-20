package cn.itcast.bms.web.servlet.client;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.itcast.bms.domain.Books;
import cn.itcast.bms.service.BookService;

/**
 * Servlet implementation class AddCartServlet
 */
@WebServlet("/AddCartServlet")
public class AddCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		BookService service = new BookService();
		Books b = service.findBookById(id);
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		Map<Books, Integer> cart = (Map<Books, Integer>) session.getAttribute("cart");
		
		if(cart == null) {
			cart = new HashMap<Books, Integer>();			
		}
		Integer  count = cart.put(b, 1);
		if(count != null) {
			cart.put(b, count+1);
		}
		session.setAttribute("cart", cart);
		response.sendRedirect(request.getContextPath()+"/client/cart.jsp");
		
	}

}
