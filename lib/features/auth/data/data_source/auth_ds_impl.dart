import 'package:ecommerce_c17_frid/core/Api/api_manager.dart';
import 'package:ecommerce_c17_frid/core/Api/endpoints.dart';
import 'package:ecommerce_c17_frid/features/auth/data/data_source/auth_data_source.dart';
import 'package:ecommerce_c17_frid/features/auth/data/models/AuthResponse.dart';
import 'package:ecommerce_c17_frid/features/auth/domain/entity/SignupRequest.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  ApiManager apiManager;

  AuthDataSourceImpl(this.apiManager);

  @override
  Future<AuthResponse> login(String email, String password) async {
    try {
      var response = await apiManager.post(
        endpoint: Endpoints.signIn,
        data: {"email": email, "password": password},
      );
      return AuthResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<AuthResponse> signUp(SignupRequest request)async {
    try {
      var response = await apiManager.post(
        endpoint: Endpoints.signup,
        data: request.toJson(),
      );
      return AuthResponse.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
