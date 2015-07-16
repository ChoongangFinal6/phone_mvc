package control;
public class test {
public static void main(String[] args) {
	
		String[] menu = {"이름", "국어", "영어", "수학","총점","평균"};
		String[] main = {"원걸", "비스트", "투피엠", "소시"};
		int[][] score = {{76, 86, 90},{90,78,90},{80,80,80},{74,61,100}};
		int sum = 0;
		int[] total = new int[3];
		
		System.out.println("성적표\n");

		for(int i = 0; i < menu.length; i++){
			System.out.print(menu[i]+"\t");
		}
		System.out.println("\n=============================================");
		for(int i = 0; i < score.length; i++){
			System.out.print(main[i]+"\t");
			for(int j = 0; j < score[i].length; j++){
				System.out.print(score[i][j]+"\t");
				sum += score[i][j];
				total[j] += score[i][j];
			}
			System.out.print(sum + "\t");
			System.out.print(sum/score[i].length + "\t");
			sum = 0;
			System.out.println();
		}
		System.out.println("=============================================");
		System.out.print("합계\t");
		for(int i = 0; i < total.length; i++){
			System.out.print(total[i]+"\t");
			sum += total[i];
		}
		System.out.print(sum + "\t" + sum / total.length);
	
}
}
