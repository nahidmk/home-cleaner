class Cleaning {
  int id;
  String cleaningType;
  String cleaningFrequency;
  List<String> cleaningExtra;
  String dateTime;

  static final columns = [
    "id",
    "cleaning_type",
    "cleaning_frequency",
    "cleaning_extra",
    "date_time"
  ];

  Cleaning(
      {this.id,
      this.cleaningType,
      this.cleaningFrequency,
      this.cleaningExtra,
      this.dateTime});

  factory Cleaning.fromMap(Map<String, dynamic> data) {
    return Cleaning(
      id: data['id'] as int,
      cleaningType: data['cleaningType'] as String,
      cleaningFrequency: data['cleaningFrequency'] as String,
      cleaningExtra: data['cleaningExtra'] != null ? (data['cleaningExtra'] as List).map((e) => e.toString()).toList():[],
      dateTime: data['dateTime'] as String,
    );
  }

  Map<String, dynamic> toMap() => {
        "id": id,
        "cleaningType": cleaningType,
        "cleaningFrequency": cleaningFrequency,
        "cleaningExtra": cleaningExtra!=null ? cleaningExtra.map((e) => e.toString()).toList():[],
        "dateTime": dateTime
      };
}
