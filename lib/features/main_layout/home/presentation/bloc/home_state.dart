import 'package:ecommerce_c17_frid/features/auth/presentation/bloc/auth_state.dart';
import 'package:ecommerce_c17_frid/features/main_layout/home/data/models/CategoryReponse.dart';

class HomeState {
  RequestStatus? getCategoriesRequestStatus;
  CategoryResponse? model;
  String? errorMessage;

  HomeState({
    this.getCategoriesRequestStatus = RequestStatus.init,
    this.model,
    this.errorMessage,
  });

  HomeState copyWith({
    RequestStatus? getCategoriesRequestStatus,
    CategoryResponse? model,
    String? errorMessage,
  }) {
    return HomeState(
      getCategoriesRequestStatus:
          getCategoriesRequestStatus ?? this.getCategoriesRequestStatus,
      model: model ?? this.model,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
