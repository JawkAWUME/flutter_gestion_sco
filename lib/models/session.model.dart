class Session {
  final String id;
  final String courseId;
  final String teacherId;
  final DateTime date;
  final int duration;
  final List<String> attendances;
  final List<String> validatedAttendances;
  final bool isValidated;

  Session({
    required this.id,
    required this.courseId,
    required this.teacherId,
    required this.date,
    required this.duration,
    required this.attendances,
    required this.validatedAttendances,
    required this.isValidated,
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      id: json['id'],
      courseId: json['courseId'],
      teacherId: json['teacherId'],
      date: DateTime.parse(json['date']),
      duration: json['duration'],
      attendances: List<String>.from(json['attendances']),
      validatedAttendances: List<String>.from(json['validatedAttendances']),
      isValidated: json['isValidated'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'courseId': courseId,
      'teacherId': teacherId,
      'date': date.toIso8601String(),
      'duration': duration,
      'attendances': attendances,
      'validatedAttendances': validatedAttendances,
      'isValidated': isValidated,
    };
  }
}
