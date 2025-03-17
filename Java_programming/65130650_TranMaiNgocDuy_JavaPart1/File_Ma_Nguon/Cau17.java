import java.util.Arrays;

public class Cau17 {
  public static void main(String[] args) {
    char[][] studenAnswers = {
            {'A', 'B', 'A', 'C', 'C', 'D', 'E', 'E', 'A', 'D'},
            {'D', 'B', 'A', 'B', 'C', 'A', 'E', 'E', 'A', 'D'},
            {'E', 'D', 'D', 'A', 'C', 'B', 'E', 'E', 'A', 'D'},
            {'C', 'B', 'A', 'E', 'D', 'C', 'E', 'E', 'A', 'D'},
            {'A', 'B', 'D', 'C', 'C', 'D', 'E', 'E', 'A', 'D'},
            {'B', 'B', 'E', 'C', 'C', 'D', 'E', 'E', 'A', 'D'},
            {'B', 'B', 'A', 'C', 'C', 'D', 'E', 'E', 'A', 'D'},
            {'E', 'B', 'E', 'C', 'C', 'D', 'E', 'E', 'A', 'D'}
    };
    char[] Answers = {'D', 'B', 'D', 'C', 'C', 'D', 'A', 'E', 'A', 'D'};
    int[][] results = new int[studenAnswers.length][2];
    for(int i = 0 ;i < studenAnswers.length; i++){
      int cnt = 0;
      for(int j = 0 ;j < Answers.length; j++){
        if(studenAnswers[i][j] == Answers[j]){
          cnt++;
        }
      }
      results[i][0] = i;
      results[i][1] = cnt;
    }
    //Đã thay đổi Arrays.sort(results, (a, b) -> Integer.compare(a[0], b[0]))
    //Thành
    //Arrays.sort(results, (a, b) -> Integer.compare(a[1], b[1])) để sắp xếp theo số câu đúng thay vì chỉ số sinh viên.
    Arrays.sort(results,(a,b) ->Integer.compare(a[1],b[1]));
    for(int i = 0 ;i < results.length; i++){
      System.out.print("Sinh viên thứ " + results[i][0] + " có " + results[i][1] + " đáp án đúng!");
      System.out.println();
    }
  }
}
