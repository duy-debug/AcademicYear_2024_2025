public class Cau34 {
  public static void main(String[] args) {
    ClockS clock = new ClockS();
    clock.setTime(14, 30, 15);
    System.out.println("Thời gian hiện tại: " + clock.getTime());
    clock.addSeconds(60);
    System.out.println("Thời gian sau khi thêm 60 giây: " + clock.getTime());
  }
  public static class ClockS{
    private int seconds;
    public ClockS() {
      this.seconds = 0;
    }
    public ClockS(int seconds) {
      this.seconds = seconds;
    }
    public void setTime(int h, int m, int s) {
      if (h >= 0 && h < 24 && m >= 0 && m < 60 && s >= 0 && s < 60) {
        this.seconds = h * 3600 + m * 60 + s;
      } else {
        throw new IllegalArgumentException("Thời gian không hợp lệ");
      }
    }
    public int getHours(){
      return seconds/3600;
    }
    public int getMinutes(){
      return (seconds%3600)/60;
    }
    public int getSeconds(){
      return seconds%60;
    }
    public String getTime(){
      int hours = seconds / 3600;
      int minutes = (seconds % 3600) / 60;
      int seconds1 = seconds % 60;
      String hms = "";
      if(hours < 10){
        hms = "0" + hours;
      }
      else{
        hms = "" + hours;
      }
      if(minutes < 10){
        hms += ":0" + minutes;
      }
      else{
        hms += ":" + minutes;
      }
      if(seconds < 10){
        hms += ":0" + seconds1;
      }
      else{
        hms += ":" + seconds1;
      }
      return hms;
    }
    public int totalSeconds(){
      return seconds;
    }
    public void addSeconds(int s){
        seconds += s;
    }
  }
}
