package cake.wx.shopping.vo;

public class UserForm {

	private String fid;
	private String username;
	private int ptype;
	private String pname;
	private double proprice;
	private int count;
	private String time;
	private double summoney;
	private int status;
	
	
	public UserForm() {
		super();
	}
	
	public UserForm(String fid, String username, int ptype, String pname, int count,
			String time, int status) {
		super();
		this.fid = fid;
		this.username = username;
		this.ptype=ptype;
		this.pname = pname;
		this.count = count;
		this.time = time;
		this.status=status;
	}

	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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

	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}

	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}

	public int getStatus() {
		return status;
	}
	public String ShowStatus(){
		if (status==0){
			return "Unshipped";
		}
		else {
			return "Shipped";
		}
	}
	public void setSatus(int status) {
		this.status = status;
	}

	public double getSummoney() {
		return summoney;
	}
	public void setSummoney(double summoney) {
		this.summoney = summoney;
	}

	public double getProprice() {
		return proprice;
	}
	public void setProprice(double proprice) {
		this.proprice = proprice;
	}
	
}
