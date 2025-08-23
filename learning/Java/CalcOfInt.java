public class CalcOfInt {
    public static void main(String[] args) {
        int i = (100 + 200) * (99 - 88);  // 3300
        int n = 7 * (5 + (i - 9));  // 23072
        System.out.println(i);
        System.out.println(n);

        int x = 12345 / 67;  // 184
        System.out.println(x);

        int y = 12345 % 67;  // 17
        System.out.println(y);

        i += 100;  // 3400
        n -= 200;  // 22782
        System.out.println(i);
        System.out.println(n);
    }
}