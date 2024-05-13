package cake.wx.shopping.vo;

public class Bank {
	
//	CREATE TABLE `bank` (
//			  `username` varchar(20) NOT NULL,
//			  `password` varchar(20) default NULL,
//			  `money` double(15,3) default NULL,
//			  PRIMARY KEY  (`username`)
//			) ENGINE=InnoDB DEFAULT CHARSET=gbk;

	private String username;
	private String cardname;
	private String password;
	private double money;
	
	
	public Bank() {
		super();
	}

	public Bank(String username,String cardname, String password, double money) {
		super();
		this.username = username;
		this.cardname = cardname;
		this.password = password;
		this.money = money;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getCardname() {
		return cardname;
	}
	public void setCardname(String cardname) {
		this.cardname = cardname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	
	

}
