public class TypeConversion {
    public static void main(String[] args) {
        int i1 = 1234567;
        short s1 = (short) i1; // -10617
        System.out.println(s1);
        int i2 = 12345678;
        short s2 = (short) i2; // 24910
        System.out.println(s2);
        
        int n1 = (int) 12.3;
        int n2 = (int) 12.7;
        int n3 = (int) -12.7;
        int n4 = (int) (12.7 + 0.5);
        int n5 = (int) 1.2e20;
        System.out.println(n1);  // 12
        System.out.println(n2);  // 12
        System.out.println(n3);  // -12
        System.out.println(n4);  // 13
        System.out.println(n5);  // 2147483647
    }
}