import java.util.*;
public class Movementlist {

    private ArrayList<Movement> movementlist = new ArrayList<Movement>();

    public void store(Movement s){//set
        movementlist.add(s);
    }

    public int getsize(){
        return movementlist.size();
    }


    public void removeMovement(Movement mov){
        movementlist.remove(mov);
    } 

    public Movement getMovementFromInt(int i) {
        return movementlist.get(i);
    }
    
    
    public void showMovements() {
        int counter = 1;
        System.out.println("Movement\'s List");
        System.out.println("------------------------------------");
        for (Movement movement : movementlist) {
            System.out.println(counter + ". " + movement);
            counter++;
        }
        System.out.println("End of the list");
    }


}