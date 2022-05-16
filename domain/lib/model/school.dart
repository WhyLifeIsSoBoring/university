class School {
  final String title;
  final String description;
  final String schedule;
  final String price;
  final String contact;
  final String registration;
  final String teacherId;
  final List<String> studentIds;

  const School({
    required this.title,
    required this.description,
    required this.schedule,
    required this.price,
    required this.contact,
    required this.registration,
    required this.teacherId,
    required this.studentIds,
  });
}
