import 'package:bloc/bloc.dart';
import 'package:ecommerce_c17_frid/core/Api/error_handling.dart';
import 'package:ecommerce_c17_frid/features/auth/presentation/bloc/auth_state.dart';
import 'package:ecommerce_c17_frid/features/main_layout/home/domain/usecase/get_categories_usecase.dart';
import 'package:ecommerce_c17_frid/features/main_layout/home/presentation/bloc/home_events.dart';
import 'package:ecommerce_c17_frid/features/main_layout/home/presentation/bloc/home_state.dart';
import 'package:injectable/injectable.dart';
@injectable
class HomeBloc extends Bloc<HomeEvents, HomeState> {
  final GetCategoriesUsecase getCategoriesUsecase;

  HomeBloc(this.getCategoriesUsecase) : super(HomeState()) {
    on<GetCategories>(_getCategories);
  }

  _getCategories(GetCategories event, Emitter<HomeState> emit) async {
    try {
      emit(state.copyWith(getCategoriesRequestStatus: RequestStatus.loading));

      var response = await getCategoriesUsecase();
      emit(
        state.copyWith(
          getCategoriesRequestStatus: RequestStatus.success,
          model: response,
        ),
      );
    } on BaseExceptions catch (e) {
      emit(
        state.copyWith(
          getCategoriesRequestStatus: RequestStatus.error,
          errorMessage: e.message,
        ),
      );
    } catch (e) {
      emit(state.copyWith(getCategoriesRequestStatus: RequestStatus.error));
    }
  }
}
