
class NotificationService {
  Future<void> sendAbsenceNotification(String studentId, int absenceHours) async {
    await Future.delayed(Duration(seconds: 1));
    print('Notification sent to $studentId for $absenceHours hours of absence.');
  }

  Future<void> sendConvocationLetter(String studentId) async {
    await Future.delayed(Duration(seconds: 1));
    print('Convocation letter sent to $studentId.');
  }
}
