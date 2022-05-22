import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

class SocialEventState extends Equatable {
  final SocialEvent event;
  final bool isRegisterButtonEnabled;

  const SocialEventState({
    required this.event,
    required this.isRegisterButtonEnabled,
  });

  SocialEventState copyWith({
    SocialEvent? event,
    bool? isRegisterButtonEnabled,
  }) {
    return SocialEventState(
      event: event ?? this.event,
      isRegisterButtonEnabled:
          isRegisterButtonEnabled ?? this.isRegisterButtonEnabled,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        event,
        isRegisterButtonEnabled,
      ];
}
