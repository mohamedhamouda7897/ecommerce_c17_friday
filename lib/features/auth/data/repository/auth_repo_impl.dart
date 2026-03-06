import 'package:ecommerce_c17_frid/core/Api/error_handling.dart';
import 'package:ecommerce_c17_frid/features/auth/data/data_source/auth_data_source.dart';
import 'package:ecommerce_c17_frid/features/auth/data/models/AuthResponse.dart';
import 'package:ecommerce_c17_frid/features/auth/domain/entity/SignupRequest.dart';
import 'package:ecommerce_c17_frid/features/auth/domain/repository/auth_repositroy.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepoImpl implements AuthRepository {
  AuthDataSource authDataSource;

  AuthRepoImpl(this.authDataSource);

  @override
  Future<AuthResponse> login(String email, String password) async {
    try {
      var response = await authDataSource.login(email, password);
      return response;
    } catch (e) {
      throw AuthFailedException("Username or password is incorrect");
    }
  }

  @override
  Future<AuthResponse> signUp(SignupRequest request) async {
    try {
      var response = await authDataSource.signUp(request);
      return response;
    } catch (e) {
      throw Exception();
    }
  }
}
