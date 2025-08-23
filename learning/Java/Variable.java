public class Variable {
    public static void main(String[] args) {
        int x = 100; // 定义int类型的变量x，将100赋值给x
        System.out.println("x=" + x); // 打印该变量的值
        x = 200;  // 重新赋值为200
        System.out.println("x=" + x); // 再次打印x的值

        int n = x;  // 将x的值赋给n
        System.out.println("n=" + n);

        n = n + 100;
        System.out.println("n=" + n);
        System.out.println("x=" + x);
    }
}