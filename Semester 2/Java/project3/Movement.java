import java.util.StringTokenizer;
import java.util.*;
import java.io.*;

abstract public class Movement {

    protected Employee employee;

    protected double compensation;

    public Movement(Employee em, double com){
        this.compensation = com;
        this.employee = em;
    }

    public Movement(){
        
    }
    
    public Employee getemployee(){
        return this.employee;
    }

    public double getcompensation(){
        return this.compensation;
    }

    public void setEmployee(Employee employee){
        this.employee = employee;
    }

    public String toString(){
        return "Employee :" + getemployee().getFullName();
    }

    abstract protected boolean parse(BufferedReader br);    
}