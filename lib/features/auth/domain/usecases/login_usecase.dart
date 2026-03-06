import 'package:ecommerce_c17_frid/features/auth/data/models/AuthResponse.dart';
import 'package:ecommerce_c17_frid/features/auth/domain/repository/auth_repositroy.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase {
  AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  Future<AuthResponse> call(String email, String password) =>
      authRepository.login(email, password);
}
