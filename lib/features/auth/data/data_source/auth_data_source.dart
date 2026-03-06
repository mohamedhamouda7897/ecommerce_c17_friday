import 'package:ecommerce_c17_frid/features/auth/data/models/AuthResponse.dart';
import 'package:ecommerce_c17_frid/features/auth/domain/entity/SignupRequest.dart';

abstract class AuthDataSource {


 Future<AuthResponse> login(String email,String password);
 Future<AuthResponse> signUp(SignupRequest request);
}