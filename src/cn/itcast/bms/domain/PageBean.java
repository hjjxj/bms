package cn.itcast.bms.domain;

import java.util.List;

public class PageBean {
	private static final long serialVersionUID = 1L;
	private int currentPage;// 当前页码
	private int totalCount;// 总条数
	private int totalPage;// 总页数
	private int currentCount;// 每页条数
	private List<Books> bs;// 每页显示的数据
	private String category;// 类别
	private String searchfield;// 模糊搜索的图书名

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCurrentCount() {
		return currentCount;
	}

	public void setCurrentCount(int currentCount) {
		this.currentCount = currentCount;
	}

	public List<Books> getBs() {
		return bs;
	}

	public void setBs(List<Books> bs) {
		this.bs = bs;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSearchfield() {
		return searchfield;
	}

	public void setSearchfield(String searchfield) {
		this.searchfield = searchfield;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}