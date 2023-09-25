import java.util.*;
public class SpecificList {

    private ArrayList<SpecificType> specificlist = new ArrayList<SpecificType>();

    public void store(SpecificType s){//set
        specificlist.add(s);
    }

    public SpecificType getSpecificFromInt(int i) {
        return specificlist.get(i);
    }
    
    public int getsize(){
        return specificlist.size();
    }

    
    public void showSpecificList() {
        int counter = 1;
        System.out.println("Specific list\'s List");
        System.out.println("------------------------------------");
        for (SpecificType specific : specificlist) {
            System.out.println(counter + ". " + specific);
            counter++;
        }
        System.out.println("End of the list");
    }


}