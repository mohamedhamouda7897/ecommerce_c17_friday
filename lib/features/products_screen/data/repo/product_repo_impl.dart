import 'package:ecommerce_c17_frid/core/Api/error_handling.dart';
import 'package:ecommerce_c17_frid/features/products_screen/data/data_source/product_ds.dart';
import 'package:ecommerce_c17_frid/features/products_screen/data/models/Product_response.dart';
import 'package:ecommerce_c17_frid/features/products_screen/domain/repo/product_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepo)
class ProductRepoImpl implements ProductRepo {
  ProductDs dataSource;

  ProductRepoImpl(this.dataSource);

  @override
  Future<ProductResponse> getProducts(String catId) async {
    try {
      var result = await dataSource.getProducts(catId);
      return result;
    } catch (e) {
      throw GeneralException();
    }
  }
}
