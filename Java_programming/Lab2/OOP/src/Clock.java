public class Clock {
  private  int hour;
  private  int minute;
  private  int second;
  public Clock(int hour, int minute, int second) {
    this.hour = hour;
    this.minute = minute;
    this.second = second;
  }
  public Clock() {
    hour = 0;
    minute = 0;
    second = 0;
  }
  public int getHour() {
    return hour;
  }

  public int getMinute() {
    return minute;
  }

  public int getSecond() {
    return second;
  }

  public void setHour(int hour) {
    this.hour = hour;
  }

  public void setMinute(int minute) {
    this.minute = minute;
  }

  public void setSecond(int second) {
    this.second = second;
  }
  public void setTime(int hour, int minute, int second){
    this.hour = hour;
    this.minute = minute;
    this.second = second;
  }
  public int totalSeconds(int hour, int minute, int second){
    return hour*3600 + minute*60 + second;
  }
  public void addSeconds(int seconds){
    int totalSeconds = totalSeconds(hour,minute,second) + seconds;
    hour = totalSeconds/3600;
    minute = (totalSeconds%3600)/60;
    second = totalSeconds%60;
  }
  @Override
  public String toString() {
    return String.format("%02d:%02d:%02d", hour, minute, second);
  }
}
