public class IfStatement {
    public static void main(String[] args) {
        int n = 70;
        if (n >= 90) {
            System.out.println("优秀");
        } else if (n >= 60) {
            System.out.println("及格了");
            System.out.println("吃火锅");
        } else {
            System.out.println("挂科了");
            System.out.println("补考吧");
        }
        System.out.println("END");
    } 
}
