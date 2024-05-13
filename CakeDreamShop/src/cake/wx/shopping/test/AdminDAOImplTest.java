package cake.wx.shopping.test;

import cake.wx.shopping.factory.DAOFactory;
import cake.wx.shopping.vo.Admin;

import java.util.List;

public class AdminDAOImplTest {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {

			DAOFactory.getAdminDAOInstance().insert("aaa", "123");
			DAOFactory.getAdminDAOInstance().insert("bbb", "456");
			DAOFactory.getAdminDAOInstance().updatePassword("aaa", "789");
			DAOFactory.getAdminDAOInstance().selectByName("aaa");
			DAOFactory.getAdminDAOInstance().selectByNamePassword("bbb", "456");
			DAOFactory.getAdminDAOInstance().insert("ccc","kkk");
			List<Admin> adminList=DAOFactory.getAdminDAOInstance().selectByLike("li");
			for(int i=0;i<adminList.size();i++){
				System.out.println(adminList.get(i).getUsername());
			}
			DAOFactory.getAdminDAOInstance().delete("ccc");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
