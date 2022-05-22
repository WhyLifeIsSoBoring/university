import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

class CourseState extends Equatable {
  final Course course;
  final User? user;
  final bool isUserSubscribed;
  final bool isRegisterButtonEnabled;
  final String? errorMessage;

  const CourseState({
    required this.course,
    this.user,
    this.isUserSubscribed = false,
    this.isRegisterButtonEnabled = true,
    this.errorMessage,
  });

  CourseState copyWith({
    Course? course,
    User? user,
    bool? isUserSubscribed,
    bool? isRegisterButtonEnabled,
    String? errorMessage,
  }) {
    return CourseState(
      course: course ?? this.course,
      user: user ?? this.user,
      isUserSubscribed: isUserSubscribed ?? this.isUserSubscribed,
      isRegisterButtonEnabled:
          isRegisterButtonEnabled ?? this.isRegisterButtonEnabled,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        course,
        user,
        isUserSubscribed,
        isRegisterButtonEnabled,
        errorMessage,
      ];
}
