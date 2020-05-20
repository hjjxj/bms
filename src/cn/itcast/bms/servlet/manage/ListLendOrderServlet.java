package cn.itcast.bms.servlet.manage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.bms.domain.Orders;
import cn.itcast.bms.service.OrderService;

/**
 * Servlet implementation class ListLendOrderServlet
 */
@WebServlet("/ListLendOrderServlet")
public class ListLendOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		OrderService service = new OrderService();		
		List<Orders> orders = service.findOrderByFlag(false);
		request.setAttribute("orders", orders);
		request.setAttribute("flag", false);
		request.getRequestDispatcher("/admin/orders/list.jsp").forward(request, response);
		return ;	
	}

}
