public class Constant {
    public static void main(String[] args) {
        final double PI = 3.14;
        double r = 5.0;
        double area = PI * r * r;
        // PI = 314;  // The final local variable PI cannot be assigned. It must be blank and not using a compound assignment
        System.out.println("area=" + area);
    }
}