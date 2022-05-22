class RegisterForCourseParams {
  final String courseTitle;
  final String studentEmail;
  final String studentFirstName;
  final String studentLastName;
  final String studentPhoneNumber;

  const RegisterForCourseParams({
    required this.courseTitle,
    required this.studentEmail,
    required this.studentFirstName,
    required this.studentLastName,
    required this.studentPhoneNumber,
  });
}
