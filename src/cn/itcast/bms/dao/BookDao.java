package cn.itcast.bms.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import cn.itcast.bms.domain.Books;
import cn.itcast.bms.domain.PageBean;
import cn.itcast.bms.utils.DataSourceUtils;

public class BookDao {
	// 添加图书
	public Boolean addBook(Books b) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "insert into books (id, name, price , category , pnum , imgurl , description) values (?,?,?,?,?,?,?)";
		int num = runner.update(sql, new Object[] { b.getId(), b.getName(), b.getPrice(), b.getCategory(), b.getPnum(),
				b.getImgurl(), b.getDescription() });
		if (num > 0)
			return true;
		return false;
	}

	// 根据id删除商品信息
	public Boolean deleteBook(String id) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "delete from books where id=?";
		int num = runner.update(sql, id);
		if (num > 0)
			return true;
		return false;
	}

	public Boolean update(Books b) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "update books set name = ?, price =?, category =?, pnum =?, imgurl =? , description =? where id = ?";
		int num = runner.update(sql, new Object[] { b.getName(), b.getPrice(), b.getCategory(), b.getPnum(),
				b.getImgurl(), b.getDescription(), b.getId() });
		if (num > 0)
			return true;
		return false;
	}

	// 查找所有图书
	public List<Books> findAll() throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from books";
		List<Books> list = (List<Books>) runner.query(sql, new BeanListHandler<Books>(Books.class));
		return list;
	}

	public List<Books> findBooks(String id, String name, String category, String minprice, String maxprice)
			throws SQLException {
		List<Object> list = new ArrayList<Object>();
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from books where 1=1";
		if (id != null && id.trim().length() > 0) {
			sql += " and id=?";
			list.add(id);
		}
		if (name != null && name.trim().length() > 0) {
			sql += " and name=?";
			list.add(name);
		}
		if (category != null && category.trim().length() > 0) {
			sql += " and category=?";
			list.add(category);
		}
		if (minprice != null && maxprice != null && minprice.trim().length() > 0 && maxprice.trim().length() > 0) {
			sql += " and price between ? and ?";
			list.add(minprice);
			list.add(maxprice);
		}
		// 将集合转为对象数组类型
		Object[] p = list.toArray();
		return runner.query(sql, new BeanListHandler<Books>(Books.class), p);
	}

	// 获取数据总条数
	public int findAllCount(String category) throws SQLException {
		String sql = "select count(*) from books";

		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());

		if (!"全部商品".equals(category)) {
			sql += " where category=?";
			Long count = runner.query(sql, new ScalarHandler<Long>(), category);
			return count.intValue();
		} else {
			Long count = runner.query(sql, new ScalarHandler<Long>());
			return count.intValue();
		}
	}

	// 获取当前页数据
	public List<Books> findByPage(int currentPage, int currentCount, String category) throws SQLException {
		// 要执行的sql语句
		String sql = null;
		// 参数
		Object[] obj = null;
		// 如果category不为null,代表是按分类查找
		if (!"全部商品".equals(category)) {
			sql = "select * from books  where category=? limit ?,?";
			obj = new Object[] { category, (currentPage - 1) * currentCount, currentCount, };
		} else {
			sql = "select * from books  limit ?,?";
			obj = new Object[] { (currentPage - 1) * currentCount, currentCount, };
		}
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new BeanListHandler<Books>(Books.class), obj);
	}

	// 根据id查找商品
	public Books findBookById(String id) throws SQLException {
		String sql = "select * from books where id=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new BeanHandler<Books>(Books.class), id);
	}

	// 书被借走，书的数量减少
//	public void changeProductNum(Order order) throws SQLException {
//		String sql = "update book set pnum=pnum-? where id=?";
//		QueryRunner runner = new QueryRunner();
//		List<OrderItem> items = order.getOrderItems();
//		Object[][] params = new Object[items.size()][2];
//
//		for (int i = 0; i < params.length; i++) {
//			params[i][0] = items.get(i).getBuynum();
//			params[i][1] = items.get(i).getP().getId();
//		}
//
//		runner.batch(DataSourceUtils.getConnection(), sql, params);
//	}

	// 前台，用于搜索框根据书名来模糊查询相应的图书
	public List<Books> findBookByName(int currentPage, int currentCount, String searchfield) throws SQLException {
		// 根据名字模糊查询图书
		String sql = "SELECT * FROM products WHERE name LIKE '%" + searchfield + "%' LIMIT ?,?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
//				//用于分页查询的数据
//				Object obj = new Object[] { (currentPage - 1) * currentCount, currentCount };
		return runner.query(sql, new BeanListHandler<Books>(Books.class), currentPage - 1, currentCount);
	}

	// 前台搜索框，根据书名模糊查询出的图书总数量
	public int findBookByNameAllCount(String searchfield) throws SQLException {
		String sql = "SELECT COUNT(*) FROM products WHERE name LIKE '%" + searchfield + "%'";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		// 查询出满足条件的总数量，为long类型
		Long count = (Long) runner.query(sql, new ScalarHandler());
		return count.intValue();
	}
}
