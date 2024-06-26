package cake.wx.shopping.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedHashMap;
import java.util.Map;

import cake.wx.shopping.dao.ProductDAO;
import cake.wx.shopping.dbc.DataBaseConnection;
import cake.wx.shopping.vo.Product;


public class ProductDAOImpl implements ProductDAO {

	public void deleteById(String pid) throws Exception {
		String sql = "DELETE FROM product WHERE pid=?";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;

		// 下面是针对数据库的具体操作
		try {
			// 连接数据库
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, pid);
			// 进行数据库更新操作
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭数据库连接
			dbc.close();
		}

	}

	public void deleteByNmae(String pname) throws Exception {
		String sql = "DELETE FROM product WHERE pname=?";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;

		// 下面是针对数据库的具体操作
		try {
			// 连接数据库
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, pname);
			// 进行数据库更新操作
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭数据库连接
			dbc.close();
		}
		

	}

	public void insert(String pid, int ptype, String pname, double price, int pcount,
			String imgpath) throws Exception {

		String sql="INSERT INTO product (pid,ptype,pname,price,pcount,imgpath) VALUES (?,?,?,?,?,?) ";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		
		// 下面是针对数据库的具体操作
		try {
			// 连接数据库
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, pid);
			pstmt.setInt(2, ptype);
			pstmt.setString(3, pname);
			pstmt.setDouble(4, price);
			pstmt.setInt(5, pcount);
			pstmt.setString(6, imgpath);
			// 进行数据库更新操作
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭数据库连接
			dbc.close();
		}
	}

	public List<Product> selectByType(int type) throws Exception{
		List<Product> plist=new ArrayList<Product>();
		String sql="SELECT * FROM product WHERE ptype='"+type+"' ORDER BY pid desc";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;

		try {
			// 连接数据库
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);


			// 进行数据库更新操作
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				Product product=new Product();
				product.setPid(rs.getString(1));
				product.setPtype(rs.getInt(2));
				product.setPname(rs.getString(3));
				product.setPrice(rs.getDouble(4));
				product.setPcount(rs.getInt(5));
				product.setImgpath(rs.getString(6));
				plist.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭数据库连接
			pstmt.close();
			dbc.close();
		}
		return plist;
	}

	public Product selectById(String pid) throws Exception {
		Product product=null;
		String sql="SELECT * FROM product WHERE pid=? ";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		
		try {
			// 连接数据库
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, pid);
			
			// 进行数据库更新操作
			ResultSet rs=pstmt.executeQuery();
			if(rs.next()){
				product=new Product();
				product.setPid(rs.getString(1));
				product.setPtype(rs.getInt(2));
				product.setPname(rs.getString(3));
				product.setPrice(rs.getDouble(4));
				product.setPcount(rs.getInt(5));
				product.setImgpath(rs.getString(6));
			}
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭数据库连接
			dbc.close();
		}
		
		return product;
	}

	public List<Product> selectByLike(String cond) throws Exception {
		List<Product> plist=new ArrayList<Product>();
		String sql="SELECT * FROM product WHERE pname LIKE ?";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		
		try {
			// 连接数据库
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, "%" + cond + "%");
//System.out.println(pstmt);
			// 进行数据库更新操作
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				Product product=new Product();
				product.setPid(rs.getString(1));
				product.setPname(rs.getString(2));
				product.setPrice(rs.getDouble(3));
				product.setPcount(rs.getInt(4));
				product.setImgpath(rs.getString(5));
				plist.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭数据库连接
			pstmt.close();
			dbc.close();
		}
		return plist;
	}
	
	public List<Product> selectAll() throws Exception {
		List<Product> plist=new ArrayList<Product>();
		String sql="SELECT * FROM product ORDER BY pid desc";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		
		try {
			// 连接数据库
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);


			// 进行数据库更新操作
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				Product product=new Product();
				product.setPid(rs.getString(1));
				product.setPtype(rs.getInt(2));
				product.setPname(rs.getString(3));
				product.setPrice(rs.getDouble(4));
				product.setPcount(rs.getInt(5));
				product.setImgpath(rs.getString(6));
				plist.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭数据库连接
			pstmt.close();
			dbc.close();
		}
		return plist;
	}

	public List<Product> selectByName(String pname) throws Exception {
		List<Product> plist=new ArrayList<Product>();
		String sql = "SELECT * FROM product WHERE pname=?";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		
		
		try {
			// 连接数据库
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, pname );
			
			// 进行数据库更新操作
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				Product product=new Product();
				product.setPid(rs.getString(1));
				product.setPtype(rs.getInt(2));
				product.setPname(rs.getString(3));
				product.setPrice(rs.getDouble(4));
				product.setPcount(rs.getInt(5));
				product.setImgpath(rs.getString(6));
				plist.add(product);
			}
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭数据库连接
			dbc.close();
		}
		
		return plist;
	}

	public void update(String pid, String pname, double price, int pcount,
			String imgpath) throws Exception {
		String sql = "UPDATE product SET pname=?,price=?,pcount=?,imgpath=? WHERE pid=?";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		
		// 下面是针对数据库的具体操作
		try {
			// 连接数据库
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, pname);
			pstmt.setDouble(2, price);
			pstmt.setInt(3, pcount);
			pstmt.setString(4, imgpath);
			pstmt.setString(5, pid);
			
			// 进行数据库更新操作
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭数据库连接
			dbc.close();
		}
	}
		
		public void update(String pid,  String pname, double price, int pcount
				) throws Exception {
			String sql = "UPDATE product SET pname=?,price=?,pcount=? WHERE pid=?";
			PreparedStatement pstmt = null;
			DataBaseConnection dbc = null;
			
			// 下面是针对数据库的具体操作
			try {
				// 连接数据库
				dbc = new DataBaseConnection();
				pstmt = dbc.getConnection().prepareStatement(sql);
				pstmt.setString(1, pname);
				pstmt.setDouble(2, price);
				pstmt.setInt(3, pcount);
				pstmt.setString(4, pid);
				
				// 进行数据库更新操作
				pstmt.executeUpdate();
				pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				// 关闭数据库连接
				dbc.close();
			}
	}

	public void updateByPname(String pid, int pcount) throws Exception {
		String sql = "UPDATE product SET pcount=? WHERE pid=?";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		
		// 下面是针对数据库的具体操作
		try {
			// 连接数据库
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setInt(1, pcount);
			pstmt.setString(2, pid);
			
			
			// 进行数据库更新操作
			pstmt.executeUpdate();
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭数据库连接
			dbc.close();
		}
		
	}

	public List<List<String>> showItemSale(int ptype) throws Exception{
		List<List<String>>formList = new ArrayList<>();
		String sql = "SELECT pname,SUM(count) as pcount,SUM(summoney) as summony FROM userform WHERE ptype=? GROUP BY pname";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;

		// 下面是针对数据库的具体操作
		try {
			// 连接数据库
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setInt(1,ptype);
			// 进行数据库查询操作
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				// 查询出内容，之后将查询出的内容赋值给user对象
				List<String>saleForm = new ArrayList<>();
				saleForm.add(rs.getString(1));
				saleForm.add(String.valueOf(rs.getInt(2)));
				saleForm.add(String.valueOf(rs.getDouble(3)));
				formList.add(saleForm);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			throw new Exception("Exception occurred while finding sales status of various commodities!");
		} finally {
			// 关闭数据库连接
			dbc.close();
		}
		return formList;
	}

	public Product selectItemByName(String pname) throws Exception {
		Product product = null;
		String my_sql = "SELECT * FROM product WHERE pname=? ";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;

		try {
			// 连接数据库
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(my_sql);
			pstmt.setString(1, pname);

			// 进行数据库更新操作
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				product = new Product();
				product.setPid(rs.getString(1));
				product.setPtype(rs.getInt(2));
				product.setPname(rs.getString(3));
				product.setPrice(rs.getDouble(4));
				product.setPcount(rs.getInt(5));
				product.setImgpath(rs.getString(6));
			}
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭数据库连接
			dbc.close();
		}

		return product;
	}

	public List<String> getAllProPid() throws Exception{
		List<String> plist=new ArrayList<String>();
		String sql="SELECT pid FROM product ORDER BY pid desc";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;

		try {
			// 连接数据库
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			// 进行数据库更新操作
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()){
				String product=new String();
				product=rs.getString("pid");
				plist.add(product);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭数据库连接
			pstmt.close();
			dbc.close();
		}
		return plist;
	}
}
