import java.util.StringTokenizer;
import java.util.*;
import java.io.*;
public class Compensate extends Movement{
    private Expense expense;
    private String employeecode, expensetype, type, expensecode;
    public Compensate(Employee em, double com, Expense expense){
        super(em, com);
        this.expense = expense;
    }

    public Compensate(){

    }

    public void setExpense(Expense exp){
        this.expense = exp;
    }

    public Expense getexpense(){
        return this.expense;
    }

    public String toString(){
        return super.toString() + "\t" + "Ajia apozhmeiwshs :" + getcompensation() + "\t" + "Type of Expense :" + getexpense();
    }
    
    public boolean parse(BufferedReader buff){
        int counter = 0; 
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
                else if (token.equals("EXPENSE_TYPE")) {
                   token = lineTokens.nextToken(); 
                   this.expensetype = token;
                   counter++;
                }
                else if (token.equals("VAL")) {
                   token = lineTokens.nextToken(); 
                    this.compensation = Double.parseDouble(token);
                }                
                else if (token.equals("TYPE")){
                    token = lineTokens.nextToken();
                    this.type = token;
                }
                else if (token.equals("EXPENSE_CODE")){
                    token = lineTokens.nextToken();
                    this.expensecode = token;
                }
                line = buff.readLine();
                //System.out.println(line);                                
            }   
        } catch (IOException ex) {
            System.out.println	("Error reading line ...");
        }
        
        if (counter == 1) {
            return true;
        }
        else {
            return false;
        }
    }
}