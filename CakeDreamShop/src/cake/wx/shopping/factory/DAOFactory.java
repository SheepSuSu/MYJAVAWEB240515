package cake.wx.shopping.factory ;

import cake.wx.shopping.dao.*;
import cake.wx.shopping.dao.impl.AdminDAOImpl;
import cake.wx.shopping.dao.impl.BankDAOImpl;
import cake.wx.shopping.dao.impl.MoneyLogDAOImpl;
import cake.wx.shopping.dao.impl.ProductDAOImpl;
import cake.wx.shopping.dao.impl.UserAccountDAOImpl;
import cake.wx.shopping.dao.impl.UserDAOImpl;
import cake.wx.shopping.dao.impl.UserFormDAOImpl;
import cake.wx.shopping.dao.impl.TotalSaleImpl;
import cake.wx.shopping.dao.impl.ScoreFormDAOImpl;


public class DAOFactory
{	
	public static UserDAO getUserDAOInstance(){
		return new UserDAOImpl();
	}
	
	public static AdminDAO getAdminDAOInstance(){
		return new AdminDAOImpl();
	}
	
	public static ProductDAO getProductDAOInstance(){
		return new ProductDAOImpl();
	}
	
	public static BankDAO getBankDAOInstance(){
		return new BankDAOImpl();
	}
	
	public static UserAccountDAO getUserAccountDAOInstance(){
		return new UserAccountDAOImpl();
	}
	
	public static UserFormDAO getUserFormDAOInstance(){
		return new UserFormDAOImpl();
	}

	public static TotalSaleDAO getTotalSaleDAOInstance(){
		return new TotalSaleImpl();
	}

	public static MoneyLogDAO getMoneyLogDAOInstance(){
		return new MoneyLogDAOImpl();
	}
	public static ScoreFormDAO getScoreFormDAOInstance(){
		return new ScoreFormDAOImpl();
	}
}
