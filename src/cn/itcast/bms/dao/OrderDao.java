package cn.itcast.bms.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.itcast.bms.domain.Orders;
import cn.itcast.bms.domain.User;
import cn.itcast.bms.utils.DataSourceUtils;

/**
 * 借书单
 * 
 * @author www
 *
 */
public class OrderDao {
	/**
	 * 生成借单
	 * 
	 * @param order
	 * @throws SQLException
	 */
	public void addOrder(Orders order) throws SQLException {
		// 1.生成Sql语句
		String sql = "insert into orders values(?,?,?,?,?,?,?,?)";
		// 2.生成执行sql语句的QueryRunner,不传递参数
		QueryRunner runner = new QueryRunner();
		// 3.执行update()方法插入数据
		runner.update(DataSourceUtils.getConnection(), sql, order.getId(), order.getUser_id(), order.getBook_id(),
				order.getBook_name(), order.getFlag(), order.getTime(), order.getConfirm_time(),
				order.getReturn_time());
	}

	// 根据id删除商品信息
	public Boolean deleteOrder(String id) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "delete from orders where id=?";
		int num = runner.update(sql, id);
		if (num > 0)
			return true;
		return false;
	}

	// 查出用户所属借书单
	public List<Orders> findOrderByUser(int id) throws SQLException {
		String sql = "select * from orders where user_id=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new BeanListHandler<Orders>(Orders.class), id);
	}

	public List<Orders> findOrderById(String id) throws SQLException {
		String sql = "select * from orders where id=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new BeanListHandler<Orders>(Orders.class), id);
	}

	public List<Orders> findOrderByFlag(Boolean flag) throws SQLException {
		String sql = "select * from orders where flag=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		return runner.query(sql, new BeanListHandler<Orders>(Orders.class), flag);
	}

	public Boolean updateFlag(String id) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "update orders set flag =? where id = ?";
		int num = runner.update(sql, new Object[] { true, id });
		if (num > 0)
			return true;
		return false;
	}
}
