public class CalcOfFloat {
    public static void main(String[] args) {
        double x = 1.0 / 10;
        double y = 1 - 9.0 / 10;
        System.out.println(x);  // 0.1
        System.out.println(y);  // 0.09999999999999998

        double r = Math.abs(x - y);
        if (r < 0.00001) {
            // 可以认为相等
        } else {
            // 不相等
        }
    }
}