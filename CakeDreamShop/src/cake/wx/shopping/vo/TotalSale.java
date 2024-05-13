package cake.wx.shopping.vo;

public class TotalSale {

    private int ptype;
    private int pcount;
    private double summoney;


    public TotalSale () {
        super();
    }

    public TotalSale (int ptype, int pcount,double summony) {
        super();
        this.ptype=ptype;
        this.pcount = pcount;
        this.summoney=summony;
    }

    public void setPtype(int ptype){
        this.ptype=ptype;
    }
    public int getPtype() {
        return ptype;
    }
    public String showPtype(){
        String type=new String();
        switch (ptype){
            case 1:
                type="Cake";
                break;
            case 2:
                type="Drink";
                break;
            default:
                type="Wrong Type!";
                break;
        }
        return type;
    }

    public void setPcount(int pcount) {
        this.pcount = pcount;
    }
    public int getPcount() {
        return pcount;
    }

    public void setSummoney(double summoney) {
        this.summoney = summoney;
    }
    public double getSummoney() {
        return summoney;
    }
}

