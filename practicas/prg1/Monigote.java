import java.util.Scanner;;
public class Monigote {
    public static void main(String[] args) {
        final int LADO = Integer.parseInt(args[0]);
        final int DIMENSIONES = LADO * LADO;

        for(int i = 1; i <= DIMENSIONES; i++) {
            System.out.print(i + " ");
            if (i % LADO == 0)
                System.out.println();
        }
    }
}
