package cake.wx.shopping.test;

import cake.wx.shopping.busbean.UserOBean;

/**
 * 
 * @author 陈志军测试
 *
 */

public class UserOBeanTest {
	
	public static void main(String []args){
		for(int i=1;i<50;i++){
			String str="用户"+i;
			String email= "cake" +i+"@126.com";
			String tel="139516526"+i;
			String address="无锡太湖大道"+i+"号";
			String sex="男";
			if(i%2==0){
				sex="女";
			}
			int age=i;
			
			String date= cake.wx.shopping.util.GetIdTime.getTime();
			UserOBean.newUserBean(str, "123", email, tel, address, sex, age, date);
		}
		
		//UserOBean.deleteUserBean("234");
	}
	

	
}
