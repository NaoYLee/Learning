public class TypePromotion {
    public static void main(String[] args) {
        short s = 1234;
        int i = 123456;
        int x = s + i; // s自动转型为int
        // short y = s + i; 编译错误!
        System.out.println(x);

        int l =5;
        double m = 1.2 + 24 / l;
        double n = 1.2 + 24.0 / l;
        System.out.println(m);  // 5.2
        System.out.println(n);  // 6.0
    }
}