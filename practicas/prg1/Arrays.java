class Arrays {
    public static void main(String[] args) {
        int[] a = {1, 2, 3};
        int[] b = a;
        System.out.println("dir a = " + a);
        System.out.println("dir b = " + b);
        System.out.println("a[2] = " + a[2]);
        System.out.println("b[2] = " + b[2]);
        
        a[2] = 6;
        System.out.println("a[2] = " + a[2]);
        System.out.println("b[2] = " + b[2]);
        
        int[] c = new int[3];
        c = a;
        System.out.println("dir c = " + c);
        int[] d= {4, 5 ,6};
        System.out.println("dir d = " + d);
        d = a;
        System.out.println("new dir d = " + d);
        // en java, cuando nada apunta a un array, el gargage collector lo liberas
    }
}