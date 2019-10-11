import java.io.File;

/**
 * Week 5 Day 3 CS2852 Exercise
 *
 * Modify a team member's Dictionary class as follows:
 * 1. Always use ArrayList (not SortedArrayList) (don't pass container in ctor)
 * 2. Write private contains(word, start, end) to do the binary search using the
 *    recursive approach from yesterday.  Look at String methods for help
 *    determining whether two words are out of order, equivalent, or in order.
 * 3. Update public contains(word) to call private contains(word, ..., ...)
 * 4. load() calls Collections.sort at end.
 *    Q1. Why might this be better than ensuring the array is sorted at each
 *        step?  What is the cost of adding a word?
 *    Q2. Comment on handling duplicates (your implementation may assume no
 *        duplicates in the dictionary, though)
 * Show the professor your working code
 *
 * If you have time remaining:
 * 1. Modify Dictionary.load to take an object implementing Iterable<String>
 * 2. Create and implement "public class WordLoader implements Iterable<String>"
 *    including a constructor that takes a File.
 * 3. Modify the test program to pass the modified Dictionary.load() method
 *    an Iterable<E> and pass it a WordLoader.  This provides flexibility:
 *    you might load dictionaries in various formats from files, Web sites, ...
 * Show the professor your working code
 *
 * If you have time remaining:
 * 1. Modify your Dictionary to be generic (Dictionary<E>), replacing all String
 *    with E, although main will still use String.  This provides flexibility:
 *    The dictionary might contain objects representing words with definitions,
 *    nouns with masculine and feminine forms for certain languages, unconjugated
 *    verbs that have methods implementing conjugation, ...
 * 2. Note that this makes comparisons difficult.  You can't use Object.equals()
 *    because it does not indicate which item comes first when they're not equal.
 * 3. To solve this problem, create and implement "public class
 *    StringComparatorInsensitive implements Comparator<String>".  The
 *    Dictionary constructor will take an object of this class.
 * Show the professor your working code
 *
 * Created by Dr. Durant on 4/9/14.
 */
public class BinSearch {
    /**
     * Driver method to test modified Dictionary class.
     * @param unused
     */
    public static void main(String[] unused) {
        Dictionary d = new Dictionary(); // Part I & II
        //Dictionary d = new Dictionary(new StringComparatorInsensitive()); // Part III

        d.load(new File("../l04/words.txt")); // Part I
        //d.load(new WordLoader(new File("../l04/words.txt"))); // Part II and Part III

        String[] check = {"dog", "ibex", "supercalifragilisticexpialidocious",
                          "Peru", "Antarctica"};

        for (String word : check) {
            System.out.println(word + " is " + (d.contains(word) ? "" : "not ")
                    + "in the dictionary.");
        }
    }
}
