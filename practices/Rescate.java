import java.utils.Scanner;

class Rescate {
	public static void Main(String[] args) {
		int [][] stage = getMap();
		final int STRANDED_SOLDIERS = 8;
		placeSoldiers(STRANDED_SOLDIERS, stage);
		final int TOTAL_TURNS = 50;
		boolean stillPlaying = true;
		int turn = 0;
		do {	
			show(stage);
			
		} while(stillPlaying);
	}

	static void clearMist(int[][] stage) {
		int[] coords = choosePosition(stage);
		int x = coords[0];
		int y = coords[1];

	}

	static int[] choosePosition(int[][] stage) {
		final int MAX_Y = stage.length;
		final int MAX_X = stage[0].length;

		Scanner scanner = new Scanner(System.in);
		System.out.println("Choose the X position: ");
		int x = scanner.nextInt();

		if(x == 666) {
			showClearedMap(stage);
			System.out.println("Choose the X position: ");
			x = scanner.nextInt();
		}

		System.out.println("Choose the Y position: ");
		int y = scanner.nextInt();
		
		return new int[] {x, y};	
			
	}

	static void showClearedMap(int[][] stage) {
		int[][] modifiedMap = new int[stage.length][stage[0].length];
		for(int y = 0; y< stage.length; y++) {
			for(int x = 0; x<stage[y].length; x++) {
				// shoows coordinates
				System.out.print("(" + x + "," + y + " )/");
				//show raw
				System.out.print(stage[y][x]);
				// show them
				modifiedMap[y][x] = Math.abs(stage[y][x]);
			}
			System.out.println();
		}
	}

	static void isSoldier(int[][] stage, int x; int y) {
		return stage[y][x] == 2;
	}
}
