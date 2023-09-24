import java.util.StringTokenizer;
import java.util.*;
import java.io.*;

public class Employee {
    private String firstName, lastName, code;
    private double genMaxComp;
    
    public Employee(String f, String l, double g){
        this.firstName = f;
        this.lastName = l;
        this.genMaxComp = g;
    }

    public Employee(){

    }

    public String getFirstname(){
        return this.firstName;
    }

    public String getSurname(){
        return this.lastName;
    }

    public String getcodeemployee(){
        return this.code;
    }
    public void setemployeecode(String code){
        this.code = code;
    }

    public String getFullName() {
        return this.firstName + " " + this.lastName;
    }

    public double getComp() {
        return this.genMaxComp;
    }

    public String toString(){
        return "Full name  :" + getFullName() + "\t" +  "Maximum Compensation for this Employee :" + getComp();
    }

    public boolean parse(BufferedReader buff){
        int counter = 0;
        boolean coding = false;
        boolean surnaming = false;
        boolean firstnaming = false; 
        genMaxComp = 150.0;//arxikopoihsh tou tag max_monthly_compensation
        try {
            buff.reset();
            StringTokenizer lineTokens;
            String token;
            String line;    
            line = buff.readLine(); 
            genMaxComp = 0.0;       
            while ( !(line.trim().equals("}")) ) {
                lineTokens = new StringTokenizer(line);
                token = lineTokens.nextToken();  
                if (token.equals("CODE")) {
                   token = lineTokens.nextToken(); 
                   code = token;
                   counter ++ ; 
                   coding = true;
                }
                else if (token.equals("SURNAME")) {
                   token = lineTokens.nextToken(); 
                   lastName = token;
                   counter ++;
                   surnaming = true;
                }
                else if (token.equals("FIRSTNAME")) {
                   token = lineTokens.nextToken(); 
                   firstName = token;
                   counter ++;
                   firstnaming = true;
                }
                else if (token.equals("GEN_MAX_COMP")) {
                   token = lineTokens.nextToken(); 
                   genMaxComp = Double.parseDouble(token);
                }
                line = buff.readLine();
                //System.out.println(line);                
            }   
        } catch (IOException ex) {
            System.out.println	("Error reading line ...");
        }
        
        if (counter == 3){
            return true;
        }
        else 
            return false;
    }
}
