import 'package:bloc/bloc.dart';
import 'package:ecommerce_c17_frid/core/Api/error_handling.dart';
import 'package:ecommerce_c17_frid/features/auth/presentation/bloc/auth_state.dart';
import 'package:ecommerce_c17_frid/features/products_screen/domain/usecases/get_products.dart';
import 'package:ecommerce_c17_frid/features/products_screen/presentation/bloc/product_events.dart';
import 'package:ecommerce_c17_frid/features/products_screen/presentation/bloc/product_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductBloc extends Bloc<ProductEvents, ProductState> {
  GetProductsUseCase getProductsUseCase;

  ProductBloc(this.getProductsUseCase) : super(ProductState()) {
    on<GetProductsEvent>(_getProducts);
  }

  _getProducts(GetProductsEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(productStatus: RequestStatus.loading));

    try {
      var result = await getProductsUseCase.call(event.catId);
      emit(
        state.copyWith(productStatus: RequestStatus.success, response: result),
      );
    } on BaseExceptions catch (e) {
      emit(state.copyWith(productStatus: RequestStatus.error, exception: e));
    }
  }
}
