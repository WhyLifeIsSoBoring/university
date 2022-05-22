import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

class SchoolState extends Equatable {
  final School school;
  final User? user;
  final bool isUserSubscribed;
  final bool isRegisterButtonEnabled;
  final String? errorMessage;

  const SchoolState({
    required this.school,
    this.user,
    this.isUserSubscribed = false,
    this.isRegisterButtonEnabled = true,
    this.errorMessage,
  });

  SchoolState copyWith({
    School? school,
    User? user,
    bool? isUserSubscribed,
    bool? isRegisterButtonEnabled,
    String? errorMessage,
  }) {
    return SchoolState(
      school: school ?? this.school,
      user: user ?? this.user,
      isUserSubscribed: isUserSubscribed ?? this.isUserSubscribed,
      isRegisterButtonEnabled:
          isRegisterButtonEnabled ?? this.isRegisterButtonEnabled,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        school,
        user,
        isUserSubscribed,
        isRegisterButtonEnabled,
        errorMessage,
      ];
}
