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
        n -= 200;  // 22872
        System.out.println(i);
        System.out.println(n);

        i++; // 3401, 相当于 n = n + 1;
        System.out.println(i);
        i--; // 3400, 相当于 n = n - 1;
        System.out.println(i);
    }
}