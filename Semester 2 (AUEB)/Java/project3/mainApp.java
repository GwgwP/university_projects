import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.imageio.plugins.tiff.ExifInteroperabilityTagSet;

import java.util.concurrent.TimeUnit;
import java.util.concurrent.SubmissionPublisher;
import java.util.*;
import java.io.*;
/*Patapios Dimitrios Pararas :3200148
  Gwgw Petsa :3200155
  Panagiotis Triantafillidhs :3200199
  Omada :65 */
public class mainApp {

    static ExpenseList expenselist = new ExpenseList();
    public static void parseExpenseList(String aFileName){
        System.out.println("Reading  Expense Type File");
        System.out.println("Loading.....");
        try {
            BufferedReader buff = new BufferedReader(new InputStreamReader(new FileInputStream(aFileName)));
            StringTokenizer lineTokens;
            String token;
            String line;
            boolean eof = false;//end of file,h kenh seira
            boolean ok;
            int errors = 0;
            while (!eof){
                line = buff.readLine();
                boolean typing = false;//prepei na yparxei type
                if (line == null)
                    eof = true;
                else {
                    if (line.trim().equals("EXPENSE_TYPE")){
                        line = buff.readLine();
                        if (line.trim().equals("{")){
                            errors += 1;
                            buff.mark(2048);
                            while (!(line.trim().equals("}")) && (!eof)){
                                line = buff.readLine();
                                lineTokens = new StringTokenizer(line);
                                token = lineTokens.nextToken();
                                if (token.toUpperCase().equals("TYPE")){
                                    typing = true;
                                    token = lineTokens.nextToken();
                                    if (token.equals("1")){
                                        ExpenseType1 e = new ExpenseType1();
                                        ok = e.parse(buff);
                                        
                                        if (ok)
                                            expenselist.store(e);
                                        break;
                                    }else if (token.equals("2")){
                                        ExpenseType2 e = new ExpenseType2();
                                        ok = e.parse(buff);
                                        
                                        if (ok)
                                            expenselist.store(e);
                                        break;
                                    }
                                    
                                    }
                                }
                            }
                        }
                    }
                }
                System.out.println("Errors occured in reading expense type file: " + (errors - expenselist.getsize()));
                Sleep(3);
                buff.close();
            }
            catch (IOException ex) {
                System.out.println("Error reading file....");
        }
    }

    static EmployeeList employeelist = new EmployeeList();
    public static void parseEmployeeList(String aFileName){
        System.out.println("Reading  Employee File");
        System.out.println("Loading.....");
        try {
            BufferedReader buff = new BufferedReader(new InputStreamReader(new FileInputStream(aFileName)));
            StringTokenizer lineTokens;
            String token;
            String line;
            boolean eof = false;
            boolean ok;
            int errors = 0;
            while (!eof){
                line = buff.readLine();
                if (line == null)
                    eof = true;
                else {
                    if (line.trim().equals("EMPLOYEE")){
                        line = buff.readLine();
                        if (line.trim().equals("{")){
                            errors +=1;
                            buff.mark(2048);
                            while (!(line.trim().equals("}")) && (!eof)){
                                line = buff.readLine();
                                lineTokens = new StringTokenizer(line);
                                token = lineTokens.nextToken();
                                Employee e = new Employee();
                                ok = e.parse(buff);
                                    if (ok)
                                        employeelist.store(e);
                                        break;
                                }
                            }
                        }
                    }
                }
                System.out.println("Errors in reading employee file : " + (errors - employeelist.getsize()));
                Sleep(3);
                buff.close();
            }
            catch (IOException ex) {
                System.out.println("Error reading file");
        }
    }
    static SpecificList specificlist = new SpecificList();
    public static void parseSpecificList(String aFileName){
        System.out.println("Reading  Expense File");
        System.out.println("Loading.....");
        try {
            BufferedReader buff = new BufferedReader(new InputStreamReader(new FileInputStream(aFileName)));
            StringTokenizer lineTokens;
            String token;
            String line;
            SpecificType e ;
            boolean eof = false;
            boolean ok;
            String employeecode;
            String expensecode;
            int errors = 0;
            while (!eof){
                line = buff.readLine();
                boolean expensecoding = false;
                boolean typing = false;
                boolean employeecoding = false;
                boolean valuing = false;
                if (line == null)
                    eof = true;
                else {
                    if (line.trim().equals("EXPENSE")){
                        line = buff.readLine();
                        if (line.trim().equals("{")){
                            errors += 1;
                            buff.mark(2048);
                            e = new SpecificType();
                            //Employee em = null;
                            //Expense exp = null;
                            while (!(line.trim().equals("}")) && (!eof)){
                                line = buff.readLine();
                                lineTokens = new StringTokenizer(line);
                                token = lineTokens.nextToken();
                                if (token.toUpperCase().equals("EMPLOYEE_CODE")){
                                    token = lineTokens.nextToken();
                                    employeecode = token;
                                    for (int i = employeelist.getsize() - 1;i >= 0;i--){
                                        
                                        if (employeelist.getEmployeeFromInt(i).getcodeemployee().equals(employeecode)){
                                            Employee em = employeelist.getEmployeeFromInt(i);
                                            e.setemployee(em);
                                            employeecoding = true;
                                            break;
                                        }
                                    }
                                }
                                if (token.toUpperCase().equals("EXPENSE_CODE")){
                                    token = lineTokens.nextToken();
                                    expensecode = token;
                                    for (int i = expenselist.getsize() - 1; i>= 0; i--){
                                        if (expenselist.getExpenseFromInt(i).getCode().equals(expensecode)){
                                            Expense exp = expenselist.getExpenseFromInt(i);
                                            e.setexpense(exp);
                                            expensecoding = true;
                                            break;
                                        }
                                    }
                                }
                                if (token.toUpperCase().equals("VAL")){
                                    valuing = true;
                                }
                                if (token.toUpperCase().equals("EXPENSE_TYPE")){
                                    typing = true;
                                    
                                }
                                if (valuing && employeecoding && typing && expensecoding){
                                    
                                    //e.setemployee(em);
                                    //e.setexpense(exp);
                                    ok = e.parse(buff);
                                    
                                    if (ok)
                                        specificlist.store(e);
                                    break;
                                }
                                }
                            }
                        }
                    }
                }
                System.out.println("Errors occured in reading expense list : " + (errors - specificlist.getsize()));
                Sleep(3);
                buff.close();
            }
            catch (IOException ex) {
                System.out.println("Error reading file");
        }
    }
    static Movementlist movementlist = new Movementlist();
    public static void parseMovementList(String aFileName){
        System.out.println("Reading  TRN File");
        System.out.println("Loading.....");
        try {
            BufferedReader buff = new BufferedReader(new InputStreamReader(new FileInputStream(aFileName)));
            StringTokenizer lineTokens;
            String token;
            String line;
            boolean eof = false;
            boolean ok;
            int errors = 0;
            while (!eof){
                line = buff.readLine();
                if (line == null)
                    eof = true;
                else {
                    if (line.trim().equals("TRN")){
                        line = buff.readLine();
                        if (line.trim().equals("{")){
                            errors += 1;
                            buff.mark(2048);
                            String type = "";
                            boolean employeecoding = false;
                            boolean expensetyping = false;
                            boolean expensecoding = false;
                            boolean typing = false;
                            boolean valuing = false;
                            Employee em = null;
                            Expense exp = null;
                            while (!(line.trim().equals("}")) && (!eof)){
                                line = buff.readLine();
                                lineTokens = new StringTokenizer(line);
                                token = lineTokens.nextToken();
                                if (token.toUpperCase().equals("EMPLOYEE_CODE")){//gia oles tis kinhseis
                                    token = lineTokens.nextToken();
                                    for (int i = employeelist.getsize() - 1; i>= 0;i--){
                                        if (employeelist.getEmployeeFromInt(i).getcodeemployee().equals(token)){
                                            em = employeelist.getEmployeeFromInt(i);
                                            employeecoding = true;
                                            break;
                                        }
                                    }
                                }
                                if (token.toUpperCase().equals("EXPENSE_CODE")){//gia apozhmeiwsh mono
                                    token = lineTokens.nextToken();
                                    for (int i = expenselist.getsize() - 1; i>=0;i--){
                                        if (expenselist.getExpenseFromInt(i).getCode().equals(token)){
                                            exp = expenselist.getExpenseFromInt(i);
                                            expensecoding = true;
                                            break;
                                        }
                                    }
                                }
                                if (token.toUpperCase().equals("VAL")){
                                    valuing = true;
                                }
                                if (token.toUpperCase().equals("EXPENSE_TYPE")){
                                    expensetyping = true;
                                }
                                if (token.toUpperCase().equals("TYPE")){
                                    token = lineTokens.nextToken();
                                    type = token;
                                    typing = true;
                                }
                                if (token.equals("}") && employeecoding && valuing && typing){
                            
                                    if (type.toUpperCase().equals("\"PROKATAVOLI\"") ){
                                        Paymentinadvance mov = new Paymentinadvance();
                                        mov.setEmployee(em);
                                        ok = mov.parse(buff);
                                        if (ok){
                                            movementlist.store(mov);
                                        }
                                    }else if (type.equals("\"APOZIMIOSI\"")){
                                        if (expensecoding && expensetyping){
                                            Compensate mov = new Compensate();
                                            mov.setEmployee(em);
                                            mov.setExpense(exp);
                                            ok = mov.parse(buff);
                                            if (ok){
                                                movementlist.store(mov);
                                            }
                                        }
                                    }else if (type.equals("\"DIAFORA\"")){
                                        Diafora mov = new Diafora();
                                        mov.setEmployee(em);
                                        ok = mov.parse(buff);
                                        if (ok){
                                            movementlist.store(mov);
                                        }
                                    }else if (type.equals("\"FINAL_APOZIMIOSI\"")){
                                        Ekkatharish mov = new Ekkatharish();
                                        mov.setEmployee(em);
                                        ok = mov.parse(buff);
                                        if (ok){
                                            movementlist.store(mov);
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
                System.out.println("Errors in reading TRN file : " + (errors - movementlist.getsize()));
                Sleep(3);
                buff.close();
        }
            catch (IOException ex) {
                System.out.println("Error reading file");
        }
    }

    public void CreateExpenseList(){
                    try	{
                        BufferedWriter writer = new BufferedWriter(new FileWriter(new File("1_typoi_dapanvn.txt")));
                        writer.write("EXPENSE_TYPE_LIST" + "\n"+"{" + "\n");
                        for (int i = expenselist.getsize() - 1; i >= 0;i--){
                            if (expenselist.getExpenseFromInt(i) instanceof ExpenseType1){
                                writer.write ("\t" + "EXPENSE_TYPE"+"\n"+ "\t" + "{"+"\n"+"\t\t"+"TYPE "+"1"+ "\n"+"\t\t"+"CODE "+ expenselist.getExpenseFromInt(i).getCode()
                                    + "\n"+"\t\t"+"DESCR "+ expenselist.getExpenseFromInt(i).getDescription()
                                    + "\n"+"\t\t"+"GENCOMP "	+ expenselist.getExpenseFromInt(i).getgenComp()
                                    + "\n"+"\t\t"+"PRICEOFCOMP "	+ ((ExpenseType1)(expenselist.getExpenseFromInt(i))).getpriceofComp()
                                    + "\n"+"\t\t"+ " MEASURE " + ((ExpenseType1)(expenselist.getExpenseFromInt(i))).getmeasure()
                                    + "\n"+ "\t" + "}"+"\n");
                            }else if (expenselist.getExpenseFromInt(i) instanceof ExpenseType2){
                            writer.write ("\t" + "EXPENSE_TYPE"+"\n"+ "\t" +"{"+"\n"+"\t\t"+"TYPE "+"2"+ "\n"+"\t\t"+"CODE "+ expenselist.getExpenseFromInt(i).getCode()
                                + "\n"+"\t\t"+"DESCR "+ expenselist.getExpenseFromInt(i).getDescription()
                                + "\n"+"\t\t"+"GENCOMP "	+ expenselist.getExpenseFromInt(i).getgenComp()
                                + "\n"+"\t\t"+"PERS "	+ ((ExpenseType2)(expenselist.getExpenseFromInt(i))).getpercentage()
                                + "\n"+ "\t" +"}"+"\n");
                            }
                        }
                        writer.write("}");
                        writer.close();
                    }catch(IOException e) {
                        System.err.println("Error writing file.");
                    }
    }

   public void CreateSpecificList(){
        try{
            BufferedWriter writer = new BufferedWriter(new FileWriter(new File("3_dapanes_ergazomenvn.txt")));
            writer.write("EXPENSE_LIST" + "\n"+"{" + "\n");
            for (int i = specificlist.getsize() - 1;i >=0;i--){
                writer.write ("\t" + "EXPENSE"+"\n"+ "\t" + "{"+"\n"+"\t\t"+"EMPLOYEE_CODE "+ specificlist.getSpecificFromInt(i).getEmployee().getcodeemployee() + "\n"+"\t\t"+"EXPENSE_TYPE " + specificlist.getSpecificFromInt(i).gettypeofexpense()
                        + "\n"+"\t\t"+"EXPENSE_CODE "+ specificlist.getSpecificFromInt(i).getExpense().getCode()
                        + "\n"+"\t\t"+"VAL "	+ specificlist.getSpecificFromInt(i).getvalue()
                        + "\n"+ "\t" + "}"+"\n");
            }
            writer.write("}");
            writer.close();
        }catch(IOException e) {
            System.err.println("Error writing file.");
        }
   }
   public void CreateEmployeeList(){
    try{
        BufferedWriter writer = new BufferedWriter(new FileWriter(new File("2_ergazomenoi.txt")));
        writer.write("EMPLOYEE_LIST" + "\n"+"{" + "\n");
        for (int i = employeelist.getsize() - 1;i >=0;i--){
            writer.write ("\t" + "EMPLOYEE"+"\n"+ "\t" + "{"+"\n"+"\t\t"+"CODE "+ employeelist.getEmployeeFromInt(i).getcodeemployee() + "\n"+"\t\t"+"SURNAME " + employeelist.getEmployeeFromInt(i).getSurname()
                    + "\n"+"\t\t"+"FIRSTNAME "+ employeelist.getEmployeeFromInt(i).getFirstname()
                    + "\n"+"\t\t"+"MAX_MONTHLY_VAL " + employeelist.getEmployeeFromInt(i).getComp()
                    + "\n"+ "\t" + "}"+"\n");
        }
        writer.write("}");
        writer.close();
    }catch(IOException e) {
        System.err.println("Error writing file.");
    }
}
    public void CreateMovementList(){
        try	{
            BufferedWriter writer = new BufferedWriter(new FileWriter(new File("4_kinhseis.txt")));
            writer.write("TRN_LIST" + "\n"+"{" + "\n");
            for (int i = movementlist.getsize() - 1; i >= 0;i--){
                if (movementlist.getMovementFromInt(i) instanceof Paymentinadvance){
                    writer.write ("\t" + "TRN"+"\n"+ "\t" + "{"+"\n"+"\t\t"+"EMPLOYEE_CODE "+ movementlist.getMovementFromInt(i).getemployee().getcodeemployee() + "\n"+"\t\t"+"TYPE "+ "\"PROKATAVOLI\""
                        + "\n"+"\t\t"+"VAL "+ movementlist.getMovementFromInt(i).getcompensation()
                        + "\n"+"\t\t"+"GENCOMP "	+ expenselist.getExpenseFromInt(i).getgenComp()
                        + "\n"+ "\t" + "}"+"\n");
                }else if (movementlist.getMovementFromInt(i) instanceof Compensate){
                writer.write ("\t" + "TRN"+"\n"+ "\t" +"{"+"\n"+"\t\t"+"EMPLOYEE_CODE " + movementlist.getMovementFromInt(i).getemployee().getcodeemployee() + "\n"+"\t\t"+"TYPE "+ "\"APOZIMIOSI\""
                    + "\n"+"\t\t"+"EXPENSE_TYPE " + ((Compensate)(movementlist.getMovementFromInt(i))).getexpense().gettype()
                    + "\n"+"\t\t"+"EXPENSE_CODE " + ((Compensate)(movementlist.getMovementFromInt(i))).getexpense().getCode()
                    + "\n"+ "\t" +"}"+"\n");
                }else if (movementlist.getMovementFromInt(i) instanceof Diafora){
                    writer.write ("\t" + "TRN"+"\n"+ "\t" +"{"+"\n"+"\t\t"+"EMPLOYEE_CODE " + movementlist.getMovementFromInt(i).getemployee().getcodeemployee() + "\n"+"\t\t"+"TYPE "+ "\"DIAFORA\""
                        + "\n"+"\t\t"+"VAL " + movementlist.getMovementFromInt(i).getcompensation()
                        + "\n"+ "\t" +"}"+"\n");
                }else if (movementlist.getMovementFromInt(i) instanceof Ekkatharish){
                    writer.write ("\t" + "TRN"+"\n"+ "\t" +"{"+"\n"+"\t\t"+"EMPLOYEE_CODE " + movementlist.getMovementFromInt(i).getemployee().getcodeemployee() + "\n"+"\t\t"+"TYPE "+ "\"APOZIMIOSI\""
                        + "\n"+"\t\t"+"TYPE " + "FINAL_APOZIMIOSI"
                        + "\n"+"\t\t"+"VAL " + movementlist.getMovementFromInt(i).getcompensation()
                        + "\n"+ "\t" +"}"+"\n");
                }
            }
            writer.write("}");
            writer.close();
        }catch(IOException e) {
            System.err.println("Error writing file.");
        }
    }
    public static String getRandomCode(){
        Random rg = new Random();
        String code = "";
        for (int i = 0; i < 4;i++ ){
            code = code + rg.nextInt(9);
        }
        return code;
    }

    public static void showMenu() {
        System.out.println("Menu");
        System.out.println("1.Insert new Type of Expense");
        System.out.println("2.Insert new Employee");
        System.out.println("3.Insert new Employee Expense");
        System.out.println("4.Insert Payment in advance ");
        System.out.println("5.Show List of all Employees\' Expenses");
        System.out.println("6.Clear Employee\'s Expenses");
        System.out.println("7.Show Employee\'s Movement");
        System.out.println("8.Clear all Employees\' Expenses");
        System.out.println("9.Show Final Monthly Compensation");
        System.out.println("10.Create the files");
        System.out.println("11.Exit");
    }

    public static void ClearScreen() {
        
        try {
            if (System.getProperty("os.name").startsWith("Windows")) {
                new ProcessBuilder("cmd", "/c", "cls").inheritIO().start().waitFor();
            } else if (System.getProperty("os.name").startsWith("macOS")) {
                new ProcessBuilder("terminal", "clear");
            }
        } catch (Exception e) {
            System.out.println("\n \n");
        }

    }

    public static void Sleep(int time) {
        try {
            TimeUnit.SECONDS.sleep(time);
        } catch (InterruptedException exception) {
            System.out.println("Something went wrong!");
        }
    }

    public static int HandleInputInt(String str) {
        Scanner in = new Scanner(System.in);
        System.out.print(str);
        while (!in.hasNextInt()) { //me to hasNextInt den paei se epomeno int o scanner!
            System.out.print("Wrong Input ... ");
            System.out.print(str);
            in.next(); // prepei ne kanoyme kapos skip h next gia na paei sto epomeno o Scanner!
        }
        return in.nextInt();
    }

    public static String HandleInputString(String str) {
        System.out.print(str);
        String answer = "wrong";
        while (answer.equals("wrong")) {
            Scanner in = new Scanner(System.in);
            try {
                answer = in.nextLine();
            } catch (InputMismatchException e_1) {
                System.out.print("Wrong Input ... ");
                System.out.print(str);
                answer = "wrong";
            }
        }
        return answer;
    }


    public static Double HandleInputDouble(String str) {
        System.out.print(str);
        double answer = 0.0;
        while (answer == 0.0) {
            Scanner in = new Scanner(System.in);
            try {
                answer = Double.parseDouble(in.next());
            } catch (InputMismatchException e_1) {
                System.out.print("Wrong Input ... ");
                System.out.print(str);
                answer = 0.0;
            }
        }
        return answer;
    }
     public static void main(String[] args) {
        System.out.println("Start");
        mainApp app = new mainApp();
        parseExpenseList("1_typoi_dapanvn.txt");
        final ArrayList<String> RandomCodelist = new ArrayList<String>();
        RandomCodelist.add("1001");
        RandomCodelist.add("1002");
        RandomCodelist.add("1003");
        RandomCodelist.add("1004");
        RandomCodelist.add("1005");
        RandomCodelist.add("1006");
        parseEmployeeList("2_ergazomenoi.txt");
        final ArrayList<String> randomEmployeeCodelList = new ArrayList<String>();
        randomEmployeeCodelList.add("1001");
        randomEmployeeCodelList.add("1002");
        randomEmployeeCodelList.add("1003");
        randomEmployeeCodelList.add("1004");
        parseSpecificList("3_dapanes_ergazomenvn.txt");
        
        parseMovementList("4_kinhseis.txt");
        Scanner in = new Scanner(System.in);
        int answer = 0;

        while (answer != 11) {

                //clear screen
                ClearScreen();
                
                //Show Menu
                showMenu();
            
                //handling wrong input!
                answer = HandleInputInt("Make a choice :");

                switch (answer){
                    case 1: {
                        int answer1;
                        do {
                            answer1 = HandleInputInt("1.Continue(-_-) or 2.Go Back(;-;) !!! :");
                        } while (answer1 != 1 && answer1 != 2);
                        if (answer1 == 1){
                            String code ,description;
                            do {
                                code = getRandomCode();
                            }while((RandomCodelist.contains(code)));
                            RandomCodelist.add(code);
                            System.out.println("Insert Details");
                            description = HandleInputString("Insert Description :");
                            
                            Double genComp;
                            genComp = HandleInputDouble("Insert Maximum Compensation for this Month :");
                            
                            int type;
                            do {
                                type = HandleInputInt("Insert type (1,2):");
                            } while (type != 1 && type != 2);

                            if (type == 1) {
                            
                                double priceOfComp = HandleInputDouble("Insert price of compensation :");
                                String measurement = HandleInputString("Insert Measurement: ");
                                ExpenseType1 expenseType1 = new ExpenseType1(code, description, genComp, priceOfComp, measurement);
                                expenselist.store(expenseType1);
                                System.out.println("New Expense Entry Added!!\n" + expenseType1);
                            } else {
                                double percentage = HandleInputDouble("Insert percentage (example 0.8, 0.5):");
                                ExpenseType2 expenseType2 = new ExpenseType2(code, description, genComp, percentage);
                                expenselist.store(expenseType2);
                                System.out.println("New Expense Entry Added!!\n" + expenseType2);
                            }
                            Sleep(5);
                            break;
                        }
                        else break;
                    }
                    case 2: {
                        int answer1;
                        do {
                            answer1 = HandleInputInt("1.Continue(-_-) or 2.Go Back(;-;) !!! :");
                        } while (answer1 != 1 && answer1 != 2);
                        if (answer1 == 1){
                            System.out.println("Insert Employee\'s details");
                            String l, f;
                            double c;
                            f = HandleInputString("First Name :");

                            l = HandleInputString("Last Name :");
                        
                            c = HandleInputDouble("Max monthly Compensation :");//einai mono gia ton ergazomeno
                            Employee employee = new Employee(f, l, c);
                            String code;
                            do {
                                code = getRandomCode();
                            }while((randomEmployeeCodelList.contains(code)));
                            randomEmployeeCodelList.add(code);
                            employee.setemployeecode(code);
                            employeelist.store(employee);
                            System.out.println("New Employee Entry Added!!\n" + employee);
                            Sleep(5);
                            break;
                        }else break;
                    }
                    case 3: {
                        int answer1;
                        do {
                            answer1 = HandleInputInt("1.Continue(-_-) or 2.Go Back(;-;) !!! :");
                        } while (answer1 != 1 && answer1 != 2);
                        if (answer1 == 1) {
                            System.out.println();
                            employeelist.showEmployees();
                            int num = HandleInputInt("Choose an employee! (ex. 1, 2, 3, ...) : ") - 1;
                            Employee employee = employeelist.getEmployeeFromInt(num);
                            expenselist.showExpenses();
                            int choice = HandleInputInt("Choose type of expense! (ex. 1, 2, 3, ...) :") - 1;
                            Expense expense = expenselist.getExpenseFromInt(choice);
                            String j = HandleInputString("Insert Justification: :");
                            if (expense instanceof ExpenseType1) {
                                double p = HandleInputDouble("Insert Quantity : ");
                                SpecificType spe = new SpecificType(employee, expense, j, p);
                                spe.setexpensetype("1");
                                specificlist.store(spe);
                                System.out.println("New Employee\'s Expense Added!!\n" + spe);
                            } else {
                                double value = HandleInputDouble("Insert Value :");
                                SpecificType spe = new SpecificType(employee, expense, j, value);
                                spe.setexpensetype("2");
                                specificlist.store(spe);
                                System.out.println("New Employee\'s Expense Added!!\n" + spe);
                            }break;
                        }else break;
                    }

                    case 4: {
                        int answer1;
                        do {
                            answer1 = HandleInputInt("1.Continue(-_-) or 2.Go Back(;-;) !!! :");
                        } while (answer1 != 1 && answer1 != 2);
                        if (answer1 == 1){
                            employeelist.showEmployees();
                            System.out.println("Insert Details");
                            int num = HandleInputInt("Choose an Employee: ") - 1;
                            Employee employee = employeelist.getEmployeeFromInt(num);
                        
                            double sum = HandleInputDouble("Insert the value of Payment in advance: ");
                            Paymentinadvance pay = new Paymentinadvance(employee, sum);
                            movementlist.store(pay);
                            System.out.println("New Payment in advance Added!!\n" + pay);
                            break;
                        }else break;
                    }

                    case 5: {
                        int answer1;
                        do {
                            answer1 = HandleInputInt("1.Continue(-_-) or 2.Go Back(;-;) !!! :");
                        } while (answer1 != 1 && answer1 != 2);
                        if (answer1 == 1) {
                            specificlist.showSpecificList();
                            
                            System.out.println("Press Enter continue");
                            try{
                                System.in.read();
                            }catch(Exception e){
                                System.out.println("Something went wrong!!!");
                            }
                            break;
                        }else break;
                    }

                    case 6: {
                        int answer1;
                        do {
                            answer1 = HandleInputInt("1.Continue(-_-) or 2.Go Back(;-;) !!! :");
                        } while (answer1 != 1 && answer1 != 2);
                        if (answer1 == 1){
                            employeelist.showEmployees();
                            System.out.println("Insert Details");
                            int choice = HandleInputInt("Insert an Employee: ") - 1;
                            Employee employee = employeelist.getEmployeeFromInt(choice);
                            //diagrafh kinhsewn ektos apo thn prokatabolh
                            for (int i = movementlist.getsize() - 1; i>=0;i--){
                                if (!(movementlist.getMovementFromInt(i) instanceof Paymentinadvance) && movementlist.getMovementFromInt(i).getemployee().equals(employee)){
                                    movementlist.removeMovement(movementlist.getMovementFromInt(i));
                                }
                            }
                            //--dhmiourgia kinhsewn apozhmiwshs
                            double totalsum = 0.0;//athroizw oles tis kinhseis toy ergazomenou kai epeita blepw an yparxei h oxi kinhsh diaforas
                            for (int i = expenselist.getsize() - 1; i>=0; i--){
                                    boolean f = false;
                                    double sum_compensate = 0.0; 
                                    for (int j = specificlist.getsize() - 1; j>=0; j--){
                                        if(expenselist.getExpenseFromInt(i).getCode() == specificlist.getSpecificFromInt(j).getExpense().getCode() && specificlist.getSpecificFromInt(j).getEmployee().equals(employee)){
                                            f = true;
                                            sum_compensate += specificlist.getSpecificFromInt(j).valueofcompensation();
                                        }
                                    }
                                    if (f){
                                        sum_compensate = expenselist.getExpenseFromInt(i).check(sum_compensate);//elegxw to athroisma me thn megisth mhniaia apozhmiwsh
                                        totalsum += sum_compensate;
                                        Compensate compensate = new Compensate(employee, sum_compensate, expenselist.getExpenseFromInt(i));
                                        movementlist.store(compensate);
                                    }
                            }
                            
                            Diafora d ;
                            if (totalsum > employee.getComp()) {
                                d = new Diafora(employee, totalsum - employee.getComp());
                            } else {
                                d = new Diafora(employee, 0.0);
                            }
                            movementlist.store(d);
                            //kanv thn ekkatharish tou ergazomenou
                            // ekkatharish =  sumajivnapozhmivshs - sumprokatabolhs - ajia diaforas
                            double sumpro = 0;
                            for (int i = movementlist.getsize() - 1; i>=0;i--){
                                if ((movementlist.getMovementFromInt(i) instanceof Paymentinadvance) && (movementlist.getMovementFromInt(i).getemployee().equals(employee))){
                                    sumpro += movementlist.getMovementFromInt(i).getcompensation();
                                }
                            }
                            
                            double ekk = totalsum - sumpro - d.getcompensation();
                            Ekkatharish ekkatharish = new Ekkatharish(employee, ekk);
                            //apothkeuv thn ekkatharish se mia nea kinhsh 
                            movementlist.store(ekkatharish);
                            System.out.println("Ekkatharish for" + employee.getFullName());
                            break;
                        }else break;
                    }
                    case 7: {
                        int answer1;
                        do {
                            answer1 = HandleInputInt("1.Continue(-_-) or 2.Go Back(;-;) !!! :");
                        } while (answer1 != 1 && answer1 != 2);
                        if (answer1 == 1){
                            //emfanizv oles tis kinhseis gia enan ergazomeno
                            employeelist.showEmployees();
                            System.out.println("Insert Details");
                            int choice = HandleInputInt("Insert an Employee: ") - 1;
                            Employee employee = employeelist.getEmployeeFromInt(choice);
                            boolean flag1 = false;
                            for (int i = movementlist.getsize() - 1; i>=0; i--){
                                if (movementlist.getMovementFromInt(i).getemployee().equals(employee)){
                                    flag1 = true;
                                }
                            }
                            if (flag1){
                                for (int i = movementlist.getsize() - 1; i>=0; i--){
                                    if (movementlist.getMovementFromInt(i).getemployee().equals(employee)){
                                        System.out.println(movementlist.getMovementFromInt(i));
                                    }
                                }
                            }else {
                                System.out.println("No movements yet for " + employee.getFullName());
                            }
                            System.out.println("Press Enter continue");
                            try{
                                System.in.read();
                            }catch(Exception e){
                                System.out.println("Something went wrong!!!");
                            }
                            break;
                        }else break;
                    }
                    case 8: {
                        int answer1;
                        do {
                            answer1 = HandleInputInt("1.Continue(-_-) or 2.Go Back(;-;) !!! :");
                        } while (answer1 != 1 && answer1 != 2);
                        if (answer1 == 1){
                            //kanv ekkatharish alla gia olous touw ergazomenous twra
                            for (int k = employeelist.getsize() - 1; k>=0; k--){
                                Employee employee = employeelist.getEmployeeFromInt(k);
                                //diagrafh kinhsewn
                                for (int i = movementlist.getsize() - 1; i>=0;i--){
                                    if (!(movementlist.getMovementFromInt(i) instanceof Paymentinadvance) && movementlist.getMovementFromInt(i).getemployee().equals(employee)){
                                        movementlist.removeMovement(movementlist.getMovementFromInt(i));
                                    }
                                }
                                //--dhmiourgia kinhsewn apozhmiwshs
                                double totalsum = 0.0;//athroizw oles tis kinhseis toy ergazomenou kai epeita blepw an yparxei h oxi kinhsh diaforas
                                for (int i = expenselist.getsize() - 1; i>=0; i--){
                                    double sum_compensate = 0.0; 
                                    boolean f = false;
                                    for (int j = specificlist.getsize() - 1; j>=0; j--){
                                        if(expenselist.getExpenseFromInt(i).getCode() == specificlist.getSpecificFromInt(j).getExpense().getCode() && specificlist.getSpecificFromInt(j).getEmployee().equals(employee)){
                                            f = true;
                                            sum_compensate += specificlist.getSpecificFromInt(j).valueofcompensation();
                                        }
                                    }
                                    if (f){
                                        sum_compensate = expenselist.getExpenseFromInt(i).check(sum_compensate);//elegxw to athroisma me thn megisth mhniaia apozhmiwsh
                                        totalsum += sum_compensate;
                                        Compensate compensate = new Compensate(employee, sum_compensate, expenselist.getExpenseFromInt(i));
                                        movementlist.store(compensate);
                                    }
                                }
                            Diafora d ;
                            if (totalsum > employee.getComp()) {
                                d = new Diafora(employee, totalsum - employee.getComp());
                            } else {
                                d = new Diafora(employee, 0.0);
                            }
                            movementlist.store(d);
                            //kanv thn ekkatharish tou ergazomenou
                            // ekkatharish =  sumajivnapozhmivshs - sumprokatabolhs - ajia diaforas
                            double sumpro = 0;
                            for (int i = movementlist.getsize() - 1; i>=0;i--){
                                if (movementlist.getMovementFromInt(i) instanceof Paymentinadvance && movementlist.getMovementFromInt(i).getemployee().equals(employee)){
                                    sumpro += movementlist.getMovementFromInt(i).getcompensation();
                                }
                            }
                            double ekk = totalsum - sumpro - d.getcompensation();
                            Ekkatharish ekkatharish = new Ekkatharish(employee, ekk);
                            //apothkeuv thn ekkatharish se mia nea kinhsh 
                            movementlist.store(ekkatharish);
                            }break;
                        }else break;
                    }
                    case 9: {
                        int answer1;
                        do {
                            answer1 = HandleInputInt("1.Continue(-_-) or 2.Go Back(;-;) !!! :");
                        } while (answer1 != 1 && answer1 != 2);
                        if (answer1 == 1){
                        //typvnv gia kathe ergazomeno onoma,eponymo,mhniaia apozhmeivsh poy einai ths ekkatharishs 
                        //atrhoizw ta parapanv posa kai emfanizw to sum
                        double teliko = 0;
                        for (int i = employeelist.getsize() - 1; i>=0;i-- ){
                            for (int j = movementlist.getsize() - 1; j>=0; j--){
                                if(movementlist.getMovementFromInt(j).getemployee().equals(employeelist.getEmployeeFromInt(i)) && movementlist.getMovementFromInt(j) instanceof Ekkatharish){
                                    System.out.println(employeelist.getEmployeeFromInt(i).getFullName() + " " + movementlist.getMovementFromInt(j).getcompensation());
                                    teliko += movementlist.getMovementFromInt(j).getcompensation();
                                }
                            }
                        }
                        System.out.println("Total sum :" + teliko);
                        System.out.println("Press Enter continue");
                        try{
                            System.in.read();
                        }catch(Exception e){
                            System.out.println("Something went wrong!!!");
                        }
                        break;
                        }else break;

                    }case 10:{
                        int answer1;
                        do {
                            answer1 = HandleInputInt("1.Continue(-_-) or 2.Go Back(;-;) !!! :");
                        } while (answer1 != 1 && answer1 != 2);
                        if (answer1 == 1){
                           int choice;
                            do {
                                choice = HandleInputInt("Do you want to create Expense Type List???" + "\n" + "1.YES/2.NO: ");
                            }while (choice != 1 && choice != 2);
                            if (choice == 1){
                                app.CreateExpenseList();
                            }
                            do {
                                choice = HandleInputInt("Do you want to create Employee List???" + "\n" + "1.YES/2.NO: ");
                            }while (choice != 1 && choice != 2);
                            if (choice == 1){
                                app.CreateEmployeeList();
                            }
                            do {
                                choice = HandleInputInt("Do you want to create Expense List???" + "\n" + "1.YES/2.NO: ");
                            }while (choice != 1 && choice != 2);
                            if (choice == 1){
                                app.CreateSpecificList();
                            }
                            do {
                                choice = HandleInputInt("Do you want to create TRN List???" + "\n" + "1.YES/2.NO: ");
                            }while (choice != 1 && choice != 2);
                            if (choice ==1){
                                app.CreateMovementList();
                            }
                            
                       }break;
                    }
                    case 11:{
                        app.CreateExpenseList();
                        app.CreateEmployeeList();
                        app.CreateSpecificList();
                        app.CreateMovementList();
                        break;
                    }
                }

                ClearScreen();

            }
        }


    }