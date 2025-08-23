public class Float {
    public static void main(String[] args) {
        float f1 = 3.14f;  // float型的结尾要加f
        float f2 = 3.14e38f;  // 使用科学计数法表示3.14x10^38
        // float f3 = 1.0;  // Type mismatch: cannot convert from double to float
        
        double d = 1.79e308;
        double d2 = -1.79e308;
        double d3 = 4.9e-324;
        
        System.out.println(f1 + f2 + d + d2 + d3);
    }
}