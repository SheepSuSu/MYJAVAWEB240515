package cake.wx.shopping.vo;

public class ScoreForm {
    private String Username;
    private String Pid;
    private double StarRate;

    public ScoreForm(){
        super();
    }

    public ScoreForm(String Username,String Pid,double StarRate){
        this.Username=Username;
        this.Pid=Pid;
        this.StarRate=StarRate;
    }

    public String getUsername() {
        return Username;
    }
    public void setUsername(String username) {
        Username = username;
    }

    public String getPid() {
        return Pid;
    }
    public void setPid(String pid) {
        Pid = pid;
    }

    public double getStarRate() {
        return StarRate;
    }
    public void setStarRate(double starRate) {
        StarRate = starRate;
    }


}
