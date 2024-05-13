package cake.wx.shopping.servlet;

import java.io.IOException;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cake.wx.shopping.util.*;
import cake.wx.shopping.busbean.UserOBean;
import cake.wx.shopping.dao.AdminDAO;
import cake.wx.shopping.factory.DAOFactory;
import cake.wx.shopping.vo.Admin;
import com.mysql.cj.xdevapi.UpdateType;

@SuppressWarnings("serial")
public class AdminServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public AdminServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int actionType = Integer.parseInt(request.getParameter("actionType"));
		
		switch(actionType){
		case 0:
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			AdminDAO admindao = DAOFactory.getAdminDAOInstance();
			try {
				if(admindao.selectByNamePassword(username, password)){
					Admin admin = admindao.selectByName(username);
					
					HttpServletRequest req = (HttpServletRequest)request ;
					HttpSession session = req.getSession() ;
					
					session.setAttribute("admin", admin);
					request.getSession().setAttribute("chooseType", actionType);
					this.getServletContext().getRequestDispatcher("/admin/manager.jsp").forward(request, response);
				}else{
					response.sendRedirect(request.getContextPath() + "/admin/fail.jsp");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			break;
		case 1:
			//this.getServletContext().getRequestDispatcher("MyCakeDreamShop_war_exploded/index.jsp").forward(request, response);

			break;
		case 2 :
			request.getSession().setAttribute("chooseType", actionType);
			this.getServletContext().getRequestDispatcher("/admin/manager.jsp").forward(request, response);
			break;
		case 21:
			request.getSession().setAttribute("chooseType", actionType);
			this.getServletContext().getRequestDispatcher("/admin/manager.jsp").forward(request, response);
			break;
		case 211:
			String username1=request.getParameter("username");
			String password1=request.getParameter("password");
			String repassword1=request.getParameter("repassword");
			System.out.println("\n username1:"+username1);
			String alertMessage=null;
			try {
				boolean pd=DAOFactory.getAdminDAOInstance().pd_admin_exist(username1);
				if (!pd){
					System.out.println("Admin dose not existed!");
					if(password1!=null&&repassword1!=null){
						if(password1.equals(repassword1)){
							try {
								alertMessage="Succeed to add!";
								request.setAttribute("alertMessage",alertMessage);
								DAOFactory.getAdminDAOInstance().insert(username1, password1);
							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}
					}
				}else {
					System.out.println("Admin has existed!");
					alertMessage="Name has been used! Failed to add!";
					request.setAttribute("alertMessage",alertMessage);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.getSession().setAttribute("chooseType", 21);
			this.getServletContext().getRequestDispatcher("/admin/manager.jsp").forward(request, response);

			break;
		//删除用户	
		case 22:
			request.getSession().setAttribute("chooseType", actionType);
			this.getServletContext().getRequestDispatcher("/admin/manager.jsp").forward(request, response);
			break;
		case 221:
			String[] usernameList=request.getParameterValues("username");
			for(int i=0;i<usernameList.length;i++)
			try {
//					DAOFactory.getUserDAOInstance().delete(usernameList[i]);
					UserOBean.deleteUserBean(usernameList[i]);
					
				} catch (Exception e1) {
				    System.out.println("删除失败！");
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			this.getServletContext().getRequestDispatcher("/admin/manager.jsp").forward(request, response);

		case 23:
			request.getSession().setAttribute("chooseType", actionType);
			this.getServletContext().getRequestDispatcher("/admin/manager.jsp").forward(request, response);
			break;
				
		case 3:
			request.getSession().setAttribute("chooseType", actionType);
			this.getServletContext().getRequestDispatcher("/admin/manager.jsp").forward(request, response);
			break;
		case 31:
			request.getSession().setAttribute("chooseType", actionType);
			this.getServletContext().getRequestDispatcher("/admin/manager.jsp").forward(request, response);
			break;
		case 311:
			String addpro_Message=null;

			String pid=GetIdTime.getPid();
			int ptype=Integer.parseInt(request.getParameter("ptype").trim());

			String pname=request.getParameter("pname");
			String price_ForTest=request.getParameter("price");
			String pcount_ForTest=request.getParameter("pcount");
			String UpFile_ForTest=request.getParameter("UpFile");


			if (pname!=null && price_ForTest!=null && pcount_ForTest!=null && UpFile_ForTest!=null){//都不为空
				if(pname.trim().equals("") || price_ForTest.trim().equals("") || pcount_ForTest.trim().equals("") || UpFile_ForTest.trim().equals("")){
					System.out.println("\npname:"+request.getParameter("pname"));
					System.out.println("price:"+request.getParameter("price"));
					System.out.println("pcount:"+request.getParameter("pcount"));
					System.out.println("UpFile:"+request.getParameter("UpFile")+"\n");
					addpro_Message="Incomplete product info! Failed to add!";
					request.setAttribute("addpro_Message",addpro_Message);
				}
				else {
					//价格price只能为正浮点数，数量pcount只能为正整数，否则报错
					//pattern1:判断价格，正浮点数（小数点后最多两位）或0
					Pattern pattern1 = Pattern.compile("(^[1-9]([0-9]+)?(\\.[0-9]{1,2})?$)|(^(0){1}$)|(^[0-9]\\.[0-9]{1,2}$)");
					//pattern2:判断数量，只能为正整数
					Pattern pattern2 = Pattern.compile("^[0-9]*[1-9][0-9]*$");
					System.out.println("\nprice:"+request.getParameter("price").trim());
					System.out.println("\npcount:"+request.getParameter("pcount").trim());
					Matcher matcher1 = pattern1.matcher(request.getParameter("price").trim());
					Matcher matcher2 = pattern2.matcher(request.getParameter("pcount").trim());

					if(matcher1.matches()){//price设置成功
						if (matcher2.matches()){//pcount设置成功
							double price=Double.parseDouble(request.getParameter("price").trim());
							int pcount=Integer.parseInt(request.getParameter("pcount").trim());
							String picname=request.getParameter("UpFile");

							int p=picname.indexOf(java.io.File.separator);
							while (p>0){
								picname = picname.substring(p+1);
								p =picname.indexOf(java.io.File.separator); }

							String path = request.getContextPath();
							String basePath = request.getScheme() + "://"
									+ request.getServerName() + ":" + request.getServerPort()
									+ path + "/";
							String imgpath=basePath+"CakeImage/"+picname;
							System.out.println("imgpath:"+imgpath);
							try {
								DAOFactory.getProductDAOInstance().insert(pid, ptype, pname, price, pcount, imgpath);
							} catch (Exception e1) {
								// TODO Auto-generated catch block
								e1.printStackTrace();
							}

						}else {//pcount设置错误
							addpro_Message="Product count input error! Failed to add!";
							request.setAttribute("addpro_Message",addpro_Message);
						}
					}else {//price设置错误
						addpro_Message="Price input error! Failed to add!";
						request.setAttribute("addpro_Message",addpro_Message);
					}
				}
			}else {//为null
				addpro_Message="Product info is null! Failed to add!";
				request.setAttribute("addpro_Message",addpro_Message);
			}
			this.getServletContext().getRequestDispatcher("/admin/manager.jsp").forward(request, response);
			break;
		case 32:
			request.getSession().setAttribute("chooseType", actionType);
			this.getServletContext().getRequestDispatcher("/admin/manager.jsp").forward(request, response);
			break;
		case 321:
			String[] pList=request.getParameterValues("pid");
			for(int i=0;i<pList.length;i++){
				try {
					DAOFactory.getProductDAOInstance().deleteById(pList[i]);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			this.getServletContext().getRequestDispatcher("/admin/manager.jsp").forward(request, response);

			
			break;
		case 33:
			request.getSession().setAttribute("chooseType", actionType);
			this.getServletContext().getRequestDispatcher("/admin/manager.jsp").forward(request, response);
			break;
		case 34:
//Admin admin=(Admin)request.getSession().getAttribute("admin");
//if(admin==null){
//System.out.print("kong");
//}
			request.getSession().setAttribute("chooseType", actionType);
			this.getServletContext().getRequestDispatcher("/admin/manager.jsp").forward(request, response);
			break;	
		case 341:
			request.getSession().setAttribute("chooseType", actionType);
			String pid1=request.getParameter("pid");
			request.getSession().setAttribute("pid", pid1);
			this.getServletContext().getRequestDispatcher("/admin/manager.jsp").forward(request, response);
			break;
		case 3411:
			String pid2=(String)request.getSession().getAttribute("pid");
			String pname2=request.getParameter("pname");
			int pcount2=Integer.parseInt(request.getParameter("pcount"));
			double price2=Double.parseDouble(request.getParameter("price"));
			try {
					DAOFactory.getProductDAOInstance().update(pid2, pname2, price2, pcount2);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				request.getSession().setAttribute("chooseType", 34);
				this.getServletContext().getRequestDispatcher("/admin/manager.jsp").forward(request, response);
			break;
		case 4:
			request.getSession().setAttribute("chooseType", actionType);
			this.getServletContext().getRequestDispatcher("/admin/manager.jsp").forward(request, response);
			break;
		case 41:
			request.getSession().setAttribute("chooseType", actionType);
			this.getServletContext().getRequestDispatcher("/admin/manager.jsp").forward(request, response);
			break;
		case 42:
			request.getSession().setAttribute("chooseType", actionType);
			this.getServletContext().getRequestDispatcher("/admin/manager.jsp").forward(request, response);
			break;
		case 43:
			break;
		case 5:
			request.getSession().setAttribute("chooseType", actionType);
			this.getServletContext().getRequestDispatcher("/admin/manager.jsp").forward(request, response);
			break;
		case 51:
			request.getSession().setAttribute("chooseType", actionType);
			this.getServletContext().getRequestDispatcher("/admin/manager.jsp").forward(request, response);
			break;
		case 52:
			request.getSession().setAttribute("chooseType", actionType);
			this.getServletContext().getRequestDispatcher("/admin/manager.jsp").forward(request, response);
			break;
		case 53:
			request.getSession().setAttribute("chooseType", actionType);
			this.getServletContext().getRequestDispatcher("/admin/manager.jsp").forward(request, response);
			break;
		case 531:
			String[] ToBeShipped_pList=request.getParameterValues("fid");
			for(int i=0;i<ToBeShipped_pList.length;i++){
				try {
					DAOFactory.getUserFormDAOInstance().updateByFid(ToBeShipped_pList[i],1);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					System.out.println("商品发货出错了！！！");
				}
			}
			request.getSession().setAttribute("chooseType", 5);
			this.getServletContext().getRequestDispatcher("/admin/manager.jsp").forward(request, response);
			break;

		case 6:
			request.getSession().setAttribute("chooseType", actionType);
			this.getServletContext().getRequestDispatcher("/admin/manager.jsp").forward(request, response);
			break;
		case 61:
			request.getSession().setAttribute("chooseType", actionType);
			this.getServletContext().getRequestDispatcher("/admin/manager.jsp").forward(request, response);
			break;
		case 62:
			request.getSession().setAttribute("chooseType", actionType);
			this.getServletContext().getRequestDispatcher("/admin/manager.jsp").forward(request, response);
			break;
		case 63:
			request.getSession().setAttribute("chooseType", actionType);
			this.getServletContext().getRequestDispatcher("/admin/manager.jsp").forward(request, response);
			break;

		case 7:
			request.getSession().removeAttribute("admin");
			request.getSession().removeAttribute("chooseType");
			response.sendRedirect(request.getContextPath()+"/administrator.jsp");
			break;
		default:
			break;
		}
		
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
