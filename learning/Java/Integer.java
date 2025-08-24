public class Integer {
    public static void main(String[] args) {
        int i = 2147483647;
        int i2 = -2147483648;
        int i3 = 2_000_000_000;  // 使用下划线加强数字易读性
        int i4 = 0xff0000;  // 十六进制下的16711680，0x表示十六进制
        int i5 = 0b1000000000;  // 二进制下的512,0b表示二进制

        long l1 = 9000000000000000000L;  // long型的结尾需要加L
        long l2 = 900;  // 可以将int类型赋值给long
        // int i6 = 900L;  // Type mismatch: cannot convert from long to int
        
        System.out.println(i + i2 + i3 + i4 + i5 + l1 + l2);

        int n = 7;
        int a = n << 1;
        int b = n << 2;
        int c = n << 28;
        int d = n << 29;
        System.out.println(a);
        System.out.println(b);
        System.out.println(c);
        System.out.println(d);
    }
}