public class Clocks {
  private int seconds;
  public Clocks(int seconds) {
    this.seconds = seconds;
  }
  public Clocks() {
    seconds = 0;
  }
  public int getSeconds() {
    return seconds;
  }
  public void setSeconds(int seconds) {
    this.seconds = seconds;
  }
  @Override
  public String toString(){
    return String.format("%02d:%02d:%02d", seconds/3600,(seconds%3600)/60,seconds%60);
  }
  public int totalSeconds(){
    return seconds;
  }
  public void addSeconds(int seconds){
    seconds = seconds + this.seconds;
    this.seconds = seconds;
    toString();
  }
}
