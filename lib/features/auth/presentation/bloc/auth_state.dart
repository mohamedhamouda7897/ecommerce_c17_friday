import 'package:ecommerce_c17_frid/features/auth/data/models/AuthResponse.dart';

enum RequestStatus { init, success, error, loading }

class AuthState {
  RequestStatus? loginRequestStatus;
  String? loginErrorMessage;
  AuthResponse? loginResponse;

  RequestStatus? signupRequestStatus;
  String? signupErrorMessage;
  AuthResponse? signupResponse;

  AuthState({
    this.loginRequestStatus = RequestStatus.init,
    this.loginErrorMessage,
    this.loginResponse,
    this.signupRequestStatus = RequestStatus.init,
    this.signupErrorMessage,
    this.signupResponse,
  });

  AuthState copyWith({
    RequestStatus? loginRequestStatus,
    String? loginErrorMessage,
    AuthResponse? loginResponse,
    RequestStatus? signupRequestStatus,
    String? signupErrorMessage,
    AuthResponse? signupResponse,
  }) {
    return AuthState(
      loginRequestStatus: loginRequestStatus ?? this.loginRequestStatus,
      loginErrorMessage: loginErrorMessage ?? this.loginErrorMessage,
      loginResponse: loginResponse ?? this.loginResponse,
      signupRequestStatus: signupRequestStatus ?? this.signupRequestStatus,
      signupErrorMessage: signupErrorMessage ?? this.signupErrorMessage,
      signupResponse: signupResponse ?? this.signupResponse,
    );
  }
}
