package cake.wx.shopping.test;

import cake.wx.shopping.factory.DAOFactory;

public class MoneyLogDAOImplTest {


	public static void main(String[] args) {

//		try {
//			DAOFactory.getMoneyLogDAOInstance().insert("Y08054", "”‡”Ò¿º", 63325.6663, "9£∫53");
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		try {
			System.out.println(DAOFactory.getMoneyLogDAOInstance().selectByName("”‡”Ò¿º"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	

}
