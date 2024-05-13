package cake.wx.shopping.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cake.wx.shopping.factory.DAOFactory;
import cake.wx.shopping.vo.*;
import cake.wx.shopping.util.*;



public class ScoreServlet  extends HttpServlet {

    public ScoreServlet() {
        super();
    }

    public void destroy() {
        super.destroy(); // Just puts "destroy" string in log
        // Put your code here
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int ScoreType=Integer.parseInt(request.getParameter("ScoreType"));
        System.out.println("ScoreType:"+request.getParameter("ScoreType")+'\n');
        switch(ScoreType) {
            case 0:
                String[] item = request.getParameterValues("selected_order");
                String ItemName=null;
                if(item!=null && item.length>0){
                    System.out.println("AAA is working!!!");
                    System.out.println(item);
                    System.out.println(item.length);
                    int pd=0;
                    int selected=Integer.parseInt(item[0]);
                    System.out.println("被选择的商品顺序:"+selected);
                    User user_a=new User();
                    user_a=(User)request.getSession().getAttribute("loginusername");
                    System.out.println("user_a name:"+user_a.getUsername());
                    List<UserForm> OrderpList_a= null;
                    try {
                        OrderpList_a = DAOFactory.getUserFormDAOInstance().selectByName(user_a.getUsername());
                    } catch (Exception e) {
                        e.printStackTrace();
                    }

//		List OrderpList1_a = (List)(request.getSession().getAttribute("OrderpList_a"));
//		request.getSession().setAttribute("OrderpList_a",OrderpList1_a);

//					request.getSession().setAttribute("OrderpList_a",OrderpList_a);
                    System.out.println("Ready to be modified!");
                    int aaa=0;
                    ItemName=new String();
                    for (UserForm order : OrderpList_a){
                        if(aaa==selected){
                            ItemName=order.getPname();
                            break;
                        }else {
                            aaa++;
                        }
                    }
                    System.out.println("ItemName: " + ItemName);
                }else{
                    System.out.println("there is no checkbox value to be choose.");
                }



                request.getSession().setAttribute("pname", ItemName);
           /*     System.out.println("selectedItem Name:"+ItemName);*/
//                response.sendRedirect(request.getContextPath()+"/score.jsp");
                this.getServletContext().getRequestDispatcher("/score.jsp").forward(request, response);
                break;
            case 1:
                System.out.println("---------------------------------------------");
                String Pid=(String) request.getSession().getAttribute("Pid");
                System.out.println("Pid:"+Pid);
                User user=new User();
                user=(User)request.getSession().getAttribute("loginusername");
                String UserName=user.getUsername();
                System.out.println("UserName:"+UserName);
                double score_value=Double.parseDouble(request.getParameter("satisfaction"));
                System.out.println("score-value："+score_value);
                ScoreForm obj=null;
                try {
                    obj=DAOFactory.getScoreFormDAOInstance().selectRecord(UserName,Pid);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                if(obj!=null){
                    try {
                        DAOFactory.getScoreFormDAOInstance().deleteRecord(UserName,Pid);
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
                try {
                    DAOFactory.getScoreFormDAOInstance().insert(UserName,Pid,score_value);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                this.getServletContext().getRequestDispatcher("/scoreOK.jsp").forward(request, response);
                break;
            default:
                break;
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    public void init() throws ServletException {
        // Put your code here
    }
}
