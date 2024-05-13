package cake.wx.shopping.dao;

import cake.wx.shopping.vo.Bank;

import java.util.Base64;

public interface BankDAO {
	
	public boolean update(String cardname,String password,double money) throws Exception;
	
	public boolean select(String cardname,String password) throws Exception;

	public Bank selectBankAccount(String username,String cardname) throws Exception;
	
//	public Bank select(String cardname,String password,double money) throws Exception;
	
	public void insert(Bank bank) throws Exception;

	public void updateByUsername(String username,double money) throws Exception;

	public Bank selectBankByUser(String username) throws Exception;

	public Bank selectBankByCard(String cardname) throws Exception;
}
