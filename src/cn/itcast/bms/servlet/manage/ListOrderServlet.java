package cn.itcast.bms.servlet.manage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.bms.domain.Books;
import cn.itcast.bms.domain.Orders;
import cn.itcast.bms.service.BookService;
import cn.itcast.bms.service.OrderService;

/**
 * Servlet implementation class ListLendOrderServlet
 */
@WebServlet("/ListOrderServlet")
public class ListOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		OrderService service = new OrderService();		
		String f = request.getParameter("flag");
		Boolean flag =  f.equals("true") ? true:false;
		//System.out.println(f+ flag);
		List<Orders> orders = service.findOrderByFlag(flag);
		request.setAttribute("orders", orders);
		request.setAttribute("flag", flag);
		request.getRequestDispatcher("/admin/orders/list.jsp").forward(request, response);
		return ;	
	}

}
