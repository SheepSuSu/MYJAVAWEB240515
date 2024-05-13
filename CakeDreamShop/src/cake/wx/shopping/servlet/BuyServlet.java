package cake.wx.shopping.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cake.wx.shopping.busbean.UserFormOBean;
import cake.wx.shopping.factory.DAOFactory;
import cake.wx.shopping.vo.Product;
import cake.wx.shopping.vo.User;
import cake.wx.shopping.vo.UserAccount;

public class BuyServlet extends HttpServlet {

	List pList=new ArrayList();
	public BuyServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
       String pid=request.getParameter("pid");
       
    
       
//       String option=request.getParameter("option");
       if("buy".equals(request.getParameter("option"))){
    	   String[] pList2=request.getParameterValues("pids");
    	   if(pList2==null){
    		   response.sendRedirect(request.getContextPath()+"/buyfail.jsp");
    		   return;
    	   }
    	   List<Product> pList3=new ArrayList<Product>();
    	   for(int i=0;i<pList2.length;i++){
				try {
					
			Product product=DAOFactory.getProductDAOInstance().selectById(pList2[i]);
			pList3.add(product);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		   User user=(User)request.getSession().getAttribute("loginusername");
		   double usermoney2=0;
		   double summoney =0.0;
		   System.out.println("购物车里有pList3："+pList3.size());
		   for(int i=0; i<pList3.size();i++) {

			   Product product = pList3.get(i);
			   double proprice1 = product.getPrice();
			   //得到买了该样商品的数量
			   int count1 = 1;//product.getPcount();
			   summoney +=count1 * proprice1;
			   //得到用户现有多少钱
			   UserAccount useraccount = null;
			   try {
				   useraccount = DAOFactory.getUserAccountDAOInstance().selectUserAccount(user.getUsername());
				   double usermoney1 = useraccount.getMoney();
				   //在用户账户中减去一样商品的消费额
				   usermoney2 = usermoney1 - summoney;
			   } catch (Exception e) {
				   e.printStackTrace();
			   }
			   if (usermoney2<0.0){
				   response.sendRedirect(request.getContextPath()+"/buyfail1.jsp");
				   return;
			   }
		   }
           System.out.println(usermoney2+"Money Enough, ready to buy!\n");
    	   UserFormOBean.buyProcess(user.getUsername(), pList3);
    	   request.getSession().removeAttribute("pList");
    	   response.sendRedirect(request.getContextPath()+"/buyok.jsp");
       }else{
    	   if(pid!=null){
        	   pList.add(pid);
               request.getSession().setAttribute("pList", pList);
               response.sendRedirect(request.getContextPath()+"/shopcart.jsp");	 
               return;
           }
       }
       
       
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
