import java.util.*;

public class Test_Sweeft {

    public static boolean isPalindrome(String text){
        int len = text.length();
        for(int i = 0; i < len / 2; i++){ //check if every char is equal to its mirrored index
            if(text.charAt(i) != text.charAt(len - 1 - i))
                return false;
        }
        return true;
    }

    public static int minSplit(int amount){
        if(amount == 0) //base case
            return 0;

        int sum = 0;

        if(amount >= 50)  //check from high to low costs and add coins
            sum += 1 + minSplit(amount - 50);
        else if(amount >= 20)
            sum += 1 + minSplit(amount - 20);
        else if(amount >= 10)
            sum += 1 + minSplit(amount - 10);
        else if(amount >= 5)
            sum += 1 + minSplit(amount - 5);
        else
            sum += amount;

        return sum;
    }

    public static int notContains(int[] array) {
        boolean[] contains = new boolean[array.length + 1];

        for (int number : array) {
            if (number < contains.length && number > 0) {
                contains[number] = true;
            }
        }

        for (int i = 1; i < contains.length; i++) {
            if (!contains[i]) { //if there is integer which is not true in helper array, return
                return i;
            }
        }

        return contains.length;
    }

    public static boolean isProperly(String sequence) throws Exception {
        int counter = 0;
        for (int i = 0; i < sequence.length(); i++){
            if (sequence.charAt(i) == '(')
                counter++;
            else if (sequence.charAt(i) == ')') {
                if (counter < 1)
                    return false;
                counter--;
            }
            else
                throw new Exception("Invalid char");
        }
        return counter == 0;
    }

    public static int countVariants(int stearsCount){
        if(stearsCount < 0)
            return  0;
        else if(stearsCount == 0)
            return 1;

        return (countVariants(stearsCount - 2)) + (countVariants(stearsCount - 1));
    }
}
