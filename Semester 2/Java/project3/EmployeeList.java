import java.util.*;
public class EmployeeList {

    private ArrayList<Employee> employeeList = new ArrayList<Employee>();

    public void store(Employee s){//set
        employeeList.add(s);
    }

    public Employee getEmployeeFromInt(int i) {
        return employeeList.get(i);
    }
    
    public int getsize(){
        return employeeList.size();
    }
    
    public void showEmployees() {
        int counter = 1;
        System.out.println("Employee\'s List");
        System.out.println("------------------------------------");
        for (Employee employee : employeeList) {
            System.out.println(counter + ". " + employee);
            counter++;
        }
        
        System.out.println("End of the list");
    }

}
