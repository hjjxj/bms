package cn.itcast.bms.web.servlet.client;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.bms.domain.PageBean;
import cn.itcast.bms.service.BookService;

/**
 * Servlet implementation class ShowBookByPageServlet
 */
@WebServlet("/ShowBookByPageServlet")
public class ShowBookByPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//request.setCharacterEncoding("utf-8"); //只对POST提交方式有效的结论
		request.setCharacterEncoding("UTF-8");
		// 1.定义当前页码，默认为1
		int currentPage = 1;
		String _currentPage = request.getParameter("currentPage");
		if (_currentPage != null) {
			currentPage = Integer.parseInt(_currentPage);
		}
		// 2.定义每页显示条数,默认为4
		int currentCount = 4;
		String _currentCount = request.getParameter("currentCount");
		if (_currentCount != null) {
			currentCount = Integer.parseInt(_currentCount);
		}
		// 3.获取查找的分类
		String category = "全部商品";
		String _category = request.getParameter("category");	
		if (_category != null) {
			category = _category;
		}
		//System.out.println(category);
		// 调用Service，完成获取当前分页Bean数据
		BookService service = new BookService();
		PageBean bean = service.findProductByPage(currentPage, currentCount, category);
		request.setAttribute("bean", bean);
		request.getRequestDispatcher("/client/book_list.jsp").forward(request, response);
		return;
	}

}
