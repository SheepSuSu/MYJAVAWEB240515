package cake.wx.shopping.dao;

import java.util.List;

import cake.wx.shopping.vo.ScoreForm;
import cake.wx.shopping.vo.User;

public interface ScoreFormDAO {
    public void insert(String Username,String Pid,double ScoreValue)throws Exception;
    public ScoreForm selectRecord(String UserName,String Pid)throws Exception;
    public void deleteRecord(String UserName,String Pid) throws Exception;
    public List<ScoreForm> selectAllRecord() throws Exception;
}
