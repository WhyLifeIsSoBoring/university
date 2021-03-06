import 'package:equatable/equatable.dart';

abstract class UseCase<OutputT, InputT> {
  OutputT execute(InputT params);
}

abstract class FutureUseCase<OutputT, InputT> {
  Future<OutputT> execute(InputT params);
}

abstract class StreamUseCase<OutputT, InputT> {
  Stream<OutputT> execute(InputT params);
}

// This is used as a placeholder when
// use case is used without params
class NoParams extends Equatable {
  @override
  List<Object> get props => <Object>[];
}
