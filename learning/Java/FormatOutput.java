public class FormatOutput {
    public static void main(String[] args) {
        double d = 129000000;
        System.out.println(d);  // 1.29E8

        double pi = 3.1415926;
        System.out.printf("%.2f\n", pi); // 显示两位小数3.14
        System.out.printf("%.4f\n", pi); // 显示4位小数3.1416
    }
}