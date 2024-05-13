package cake.wx.shopping.dbc ;
import java.sql.* ;


public class DataBaseConnection
{
	private final String DBDRIVER = "com.mysql.cj.jdbc.Driver" ;
	private final String DBURL = "jdbc:mysql://121.40.25.109:3306/mycakeshop?useUnicode=true&characterEncoding=UTF-8" ;
	private final String DBUSER = "root" ;
	private final String DBPASSWORD = "SuXinYi0224" ;
	private Connection conn = null ;

	public DataBaseConnection()
	{
		try
		{
			Class.forName(DBDRIVER) ;
			this.conn = DriverManager.getConnection(DBURL,DBUSER,DBPASSWORD) ;	
		}
		catch (Exception e)
		{
			System.out.println("MY���ݿ�����ʧ�ܣ�");
		}
	}

	public Connection getConnection()
	{
//		try {
//			this.conn.setAutoCommit(false);
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
		return this.conn;
	}

	public void close()
	{
		try
		{
			this.conn.close() ;
		}
		catch (Exception e)
		{
		}		
	}
};