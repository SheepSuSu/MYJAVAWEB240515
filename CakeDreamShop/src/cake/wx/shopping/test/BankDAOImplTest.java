package cake.wx.shopping.test;

import cake.wx.shopping.factory.DAOFactory;


public class BankDAOImplTest {
	
	public static void main(String[] args) {

		try {

			System.out.println((Boolean)DAOFactory.getBankDAOInstance().select("test_user", "886"));
			DAOFactory.getBankDAOInstance().update("test_user", "886",789);
			System.out.println(String.valueOf(DAOFactory.getBankDAOInstance().selectBankAccount("test_user",
					"test_account")));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
