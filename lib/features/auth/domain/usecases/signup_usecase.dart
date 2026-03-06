import 'package:ecommerce_c17_frid/features/auth/data/models/AuthResponse.dart';
import 'package:ecommerce_c17_frid/features/auth/domain/entity/SignupRequest.dart';
import 'package:ecommerce_c17_frid/features/auth/domain/repository/auth_repositroy.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignupUsecase {
  AuthRepository authRepository;

  SignupUsecase(this.authRepository);

  Future<AuthResponse> call(SignupRequest req) => authRepository.signUp(req);
}
