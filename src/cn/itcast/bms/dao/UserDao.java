package cn.itcast.bms.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import cn.itcast.bms.domain.User;
import cn.itcast.bms.utils.DataSourceUtils;

public class UserDao {
	// 插入用户
	public Boolean insert(User user) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "insert into user (username , password , gender , email , role, bnum) values (?,?,?,?,?,?)";
		int num = runner.update(sql, new Object[] { user.getUsername(), user.getPassword(), user.getGender(),
					user.getEmail(), user.getRole() ,user.getBnum()});
		if (num > 0)
			return true;
		return false;
	}

	// 删除用户
	public Boolean delete(int id) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "delete from user where id=?";
		int num = runner.update(sql, id);
		if (num > 0)
			return true;
		return false;
	}

	// 更新用户
	public Boolean update(User user) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "update user set username=? , password=? , gender=? , email=? , role =? , bnum =?  where id = ?";
		int num = runner.update(sql, new Object[] { user.getUsername(), user.getPassword(), user.getGender(),
				user.getEmail(), user.getRole(), user.getBnum(), user.getId() });
		if (num > 0)
			return true;
		return false;
	}

	// 查找所有用户
	public List<User> findAll() throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from user";
		List<User> list = runner.query(sql, new BeanListHandler<User>(User.class));
		return list;
	}

	// 通过id查找用户
	public User find(int id) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from user where id = ?";
		User user = (User) runner.query(sql, new BeanHandler(User.class), new Object[] { id });
		return user;
	}

	// ͨ通过username查找用户
	public User find2(String username) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from user where username = ?";
		User user = (User) runner.query(sql, new BeanHandler(User.class), new Object[] { username });
		return user;
	}

	// ͨ通过username、password查找用户
	public User find3(String username, String password) throws SQLException {
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from user where username = ? ,password=?";
		User user = (User) runner.query(sql, new BeanHandler(User.class), new Object[] { username, password });
		return user;
	}

	public List<User> findUsers(String id, String name, String gender, String email) throws SQLException {
		List<Object> list = new ArrayList<Object>();
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		String sql = "select * from user where 1=1";
		if (id != null && id.trim().length() > 0) {
			sql += " and id=?";
			list.add(id);
		}
		if (name != null && name.trim().length() > 0) {
			sql += " and username=?";
			list.add(name);
		}
		if (gender != null && gender.trim().length() > 0) {
			sql += " and gender=?";
			list.add(gender);
		}
		if (email != null && email.trim().length() > 0) {
			sql += " and email = ?";
			list.add(email);
		}
		// 将集合转为对象数组类型
		Object[] u = list.toArray();
		return runner.query(sql, new BeanListHandler<User>(User.class), u);
	}
}
