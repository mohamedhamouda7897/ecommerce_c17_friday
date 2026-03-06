import 'package:bloc/bloc.dart';
import 'package:ecommerce_c17_frid/core/Api/error_handling.dart';
import 'package:ecommerce_c17_frid/features/auth/domain/usecases/login_usecase.dart';
import 'package:ecommerce_c17_frid/features/auth/domain/usecases/signup_usecase.dart';
import 'package:ecommerce_c17_frid/features/auth/presentation/bloc/auth_events.dart';
import 'package:ecommerce_c17_frid/features/auth/presentation/bloc/auth_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthBloc extends Bloc<AuthEvents, AuthState> {
  LoginUseCase loginUseCase;
  SignupUsecase signupUsecase;

  AuthBloc(this.loginUseCase, this.signupUsecase) : super(AuthState()) {
    on<LoginEvent>(_login);
    on<SignUpEvent>(_signup);
  }

  _signup(SignUpEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(signupRequestStatus: RequestStatus.loading));

    try {
      var response = await signupUsecase.call(event.request);

      emit(
        state.copyWith(
          signupRequestStatus: RequestStatus.success,
          signupResponse: response,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          signupRequestStatus: RequestStatus.error,
          signupErrorMessage: e.toString(),
        ),
      );
    }
  }

  _login(LoginEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(loginRequestStatus: RequestStatus.loading));

    try {
      var resposne = await loginUseCase.call(event.email, event.password);

      emit(
        state.copyWith(
          loginRequestStatus: RequestStatus.success,
          loginResponse: resposne,
        ),
      );
    } on BaseExceptions catch (e) {
      emit(
        state.copyWith(
          loginRequestStatus: RequestStatus.error,
          loginErrorMessage: e.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          loginRequestStatus: RequestStatus.error,
          loginErrorMessage: e.toString(),
        ),
      );
    }
  }
}
