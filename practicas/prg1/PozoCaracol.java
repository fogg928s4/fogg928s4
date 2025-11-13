import java.util.Scanner;

class PozoCaracol {
    public static void main(String[] args) {
        final int PROFUNDIDAD_POZO = 20;
        final String PARED = "[]:. :. :. :. :.[]";
        final String CARACOLVIVO = "[]    _@)_/°    []";
        final String CARACOLMUERTO = "[]~~~~_@)_-,~~~~[]";
        final String AGUA = "[]~~~~~~~~~~~~~~[]";
        Scanner scanner = new Scanner(System.in);

        System.out.println("Cuantos metros de agua tiene el pozo?");
        int alturaAgua = PROFUNDIDAD_POZO - scanner.nextInt();
        System.out.println("A que altura esta el caracol?");
        int alturaCaracol = scanner.nextInt();

        System.out.print("[]");
        for(int k = 0; k < 14; k++)
            System.err.print(" ");    
        System.out.print("[]\n");
        
        for(int i = 0; i <= PROFUNDIDAD_POZO; i++) {
            if (i != alturaCaracol)
                System.out.print(i<= alturaAgua? PARED: AGUA);
            else 
                System.out.print(i >= alturaAgua ? CARACOLMUERTO: CARACOLVIVO);
            System.out.println("_ __ " + i);
        }

        for(int k = 0; k < 18; k++)
            System.err.print(k % 2 == 0 ? "[" : "]");

        scanner.close();
    }  
}
