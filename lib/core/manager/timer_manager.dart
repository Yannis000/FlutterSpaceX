class TimerManager{

  static final TimerManager _instance = TimerManager._internal();

  factory TimerManager() => _instance;

  TimerManager._internal();

  String intToTimeLeft(int value) {
    int d, h, m, s;

    d = value ~/ 86400;

    value = (value - d * 86400);
    h = value ~/ 3600;

    value = (value - h * 3600);
    m = value ~/ 60;

    s = value - (m * 60);

    String dayLeft = d.toString().length < 2 ? "0" + d.toString() : d.toString();

    String hourLeft = h.toString().length < 2 ? "0" + h.toString() : h.toString();

    String minuteLeft =
    m.toString().length < 2 ? "0" + m.toString() : m.toString();

    String secondsLeft =
    s.toString().length < 2 ? "0" + s.toString() : s.toString();

    String result = "${dayLeft}j ${hourLeft}h ${minuteLeft}m ${secondsLeft}s";

    return result;
  }

  DateTime convertDateTime(String date){
    print(DateTime.parse(date).second);
    return DateTime.parse(date);
  }

}