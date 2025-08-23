public class Overflow {
    public static void main(String[] args) {
        int x = 2147483640;
        int y = 15;
        int sum = x + y;
        System.out.println(sum);  // -2147483641

        long m = 2147483640L;
        long n = 15L;
        long l_sum = m + n;
        System.out.println(l_sum);  // 2147483655
    }
}