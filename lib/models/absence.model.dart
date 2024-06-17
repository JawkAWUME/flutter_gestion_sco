class Absence {
  final String id;
  final String studentId;
  final DateTime date;
  final String justification;
  final bool isAccepted;

  Absence({
    required this.id,
    required this.studentId,
    required this.date,
    required this.justification,
    required this.isAccepted,
  });

  factory Absence.fromJson(Map<String, dynamic> json) {
    return Absence(
      id: json['id'],
      studentId: json['studentId'],
      date: DateTime.parse(json['date']),
      justification: json['justification'],
      isAccepted: json['isAccepted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'studentId': studentId,
      'date': date.toIso8601String(),
      'justification': justification,
      'isAccepted': isAccepted,
    };
  }
}
