package cn.itcast.bms.service;

import java.sql.SQLException;
import java.util.List;

import cn.itcast.bms.dao.BookDao;
import cn.itcast.bms.domain.Books;
import cn.itcast.bms.domain.PageBean;

public class BookService {
	private BookDao dao = new BookDao();

	// 添加图书
	public void addBook(Books b) {
		try {
			dao.addBook(b);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void editBook(Books b) {
		try {
			dao.update(b);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 根据id删除图书
	public void deleteBook(String id) {
		try {
			dao.deleteBook(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 查找所有图书信息
	public List<Books> listAll() {
		try {
			return dao.findAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	// 根据id查找图书
	public Books findBookById(String id) {
		try {
			return dao.findBookById(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	// 根据条件查找图书
	public List<Books> findBooks(String id, String name, String category, String minprice, String maxprice) {
		try {
			return dao.findBooks(id, name, category, minprice, maxprice);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	// 分页操作
	public PageBean findProductByPage(int currentPage, int currentCount, String category) {
		PageBean bean = new PageBean();
		// 封装每页显示数据条数
		bean.setCurrentCount(currentCount);
		// 封装当前页码
		bean.setCurrentPage(currentPage);
		// 封装当前查找类别
		bean.setCategory(category);
		try {
			// 获取总条数
			int totalCount = dao.findAllCount(category);
			bean.setTotalCount(totalCount);
			// 获取总页数
			int totalPage = (int) Math.ceil(totalCount * 1.0 / currentCount);
			bean.setTotalPage(totalPage);
			// 获取当前页数据
			List<Books> bs = dao.findByPage(currentPage, currentCount, category);
			bean.setBs(bs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return bean;
	}

}
