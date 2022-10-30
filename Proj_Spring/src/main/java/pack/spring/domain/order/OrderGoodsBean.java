package pack.spring.domain.order;

import java.util.List;

public class OrderGoodsBean {
	private int num;
	private int orderNum;
	private int pNum;
	private int pVolumn;
	private String pName;
	private String reviewStatus;
	
	private List<OrderGoodsBean> orderGoodsList;
	
	
	public List<OrderGoodsBean> getOrderGoodsList() {
		return orderGoodsList;
	}
	public void setOrderGoodsList(List<OrderGoodsBean> orderGoodsList) {
		this.orderGoodsList = orderGoodsList;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(int orderNum) {
		this.orderNum = orderNum;
	}
	public int getpNum() {
		return pNum;
	}
	public void setpNum(int pNum) {
		this.pNum = pNum;
	}
	public int getpVolumn() {
		return pVolumn;
	}
	public void setpVolumn(int pVolumn) {
		this.pVolumn = pVolumn;
	}
	
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getReviewStatus() {
		return reviewStatus;
	}
	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}
}
