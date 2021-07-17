abstract class SystemClock {
  DateTime getCurrentTime();
}

class SystemClockImpl implements SystemClock {
  //@override
  //DateTime getCurrentTime() {
  //return DateTime.now().add(Duration(days: 53));
  //}

  @override
  DateTime getCurrentTime() {
    return DateTime.now();
  }
}
