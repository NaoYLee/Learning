public class Str {
    public static void main(String[] args) {
        String s1 = "Hello";
        String s2 = "World";
        String s = s1 + " " + s2 + "!";
        System.out.println(s); // Hello World!

        int age = 25;
        String s3 = "age is " + age;
        System.out.println(s3); // age is 25

        String s4 = "abc\"xyz";
        String s5 = "abc\\xyz";
        System.out.println(s4);
        System.out.println(s5);

        String l1 = "First line\nSecond line\nEnd";
        String l2 = """
                SELECT *
                FROM users
                WHERE id > 100
                ORDER BY name;
                """;
        System.out.println(l1);
        System.out.println(l2);

        String str = "Hello";
        String nstr = str;
        System.out.println(str);  // Hello
        str = "World";
        System.out.println(str);  // World
        System.out.println(nstr);  // Hello
    }
}
  