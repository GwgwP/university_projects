import java.util.StringTokenizer;
import java.util.*;
import java.io.*;
public class SpecificType {

    protected Employee employee;
    protected Expense expense;
    protected String justification, codeEmployee, typeofexpense,expensecode;
    protected double value;

    public SpecificType(Employee employee, Expense expense, String justification, double value) {
        this.employee = employee;
        this.expense = expense;
        this.justification = justification;
        this.value = value;
    }

    public void setexpensetype(String s){
        this.typeofexpense = s;
    }

    public void setemployee(Employee employee){
        this.employee = employee;
    }

    public void setexpense(Expense expense){
        this.expense = expense;
    }

    public SpecificType(){

    }
    public String gettypeofexpense(){
        return this.typeofexpense;
    }
    public Employee getEmployee(){
        return this.employee;
    }

    public Expense getExpense(){
        return this.expense;
    }

    public String getjustification(){
        return this.justification;
    }

    public double getvalue(){
        return this.value;
    }

    public double valueofcompensation(){//ajia apozhmeivshs me ton typo tou upologismou tou typou dapanhs
        return this.getExpense().typos(this.getvalue());
    }

    public String toString(){
        return "Employee :" + getEmployee().getFullName() + "\t" + "Expense :" + getExpense().code + "\t" + "Justification :" + getjustification()  + "\t" + "Value" + valueofcompensation();
    }

    public boolean parse(BufferedReader buff){

        
        try {
            
            buff.reset();
            StringTokenizer lineTokens;
            String token;
            String line;
            line = buff.readLine();
            justification = "-----------";
            while (!(line.trim().equals("}"))){
                lineTokens = new StringTokenizer(line);
                token = lineTokens.nextToken();
                if (token.equals("EMPLOYEE_CODE")){
                    token = lineTokens.nextToken();
                    codeEmployee = token;
                    
                }
                else if (token.equals("EXPENSE_TYPE")){
                    token = lineTokens.nextToken();
                    typeofexpense = token;
                    
                }
                else if (token.equals("EXPENSE_CODE")){
                    token = lineTokens.nextToken();
                    expensecode = token;
                    
                }
                else if (token.equals("JUSTIF")){
                    token = lineTokens.nextToken();
                    justification = token;
                }
                else if (token.equals("VAL")){
                    token = lineTokens.nextToken();
                    value = Double.parseDouble(token);
                }
                line = buff.readLine();

            }
        }catch (IOException ex) {
            System.out.println	("Error reading line ...");
        }
        
            return true;
        
          
    }

}