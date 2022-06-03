import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

//data structure for O(1) removal, with generic inputs.
public class  Data_Structure<T> {
    ArrayList<T> array; //create arraylist for storage
    Map<T, Integer> map; //create map for value to index bound

    public Data_Structure() { //initialization
        this.array = new ArrayList<>();
        this.map = new HashMap<>();
    }

    void add(T element) {
        if (map.get(element) != null) //check if this element already exists, then do nothing
            return;

        array.add(element);  //add element at the end of the list
        map.put(element, array.size() - 1);
    }

    void remove(T element) throws Exception {
        if (map.get(element) == null) //if element does not exist, we cannot remove
            throw new Exception("No such element");

        int index = map.get(element);

        map.remove(element); //remove the wanted element from map
        T last = array.get(array.size() - 1); //get last element

        Collections.swap(array, index, array.size() - 1);
        // use collections.swap(since it uses set function which goes O(1)) to swap places for wanted element and last element

        array.remove(array.size() - 1); //now remove element since it is at the end of arraylist, and it will only take O(1)


        map.put(last, index); //update index of element that once was last
    }

    void print(){
        for(T i : array){
            System.out.print(i + " ");
        }
        System.out.println();
    }
}
