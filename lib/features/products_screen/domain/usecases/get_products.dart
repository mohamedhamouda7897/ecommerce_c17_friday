import 'package:ecommerce_c17_frid/features/products_screen/data/models/Product_response.dart';
import 'package:ecommerce_c17_frid/features/products_screen/domain/repo/product_repo.dart';
import 'package:injectable/injectable.dart';
@injectable
class GetProductsUseCase {
  ProductRepo repo;

  GetProductsUseCase(this.repo);

  Future<ProductResponse> call(String catId) => repo.getProducts(catId);
}
