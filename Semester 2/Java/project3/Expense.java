import java.util.StringTokenizer;
import java.util.*;
import java.io.*;
abstract class Expense {
    protected  String description, type;
    protected double genComp;
    protected String code;
    
    public Expense(){

    }
    public Expense(String code, String description, double genComp) {
        this.code = code;
        this.description = description;
        this.genComp = genComp;
    }

    public String getCode(){
        return this.code;
    }
    
    public String getDescription() {
        return this.description;
    }

    public double  getgenComp(){
        return this.genComp;
    }
    
    public String gettype(){
        return this.type;
    }

    public double check(double poso){
        if (getgenComp() > 0){
            if (getgenComp()< poso){
                return getgenComp();
            }
            else {
                return poso;
            }
        }
        else{ 
            return poso;}
    }

    abstract double typos(double p);//mathimatikos typos

    public String toString(){
        return "Code :" + getCode() + "\t" + "Description :" + getDescription() + "\t" + "Max compensation :" + getgenComp();
    }

    abstract protected boolean parse(BufferedReader br);
}
