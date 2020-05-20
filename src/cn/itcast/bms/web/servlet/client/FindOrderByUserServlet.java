package cn.itcast.bms.web.servlet.client;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.bms.domain.Orders;
import cn.itcast.bms.domain.User;
import cn.itcast.bms.service.OrderService;


/**
 * Servlet implementation class FindOrderByUserServlet
 */
@WebServlet("/FindOrderByUserServlet")
public class FindOrderByUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 获取名为“user”的session
		User user = (User) request.getSession().getAttribute("user");
		// 调用service中的方法,根据用户信息查找订单
		OrderService service = new OrderService();
		List<Orders> orders = service.findOrderByUser(user.getId());
		request.setAttribute("orders", orders);
		request.getRequestDispatcher("/client/orderlist.jsp").forward(request, response);
	}

}
