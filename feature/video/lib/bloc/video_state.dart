import 'package:domain/domain.dart';
import 'package:presentation/presentation.dart';

class VideoState extends Equatable {
  final User? user;

  const VideoState({this.user});

  @override
  List<Object?> get props => <Object?>[user];
}
