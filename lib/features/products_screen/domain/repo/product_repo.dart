import 'package:ecommerce_c17_frid/features/products_screen/data/models/Product_response.dart';

abstract class ProductRepo {
  Future<ProductResponse> getProducts(String catId);
}
