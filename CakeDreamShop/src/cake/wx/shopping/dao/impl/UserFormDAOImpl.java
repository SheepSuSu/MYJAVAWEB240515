package cake.wx.shopping.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cake.wx.shopping.dao.UserFormDAO;
import cake.wx.shopping.dbc.DataBaseConnection;
import cake.wx.shopping.vo.Product;
import cake.wx.shopping.vo.UserForm;

public class UserFormDAOImpl implements UserFormDAO {

	public void insert(String fid, String username,int ptype, String pname, double proprice,int count,
			String time,double summoney) throws Exception {
		String sql="INSERT INTO userform (fid,username,ptype,pname,proprice,count,time,summoney) VALUES (?,?,?,?,?,?,?,?) ";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		
		// 下面是针对数据库的具体操作
		try {
			// 连接数据库
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, fid);
			pstmt.setString(2, username);
			pstmt.setInt(3,ptype);
			pstmt.setString(4, pname);
			pstmt.setDouble(5, proprice);
			pstmt.setInt(6, count);
			pstmt.setString(7, time);
			pstmt.setDouble(8, summoney);
			// 进行数据库更新操作
System.out.println(pstmt);			
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			// 关闭数据库连接
			pstmt.close();
			dbc.close();
		}

	}

	public UserForm selectByFid(String fid) throws Exception {
		UserForm userForm = null;
		String sql = "SELECT * FROM userform WHERE fid=?";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		
		// 下面是针对数据库的具体操作
		try {
			// 连接数据库
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, fid);
			// 进行数据库查询操作
			ResultSet rs = pstmt.executeQuery();
			if (rs.next()) {
				// 查询出内容，之后将查询出的内容赋值给user对象
				userForm=new UserForm();
				userForm.setFid(rs.getString(2));
				userForm.setUsername(rs.getString(3));
				userForm.setPtype(rs.getInt(4));
				userForm.setPname(rs.getString(5));
				userForm.setProprice(rs.getDouble(6));
				userForm.setCount(rs.getInt(7));
				userForm.setTime(rs.getString(8));
				userForm.setSummoney(rs.getDouble(9));
				userForm.setSatus(rs.getInt(10));
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			throw new Exception("操作出现异常");
		} finally {
			// 关闭数据库连接
			dbc.close();
		}
		return userForm;
	}

	public void updateByFid(String fid,int status) throws Exception{
		String sql = "UPDATE userform SET status=? WHERE fid='"+fid+"'";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;

		// 下面是针对数据库的具体操作
		try {
			// 连接数据库
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setInt(1, status);


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

	public List<UserForm> selectByName(String username) throws Exception {
		List<UserForm> formList=new ArrayList<UserForm>();
		String sql = "SELECT * FROM userform WHERE username=?";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		
		// 下面是针对数据库的具体操作
		try {
			// 连接数据库
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			pstmt.setString(1, username);
			// 进行数据库查询操作
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				// 查询出内容，之后将查询出的内容赋值给user对象
				UserForm userForm = new UserForm();
				userForm.setFid(rs.getString(2));
				userForm.setUsername(rs.getString(3));
				userForm.setPtype(rs.getInt(4));
				userForm.setPname(rs.getString(5));
				userForm.setProprice(rs.getDouble(6));
				userForm.setCount(rs.getInt(7));
				userForm.setTime(rs.getString(8));
				userForm.setSummoney(rs.getDouble(9));
				userForm.setSatus(rs.getInt(10));
				formList.add(userForm);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			throw new Exception("操作出现异常");
		} finally {
			// 关闭数据库连接
			dbc.close();
		}
		return formList;
	}
	
public List<UserForm> selectAllForm() throws Exception {

	List<UserForm> formList=new ArrayList<UserForm>();
		String sql = "SELECT * FROM userform ";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;
		
		// 下面是针对数据库的具体操作
		try {
			// 连接数据库
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			// 进行数据库查询操作
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				// 查询出内容，之后将查询出的内容赋值给user对象
				UserForm userForm=new UserForm();
				userForm.setFid(rs.getString(2));
				userForm.setUsername(rs.getString(3));
				userForm.setPtype(rs.getInt(4));
				userForm.setPname(rs.getString(5));
				userForm.setProprice(rs.getDouble(6));
				userForm.setCount(rs.getInt(7));
				userForm.setTime(rs.getString(8));
				userForm.setSummoney(rs.getDouble(9));
				userForm.setSatus(rs.getInt(10));
				formList.add(userForm);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			throw new Exception("操作出现异常");
		} finally {
			// 关闭数据库连接
			dbc.close();
		}
		return formList;
	}

public List<UserForm> selectForm(int s) throws Exception{
		List<UserForm> formList=new ArrayList<UserForm>();
		String sql = "SELECT * FROM userform WHERE status='"+s+"'";
		PreparedStatement pstmt = null;
		DataBaseConnection dbc = null;

		// 下面是针对数据库的具体操作
		try {
			// 连接数据库
			dbc = new DataBaseConnection();
			pstmt = dbc.getConnection().prepareStatement(sql);
			// 进行数据库查询操作
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				// 查询出内容，之后将查询出的内容赋值给user对象
				UserForm userForm=new UserForm();
				userForm.setFid(rs.getString(2));
				userForm.setUsername(rs.getString(3));
				userForm.setPtype(rs.getInt(4));
				userForm.setPname(rs.getString(5));
				userForm.setProprice(rs.getDouble(6));
				userForm.setCount(rs.getInt(7));
				userForm.setTime(rs.getString(8));
				userForm.setSummoney(rs.getDouble(9));
				userForm.setSatus(rs.getInt(10));
				formList.add(userForm);
			}
			rs.close();
			pstmt.close();
		} catch (Exception e) {
			throw new Exception("操作出现异常");
		} finally {
			// 关闭数据库连接
			dbc.close();
		}
		return formList;
	}

	public void insert(Product product) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
