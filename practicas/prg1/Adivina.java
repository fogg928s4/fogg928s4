import java.util.Scanner;

class Adivina { 
    public static void main(String[] args) {
        Scanner scr = new Scanner(System.in);

        final int NUMERO_MAXIMO = 5;
        int random = (int) (Math.random() * NUMERO_MAXIMO);

        System.out.print("En que numero estoy pensando? ");
        int guess = scr.nextInt();
        
        while ( random != guess ) {

            if ( random > guess ){
            System.out.print("No adivinaste es mayor ");
        }
            else {
            System.out.print("No adivinaste es menor ");
        }
        System.out.println("sigue intentando");
        guess = scr.nextInt();
        }

            System.out.print("Bien, lo adivinaste");
        
        
    }
}