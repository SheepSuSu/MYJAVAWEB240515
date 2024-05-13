package cake.wx.shopping.dao;

import java.util.List;

import cake.wx.shopping.vo.Product;

public interface ProductDAO {
//	private String pid;
// 	private int ptype;
//	private String pname;
//	private double price;
//	private int pcount;
//	private String imgpath;
	
	
	public void insert(String pid,int ptype,String pname,double price,int pcount,String imgpath)throws Exception;
	
	public void update(String pid,String pname,double price,int pcount,String imgpath)throws Exception;
	
	public void update(String pid,String pname, double price, int pcount
	) throws Exception;
	
	public void updateByPname(String pid,int pcount) throws Exception;
	
	public void deleteById(String pid) throws Exception;
	
	public void deleteByNmae(String pname) throws Exception;
	
	public List<Product> selectAll() throws Exception;

	public List<Product> selectByType(int type) throws Exception;
	
	public Product selectById(String pid ) throws Exception;
	
	public List<Product> selectByName(String pname) throws Exception;
	
	public List<Product> selectByLike(String cond) throws Exception;

	public List<List<String>> showItemSale(int ptype) throws Exception;

	public Product selectItemByName(String pname) throws Exception;

	public List<String> getAllProPid() throws Exception;

}
