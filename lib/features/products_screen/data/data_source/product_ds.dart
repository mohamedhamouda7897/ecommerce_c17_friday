import 'package:ecommerce_c17_frid/core/Api/api_manager.dart';
import 'package:ecommerce_c17_frid/core/Api/endpoints.dart';
import 'package:ecommerce_c17_frid/features/products_screen/data/models/Product_response.dart';
import 'package:injectable/injectable.dart';

abstract class ProductDs {
  Future<ProductResponse> getProducts(String catId);
}

@Injectable(as: ProductDs)
class ProductDsImpl implements ProductDs {
  ApiManager apiManager;

  ProductDsImpl(this.apiManager);

  @override
  Future<ProductResponse> getProducts(String catId) async {
    try {
      var result = await apiManager.get(
        endpoint: Endpoints.products,
        queryParameters: {"category[in]": catId},
      );
      return ProductResponse.fromJson(result.data);
    } catch (e) {
      rethrow;
    }
  }
}
