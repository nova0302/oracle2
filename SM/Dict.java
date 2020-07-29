import java.util.Dictionary;
import java.util.Enumeration;
import java.util.Hashtable;

public class Dict {

public static void main(String[] args) {

    Dictionary<String, String> obj = new Hashtable<String, String>();
    obj.put("Hello", "World");
    obj.put("Hello1", "World3");
    obj.put("Hello2", "World32");
    Dict ca = new Dict();
    ca.test(obj);
}

public void test(Dictionary<String, String> obj) {
    Enumeration<String> enumData = obj.elements();
    while (enumData.hasMoreElements()) {
        System.out.println(enumData.nextElement());
    }
  }
}
