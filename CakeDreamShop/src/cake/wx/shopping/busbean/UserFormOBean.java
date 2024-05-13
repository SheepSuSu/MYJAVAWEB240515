package cake.wx.shopping.busbean;

import java.util.List;
import cake.wx.shopping.util.*;

import cake.wx.shopping.factory.DAOFactory;
import cake.wx.shopping.vo.Bank;
import cake.wx.shopping.vo.Product;
import cake.wx.shopping.vo.UserAccount;

public class UserFormOBean {
	
	public static void buyProcess(String username,List<Product> prolist){
//		
	    String formid=GetIdTime.getFormid();
		String time=GetIdTime.getTime();
		
		for(int i=0; i<prolist.size();i++){
			
			
			Product product=prolist.get(i);
			String pid=product.getPid();
			int ptype=product.getPtype();
			String pname=product.getPname();
			double proprice=product.getPrice();
			//�õ����˸�����Ʒ������
			int count=1;//product.getPcount();
			double summoney =count*proprice;

            try {
            	//�õ��û����ж���Ǯ
				UserAccount useraccount=DAOFactory.getUserAccountDAOInstance().selectUserAccount(username);
				double usermoney1=useraccount.getMoney();
				//�õ��û����������ж���Ǯ
				Bank bank=DAOFactory.getBankDAOInstance().selectBankByUser(username);
				double bankmoney1=bank.getMoney();
				//���û��˻��м�ȥһ����Ʒ�����Ѷ�
				double usermoney2=usermoney1-summoney;
				double bankmoney2=bankmoney1-summoney;
				//�����û��˻����
				DAOFactory.getUserAccountDAOInstance().updateUserAccount(username, usermoney2);
				//���û������˻���ȥ��ͬ����
				DAOFactory.getBankDAOInstance().updateByUsername(username,bankmoney2);
            	//ԭ�ȸ�����Ʒ��������
    			int pcount1=DAOFactory.getProductDAOInstance().selectById(pid).getPcount();
    			//���¸�����Ʒ���ݿ�
    			DAOFactory.getProductDAOInstance().updateByPname(pid, pcount1-count);
    			//���û��˵����ݿ��м���һ����Ϣ
				DAOFactory.getUserFormDAOInstance().insert(formid, username, ptype, pname, proprice, count, time, summoney);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
			
	}

}