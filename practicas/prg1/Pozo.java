class Pozo {
    public static void main(String[] args) {
        final int METROS_PROFUNDIDAD = 20;
        final int METROS_ANCHO = 5;
        System.out.print("[]");
        for(int k = 0; k<= METROS_ANCHO; k++)
            System.err.print("  ");
        System.out.print("[]\n");
        
        for(int i = 0; i <= METROS_PROFUNDIDAD; i++) {
            System.out.print("[]");

            for(int j = 0; j<=METROS_ANCHO; j++) 
                System.out.print(":.");
            
            System.out.print("[]_ __ " + i);
            System.out.println("");
        }
        for(int k = 0; k<= METROS_ANCHO+2;k++)
            System.err.print("[]");

    }  
}
