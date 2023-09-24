import java.util.StringTokenizer;
import java.util.*;
import java.io.*;
public class ExpenseType1 extends Expense {
    private double priceOfComp;
    private String measure;

    public ExpenseType1(String code, String description, double genComp, double poc, String m) {
        super(code, description, genComp);
        this.priceOfComp = poc;
        this.measure = m;
    }

    public ExpenseType1(){

    }
    public String getmeasure(){
        return this.measure;
    }

    public double getpriceofComp(){
        return this.priceOfComp;
    }

    public double typos(double p){
        double s = this.getpriceofComp()*p;//mathimatikos typos 1
        return s;
    }

    public String toString(){
        return super.toString() + "\t" +  "Measure :" + getmeasure() + "\t" +  "price of compensation :" + getpriceofComp();
    }

    public boolean parse(BufferedReader buff){
        int counter = 1;
        boolean coding = false;
        boolean describing = false;
        try {
            buff.reset();
            StringTokenizer lineTokens;
            String token;
            String line;
            line = buff.readLine();
            genComp = 0.0;//arxikopoihsh tag gencomp
            priceOfComp = 0.0;//arxikopoihsh tag priceofcomp
            measure = "analogia";//arxikopoihsh tag measure se periptwsh pou den exei prohgoumenh timh
            while (!(line.trim().equals("}"))){
                lineTokens = new StringTokenizer(line);
                token = lineTokens.nextToken();
                if (token.equals("CODE")){
                    token = lineTokens.nextToken();
                    code = token;//code
                    counter ++;
                    coding = true;
                }else if (token.equals("TYPE")){
                    token = lineTokens.nextToken();
                    type = token;
                }
                else if (token.equals("DESCR")){
                    token = lineTokens.nextToken();
                    description = token;//description
                    counter ++;
                    describing = true;
                }
                else if (token.equals("GENCOMP")){
                    token = lineTokens.nextToken();
                    genComp = Double.parseDouble(token);//gencom
                }
                else if (token.equals("PRICEOFCOMP")){
                    token = lineTokens.nextToken();
                    priceOfComp = Double.parseDouble(token);//price of comp
                }
                else if (token.equals("MEASURE")){
                    token = lineTokens.nextToken();
                    measure = token;//measure
                }

                line = buff.readLine();

            }
        }catch (IOException ex) {
            System.out.println	("Error reading line ...");
        }
        if (counter == 3){
            return true;
        }else return false;
    }

}
