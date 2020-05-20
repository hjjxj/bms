package cn.itcast.bms.service;

import java.sql.SQLException;
import java.util.List;

import cn.itcast.bms.dao.UserDao;
import cn.itcast.bms.domain.Books;
import cn.itcast.bms.domain.User;

public class UserService {
	private UserDao  dao = new UserDao();	
	//注册操作
	public Boolean register(User user){		
		try {
			return dao.insert(user);			
		}catch (SQLException e) {
			e.printStackTrace();			
		}	
		return false;
	}
	//登录操作
	public User login(String username) {
		try {
			User user = dao.find2(username);	
			return user;
		}catch(SQLException e){
			e.printStackTrace();
		}
		return null;
	}
	
	// 查找所有用户信息
	public List<User> listAll() {
		try {
			return dao.findAll();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void editUser(User u) {
		try {
			dao.update(u);
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	// 根据id查找用户信息
	public User findUserById(int id) {
		try {
			return dao.find(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// 根据条件查找图书
	public List<User> findUsers(String id,String name, String gender, String email ) {
		try {
			return  dao.findUsers(id, name, gender, email);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//根据id删除用户
	public void deleteUser(int id) {
		try {
			dao.delete(id);			
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
