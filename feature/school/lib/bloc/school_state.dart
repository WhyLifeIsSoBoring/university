import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

class SchoolState extends Equatable {
  final School school;
  final bool isUserSubscribed;
  final String? errorMessage;

  const SchoolState({
    required this.school,
    this.isUserSubscribed = false,
    this.errorMessage,
  });

  SchoolState copyWith({
    School? school,
    bool? isUserSubscribed,
    String? errorMessage,
  }) {
    return SchoolState(
      school: school ?? this.school,
      isUserSubscribed: isUserSubscribed ?? this.isUserSubscribed,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        school,
        isUserSubscribed,
        errorMessage,
      ];
}
