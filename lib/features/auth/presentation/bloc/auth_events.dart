import 'package:ecommerce_c17_frid/features/auth/domain/entity/SignupRequest.dart';

abstract class AuthEvents {}

class LoginEvent extends AuthEvents {
  String email;
  String password;

  LoginEvent(this.email, this.password);
}

class SignUpEvent extends AuthEvents {
  SignupRequest request;

  SignUpEvent(this.request);
}
