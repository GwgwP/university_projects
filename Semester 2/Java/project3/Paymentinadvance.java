import java.util.StringTokenizer;
import java.util.*;
import java.io.*;

public class Paymentinadvance extends Movement{

    private String employeecode, type;
    
    public Paymentinadvance(Employee em, double com){
        super(em, com);
    }
    
    public Paymentinadvance(){

    }

    public String toString(){
        return super.toString() + "\t" + "Payment in advance :" + getcompensation();
    }

    public boolean parse(BufferedReader buff){
        try {
            buff.reset();
            StringTokenizer lineTokens;
            String token;
            String line;    
            line = buff.readLine();      
            while ( !(line.trim().equals("}")) ) {
                lineTokens = new StringTokenizer(line);
                token = lineTokens.nextToken();  
                if (token.equals("EMPLOYEE_CODE")) {
                   token = lineTokens.nextToken(); 
                   this.employeecode = token;
                }
                else if (token.equals("TYPE")){
                    token = lineTokens.nextToken();
                    this.type = token;
                }
                else if (token.equals("VAL")) {
                   token = lineTokens.nextToken(); 
                    this.compensation = Double.parseDouble(token);
                }                
                line = buff.readLine();
                //System.out.println(line);                                
            }   
        } catch (IOException ex) {
            System.out.println	("Error reading line ...");
        }
        
            return true;
    
    }
}