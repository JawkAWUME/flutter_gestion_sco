// shared/json_data.dart

final Map<String, dynamic> jsonData = {
  'courses': [
    {
      'id': 'course1',
      'name': 'Mathematics',
      'module': 'MATH101',
      'quota': 40,
      'sessions': ['session1', 'session2']
    },
    {
      'id': 'course2',
      'name': 'Physics',
      'module': 'PHY101',
      'quota': 35,
      'sessions': ['session3']
    },
  ],
  'sessions': [
    {
      'id': 'session1',
      'courseId': 'course1',
      'teacherId': 'teacher1',
      'date': '2024-06-01T10:00:00.000Z',
      'duration': 2,
      'attendances': ['student1', 'student2'],
      'validatedAttendances': ['student1'],
      'isValidated': true
    },
    {
      'id': 'session2',
      'courseId': 'course1',
      'teacherId': 'teacher1',
      'date': '2024-06-08T10:00:00.000Z',
      'duration': 2,
      'attendances': [],
      'validatedAttendances': [],
      'isValidated': false
    },
    {
      'id': 'session3',
      'courseId': 'course2',
      'teacherId': 'teacher2',
      'date': '2024-06-10T14:00:00.000Z',
      'duration': 3,
      'attendances': ['student3'],
      'validatedAttendances': ['student3'],
      'isValidated': true
    },
  ],
  'students': [
    {
      'id': 'student1',
      'name': 'Alice',
      'absences': ['absence1']
    },
    {
      'id': 'student2',
      'name': 'Bob',
      'absences': []
    },
    {
      'id': 'student3',
      'name': 'Charlie',
      'absences': []
    },
  ],
  'absences': [
    {
      'id': 'absence1',
      'studentId': 'student1',
      'date': '2024-06-01T10:00:00.000Z',
      'justification': 'Medical reason',
      'isAccepted': true
    },
  ],
  'teachers': [
    {
      'id': 'teacher1',
      'name': 'Dr. Smith'
    },
    {
      'id': 'teacher2',
      'name': 'Dr. Johnson'
    },
  ],
  'notifications': [],
  'letters': []
};
