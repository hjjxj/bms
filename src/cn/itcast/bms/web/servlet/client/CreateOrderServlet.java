package cn.itcast.bms.web.servlet.client;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.text.SimpleDateFormat;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import cn.itcast.bms.domain.Books;
import cn.itcast.bms.domain.Orders;
import cn.itcast.bms.domain.User;
import cn.itcast.bms.service.OrderService;

/**
 * Servlet implementation class CreateOrderServlet
 */
@WebServlet("/CreateOrderServlet")
public class CreateOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		@SuppressWarnings("unchecked")
		Map<Books, Integer> cart = (Map<Books, Integer>) session.getAttribute("cart");
		System.out.println(cart);
		List<Orders> orderItem = new ArrayList<Orders>();
		for(Map.Entry<Books, Integer> m :cart.entrySet()) {
			Orders order = new Orders();
			order.setId(UUID.randomUUID().toString());
			order.setUser_id(user.getId());
			order.setBook_id(m.getKey().getId());
			order.setBook_name(m.getKey().getName());
			order.setUser(user);
			order.setBook(m.getKey());
			order.setFlag(false);
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			simpleDateFormat.format(new Date());
			order.setTime(new Date());
			order.setConfirm_time(new Date());
			order.setReturn_time(new Date());
			OrderService service = new OrderService();
			service.addOrder(order);
			orderItem.add(order);	
		}		
		session.setAttribute("orders", orderItem);
		response.sendRedirect(request.getContextPath()+"/client/createOrderSuccess.jsp");
	}

}
