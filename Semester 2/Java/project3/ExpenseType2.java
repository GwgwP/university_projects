import java.util.StringTokenizer;
import java.util.*;
import java.io.*;

public class ExpenseType2 extends Expense {
    private double percentage;

    public ExpenseType2(String code, String description, double genComp, double p) {
        super(code, description, genComp);
        this.percentage = p;
    }

    public ExpenseType2(){

    }
    public double getpercentage(){
        return this.percentage;
    }

    public double typos(double p){
        double s = this.getpercentage()*p;//mathimatikos typos 2
        return s;
    }

    public String toString(){
        return super.toString() + "\t" +  "Percentage :" + getpercentage();
    }

    public boolean parse(BufferedReader buff){
        int counter = 1;
        try {
            buff.reset();
            StringTokenizer lineTokens;
            String token;
            String line;
            line = buff.readLine();
            genComp = 0.0;//arxikopoihsh tag gencomp se periptwsh poy den exei prohgoumenh timh
            percentage = 0.0;//arxikopoihsh tag pers se periptwsh poy den exei prohgoumenh timh
            while (!(line.trim().equals("}"))){
                lineTokens = new StringTokenizer(line);
                token = lineTokens.nextToken();
                if (token.equals("CODE")){
                    token = lineTokens.nextToken();
                    code = token;
                    counter ++;
                    
                }else if (token.equals("TYPE")){
                    token = lineTokens.nextToken();
                    type = token;
                }
                else if (token.equals("DESCR")){
                    token = lineTokens.nextToken();
                    description = token;
                    counter ++;
                    
                }
                else if (token.equals("GENCOMP")){
                    token = lineTokens.nextToken();
                    genComp = Double.parseDouble(token);
                }
                else if (token.equals("PERS")){
                    token = lineTokens.nextToken();
                    percentage = Double.parseDouble(token);
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