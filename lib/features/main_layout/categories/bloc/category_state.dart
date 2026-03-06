import 'package:ecommerce_c17_frid/core/Api/error_handling.dart';
import 'package:ecommerce_c17_frid/features/auth/presentation/bloc/auth_state.dart';
import 'package:ecommerce_c17_frid/features/main_layout/home/data/models/CategoryReponse.dart';

class CategoryState {
  RequestStatus? categoriesStatus;
  CategoryResponse? categoryResponse;
  BaseExceptions? categoryException;
  int? selectedIndex;

  CategoryState({
    this.categoriesStatus=RequestStatus.init,
    this.categoryResponse,
    this.categoryException,
    this.selectedIndex=0,
  });

  CategoryState copyWith({
    RequestStatus? categoriesStatus,
    CategoryResponse? categoryResponse,
    BaseExceptions? categoryException,
    int? selectedIndex,
  }) {
    return CategoryState(
      categoriesStatus: categoriesStatus ?? this.categoriesStatus,
      categoryResponse: categoryResponse ?? this.categoryResponse,
      selectedIndex: selectedIndex ?? this.selectedIndex,
      categoryException: categoryException ?? this.categoryException,
    );
  }
}
