class TimeWorker {
  static String getTimeInUsualFormat(int seconds) {
    String time;
    int minutes = seconds ~/ 60;
    int divSeconds = seconds % 60;
    time = minutes.toString() + ":" + divSeconds.toString();
    if(minutes<10){
      time = "0"+time;
    }
    if(divSeconds<10){
      time = time.substring(0,3)+"0"+time.substring(3);
    }

    return time;
  }
}
