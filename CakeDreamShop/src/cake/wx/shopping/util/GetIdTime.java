package cake.wx.shopping.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Calendar;

/**
 ���ܣ��õ��ɵ�ǰʱ���������Ʒid ����ֵ��¼id ���Լ���ǰʱ��
 **/
public class GetIdTime {

	public static String getPid() {
		long time = new Date().getTime();
		String pid = "P"+String.valueOf(time);
//System.out.println(pid);
		return pid;
	}
	
	public static String getFormid() {
		long time = new Date().getTime();
		String formid = "F"+String.valueOf(time);
//System.out.println(pid);
		return formid;
	}

	public static String getLogid() {
		long time = new Date().getTime();
		String logid = "L"+String.valueOf(time);
//System.out.println(logid);
		return logid;
	}

/*	public static String getUserid() {
		long time = new Date().getTime();
		String logid = "U"+String.valueOf(time);
//System.out.println(logid);
		return logid;
	}*/

	public static String getTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy��MM��dd��hhʱmm��ss�� ");		
		Calendar ca = Calendar.getInstance();		
		ca.add(Calendar.HOUR, +8);
		Date date = ca.getTime();
		String nowTime=sdf.format(date);
//System.out.println(nowTime);
        return nowTime;
	}
	
}
