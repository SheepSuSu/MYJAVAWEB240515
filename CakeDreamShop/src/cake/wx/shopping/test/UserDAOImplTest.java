package cake.wx.shopping.test;

import java.util.List;

import cake.wx.shopping.factory.DAOFactory;
import cake.wx.shopping.vo.User;

public class UserDAOImplTest {
	public static void main(String[] args) {

		try {
			List <User>uerList=DAOFactory.getUserDAOInstance().selectAll();
			System.out.println(uerList.size());
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
	}
}
