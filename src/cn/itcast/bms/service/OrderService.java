package cn.itcast.bms.service;

import java.sql.SQLException;
import java.util.List;

import cn.itcast.bms.dao.OrderDao;
import cn.itcast.bms.domain.Orders;
import cn.itcast.bms.domain.User;

public class OrderService {
	private OrderDao dao = new OrderDao();

	// 添加借书单
	public void addOrder(Orders order) {
		try {
			dao.addOrder(order);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 根据订单id查找订单
	public List<Orders> findOrderById(String id) {
		try {
			return dao.findOrderById(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	// 根据用户id查找订单
	public List<Orders> findOrderByUser(int id) {
		try {
			return dao.findOrderByUser(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

	//
	public List<Orders> findOrderByFlag(Boolean flag) {
		try {
			return dao.findOrderByFlag(flag);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public void updateFlag(String id) {
		try {
			dao.updateFlag(id);
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void deleteOrder(String id) {
		try {
			dao.deleteOrder(id);
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
