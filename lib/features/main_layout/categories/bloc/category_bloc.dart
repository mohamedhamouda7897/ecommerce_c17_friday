import 'package:bloc/bloc.dart';
import 'package:ecommerce_c17_frid/core/Api/error_handling.dart';
import 'package:ecommerce_c17_frid/features/auth/presentation/bloc/auth_state.dart';
import 'package:ecommerce_c17_frid/features/main_layout/categories/bloc/category_events.dart';
import 'package:ecommerce_c17_frid/features/main_layout/categories/bloc/category_state.dart';
import 'package:ecommerce_c17_frid/features/main_layout/home/domain/usecase/get_categories_usecase.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoryBloc extends Bloc<CategoryEvents, CategoryState> {
  GetCategoriesUsecase getCategoriesUseCase;

  CategoryBloc(this.getCategoriesUseCase) : super(CategoryState()) {
    on<GetCategoriesEvent>(_getCategories);
    on<ChangeSelectedCategory>(_changeSelectedCategory);
  }

  _changeSelectedCategory(
      ChangeSelectedCategory event, Emitter<CategoryState> emit)
      {
        emit(state.copyWith(selectedIndex: event.selectedIndex));
      }
  _getCategories(GetCategoriesEvent event, Emitter<CategoryState> emit) async {
    emit(state.copyWith(categoriesStatus: RequestStatus.loading));

    try {
      var result = await getCategoriesUseCase.call();

      emit(
        state.copyWith(
          categoriesStatus: RequestStatus.success,
          categoryResponse: result,
        ),
      );
    } on BaseExceptions catch (e) {
      emit(
        state.copyWith(
          categoriesStatus: RequestStatus.error,
          categoryException: e,
        ),
      );
    }
  }
}
