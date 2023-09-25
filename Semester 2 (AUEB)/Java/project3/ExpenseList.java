import java.util.ArrayList;

public class ExpenseList {

    private ArrayList<Expense> expenseList = new ArrayList<Expense>();

    public void store(Expense s){//set
        expenseList.add(s);
    }

    public Expense getExpenseFromInt(int i) {
        return expenseList.get(i);
    }
    
    public int getsize(){
        return expenseList.size();
    }

    public void showExpenses() {
        int counter = 1;
        System.out.println("Expense\'s List");
        System.out.println("------------------------------------");
        for (Expense expense : expenseList) {
            System.out.println(counter + ". " + expense);
            counter++;
        }

        System.out.println("End of the list");
    }


}