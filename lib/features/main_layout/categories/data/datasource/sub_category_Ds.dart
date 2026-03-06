import 'package:ecommerce_c17_frid/core/Api/api_manager.dart';
import 'package:ecommerce_c17_frid/core/Api/endpoints.dart';
import 'package:ecommerce_c17_frid/features/main_layout/categories/data/models/SubCategoryResponse.dart';
import 'package:injectable/injectable.dart';

abstract class SubCategoryDs {
  Future<SubCategoryResponse> getSubCategories();
}

@Injectable(as: SubCategoryDs)
class SubCategoryDsImpl implements SubCategoryDs {
  ApiManager apiManager;

  SubCategoryDsImpl(this.apiManager);

  @override
  Future<SubCategoryResponse> getSubCategories() async {
    try {
      var result = await apiManager.get(endpoint: Endpoints.subcategories);

      return SubCategoryResponse.fromJson(result.data);
    } catch (e) {
      rethrow;
    }
  }
}
