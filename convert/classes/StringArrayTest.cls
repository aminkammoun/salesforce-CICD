public class StringArrayTest {
     public static List<String> generateStringArray(Integer num)
     {
        List<String> List1 = new List<String>();
        for(Integer i= 0 ; i< num ; ++i)
        	List1.add('Test '+i);
        
        return List1;
    }
}