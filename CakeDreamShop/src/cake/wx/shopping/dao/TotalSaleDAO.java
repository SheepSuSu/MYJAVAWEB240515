package cake.wx.shopping.dao;

import java.util.List;

import cake.wx.shopping.vo.TotalSale;


public interface TotalSaleDAO {
    public List<TotalSale> selectTotalSale() throws Exception;
}
