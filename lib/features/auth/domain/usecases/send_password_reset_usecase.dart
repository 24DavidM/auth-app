import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class SendPasswordResetUseCase implements UseCase<void, PasswordResetParams> {
  final AuthRepository repository;
  SendPasswordResetUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(PasswordResetParams params) async {
    return await repository.sendPasswordResetEmail(params.email);
  }
}

class PasswordResetParams extends Equatable {
  final String email;

  const PasswordResetParams({required this.email});

  @override
  List<Object?> get props => [email];
}
