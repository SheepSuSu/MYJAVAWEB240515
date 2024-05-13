package cake.wx.shopping.vo;

public class Product {
	
	private String pid;
	private int ptype;
	private String pname;
	private double price;
	private int pcount;
	private String imgpath;
	
	
	public Product() {
		super();
	}
	
	public Product(String pid, int ptype, String pname, double price, int pcount) {
		super();
		this.pid = pid;
		this.ptype=ptype;
		this.pname = pname;
		this.price = price;
		this.pcount = pcount;
	}
	
	public Product(String pid,int ptype, String pname, double price, int pcount,
			String imgpath) {
		super();
		this.pid = pid;
		this.ptype=ptype;
		this.pname = pname;
		this.price = price;
		this.pcount = pcount;
		this.imgpath = imgpath;
	}
	
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}
	public int getPtype() {
		return ptype;
	}
	public void setPtype(int ptype) {
		this.ptype = ptype;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public int getPcount() {
		return pcount;
	}
	public void setPcount(int pcount) {
		this.pcount = pcount;
	}
	public String getImgpath() {
		return imgpath;
	}
	public void setImgpath(String imgpath) {
		this.imgpath = imgpath;
	}

}
