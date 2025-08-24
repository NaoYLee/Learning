public class Character {
    public static void main(String[] args) {
        char c1 = 'A';
        char c2 = '中';
        int n1 = 'A';
        int n2 = '中';
        char c3 = '\u0041';
        char c4 = '\u4e2d';
        
        System.out.println(c1);  // A
        System.out.println(c2);  // 中
        System.out.println(n1);  // 65
        System.out.println(n2);  // 20013
        System.out.println(c3);  // A
        System.out.println(c4);  // 中
    }
}