import 'package:ecommerce_c17_frid/core/Api/error_handling.dart';
import 'package:ecommerce_c17_frid/features/auth/presentation/bloc/auth_state.dart';
import 'package:ecommerce_c17_frid/features/products_screen/data/models/Product_response.dart';

class ProductState {
  RequestStatus? productStatus;

  ProductResponse? response;
  BaseExceptions? exception;

  ProductState({
    this.productStatus = RequestStatus.init,
    this.response,
    this.exception,
  });

  ProductState copyWith({
    RequestStatus? productStatus,
    ProductResponse? response,
    BaseExceptions? exception,
  }) {
    return ProductState(
      productStatus: productStatus ?? this.productStatus,
      response: response ?? this.response,
      exception: exception ?? this.exception,
    );
  }
}
