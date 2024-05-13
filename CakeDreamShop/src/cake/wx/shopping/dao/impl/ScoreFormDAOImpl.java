package cake.wx.shopping.dao.impl;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cake.wx.shopping.dbc.DataBaseConnection;
import cake.wx.shopping.vo.ScoreForm;
import cake.wx.shopping.dao.ScoreFormDAO;

public class ScoreFormDAOImpl implements ScoreFormDAO{
    public void insert(String Username,String Pid,double ScoreValue)throws Exception {
        String sql = "INSERT INTO scoreform(username,pid,StarRate) VALUES (?,?,?) ";
        PreparedStatement pstmt = null;
        DataBaseConnection dbc = null;

        // 下面是针对数据库的具体操作
        try {
            // 连接数据库
            dbc = new DataBaseConnection();
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setString(1, Username);
            pstmt.setString(2, Pid);
            pstmt.setDouble(3, ScoreValue);
            // 进行数据库更新操作
            pstmt.executeUpdate();
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 关闭数据库连接
            dbc.close();
        }
    }

    public ScoreForm selectRecord(String UserName,String Pid) throws Exception {
        ScoreForm scoreForm = null;
        String sql = "SELECT * FROM scoreform WHERE username=? and pid=?";
        PreparedStatement pstmt = null;
        DataBaseConnection dbc = null;

        // 下面是针对数据库的具体操作
        try {
            // 连接数据库
            dbc = new DataBaseConnection();
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setString(1, UserName);
            pstmt.setString(2, Pid);
            // 进行数据库查询操作
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                // 查询出内容，之后将查询出的内容赋值给user对象
                scoreForm=new ScoreForm();
                scoreForm.setUsername(rs.getString(1));
                scoreForm.setPid(rs.getString(2));
                scoreForm.setStarRate(rs.getInt(3));
            }
            rs.close();
            pstmt.close();
        } catch (Exception e) {
            throw new Exception("操作出现异常");
        } finally {
            // 关闭数据库连接
            dbc.close();
        }
        return scoreForm;
    }

    public void deleteRecord(String UserName,String Pid) throws Exception{
        String sql = "DELETE FROM scoreform WHERE username=? and pid=?";
        PreparedStatement pstmt = null;
        DataBaseConnection dbc = null;

        // 下面是针对数据库的具体操作
        try {
            // 连接数据库
            dbc = new DataBaseConnection();
            pstmt = dbc.getConnection().prepareStatement(sql);
            pstmt.setString(1, UserName);
            pstmt.setString(2, Pid);
            // 进行数据库更新操作
            pstmt.executeUpdate();
            pstmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // 关闭数据库连接
            dbc.close();
        }

    }

    public List<ScoreForm> selectAllRecord() throws Exception{
        List<ScoreForm> recordlist = new ArrayList<ScoreForm>();
        String sql = "SELECT * FROM scoreform ";
        PreparedStatement pstmt = null;
        DataBaseConnection dbc = null;

        // 下面是针对数据库的具体操作
        try {
            // 连接数据库
            dbc = new DataBaseConnection();
            dbc.getConnection().setAutoCommit(true);
            pstmt = dbc.getConnection().prepareStatement(sql);
            // 进行数据库查询操作
            ResultSet rs = pstmt.executeQuery();

            while(rs.next()) {
                // 查询出内容，之后将查询出的内容赋值给user对象
                ScoreForm record =new ScoreForm();
                record.setUsername(rs.getString(1));
                record.setPid(rs.getString(2));
                record.setStarRate(rs.getDouble(3));
                // 将查询出来的数据加入到List对象之中
                recordlist.add(record);
            }
            rs.close();
            pstmt.close();
        } catch (Exception e) {
            throw new Exception("操作出现异常");
        } finally {
            // 关闭数据库连接
            dbc.close();
        }
        return recordlist;
    }
}
