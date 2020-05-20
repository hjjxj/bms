package cn.itcast.bms.web.servlet.client;

import java.io.IOException;
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
 * Servlet implementation class ChangeCartServlet
 */
@WebServlet("/ChangeCartServlet")
public class ChangeCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 1.得到商品id
		String id = request.getParameter("id");
		// 2.从session中获取购物车.
		HttpSession session = request.getSession();
		@SuppressWarnings("unchecked")
		Map<Books, Integer> cart = (Map<Books, Integer>) session.getAttribute("cart");
		BookService service = new BookService();
		Books b = service.findBookById(id);
		//System.out.println(b);
		cart.remove(b);
		System.out.println(cart);
		request.setAttribute("cart", cart);
		response.sendRedirect(request.getContextPath() + "/client/cart.jsp");
		return;
	}
}
