class Drug {
  static int idsGenerator = 1;
  String drugName;
  String notes;
  int numberOfDays;
  int dateTime;
  int hour;
  int minutes;
  String timeCol;
  late int id;
  Drug({
    required this.drugName,
    required this.notes,
    required this.numberOfDays,
    required this.dateTime,
    required this.hour,
    required this.minutes,
    required this.timeCol,
  }) {
    id = idsGenerator;
    idsGenerator++;
  }
}
