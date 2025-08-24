public class Ternary {
    public static void main(String[] args) {
        int n = -100;
        int x = n >= 0 ? n : -n;
        System.out.println(x);  // 100

        int age = 7;
        boolean isPrimaryStudent = age >= 6 && age <= 12;
        System.out.println(isPrimaryStudent ? "Yes" : "No");
    }
}