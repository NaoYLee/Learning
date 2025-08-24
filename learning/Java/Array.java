public class Array {
    public static void main(String[] args) {
        int[] score = new int[5];
        score[0] = 78;
        score[1] = 92;
        score[2] = 84;
        score[3] = 68;
        score[4] = 76;

        System.out.println(score.length);  // 5

        int[] ns = {78, 92, 84, 68, 76};
        System.out.println(ns);
        ns = new int[] {1, 2, 3};
        System.out.println(ns);
    }
}