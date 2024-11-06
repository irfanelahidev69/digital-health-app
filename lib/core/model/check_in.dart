class CheckInModel {
  final String? userId;
  final DateTime checkInTime;
  final String? note;

  CheckInModel({
    this.userId,
    required this.checkInTime,
    this.note,
  });

  factory CheckInModel.fromJson(Map<String, dynamic> json) {
    return CheckInModel(
      userId: json["userId"],
      checkInTime: DateTime.parse(json["checkInTime"]).toLocal(),
      note: json["note"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "userId": userId,
      "checkInTime": checkInTime.toUtc().toString(),
      "note": note,
    };
  }
}
