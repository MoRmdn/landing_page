import 'package:equatable/equatable.dart';

import '../../generated/l10n.dart';

sealed class Failure extends Equatable {}

final class CacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

final class ServerFailure extends Failure {
  @override
  List<Object?> get props => [];
}

final class MissingDataFailure extends Failure {
  @override
  List<Object?> get props => [];
}

final class CancelFailure extends Failure {
  @override
  List<Object?> get props => [];
}

final class NoConnectionFailure extends Failure {
  @override
  List<Object?> get props => [];
}

final class FormatFailure extends Failure {
  @override
  List<Object?> get props => [];
}

final class ResponseFailure extends Failure {
  final String? message;

  ResponseFailure({this.message});

  @override
  List<Object?> get props => [message];
}

String mapFailureToException(Failure failure) => switch (failure.runtimeType) {
      ServerFailure => S.current.httpException,
      CacheFailure => S.current.cacheException,
      FormatFailure => S.current.formatException,
      CancelFailure => S.current.cancelException,
      NoConnectionFailure => S.current.socketException,
      MissingDataFailure => S.current.dataNotCompleted,
      ResponseFailure =>
        (failure as ResponseFailure).message ?? S.current.error,
      _ => S.current.error,
    };
