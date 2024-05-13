package cake.wx.shopping.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cake.wx.shopping.vo.TotalSale;
import cake.wx.shopping.dbc.DataBaseConnection;
import cake.wx.shopping.dao.TotalSaleDAO;
import cake.wx.shopping.vo.User;

public class TotalSaleImpl implements TotalSaleDAO{

    public List<TotalSale> selectTotalSale() throws Exception{
        List<TotalSale> formList = new ArrayList<TotalSale>();
        String sql = "SELECT ptype,COUNT(*) as pcount,SUM(summoney) as summony FROM userform GROUP BY ptype";
        PreparedStatement pstmt = null;
        DataBaseConnection dbc = null;

        // 下面是针对数据库的具体操作
        try {
            // 连接数据库
            dbc = new DataBaseConnection();
            pstmt = dbc.getConnection().prepareStatement(sql);
            // 进行数据库查询操作
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                // 查询出内容，之后将查询出的内容赋值给user对象
                TotalSale saleForm=new TotalSale();
                saleForm.setPtype(rs.getInt(1));
                saleForm.setPcount(rs.getInt(2));
                saleForm.setSummoney(rs.getDouble(3));
                formList.add(saleForm);
            }
            rs.close();
            pstmt.close();
        } catch (Exception e) {
            throw new Exception("Exception occurred while finding sales status of various commodities!");
        } finally {
            // 关闭数据库连接
            dbc.close();
        }
        return formList;
    }
}
