import 'package:ecommerce_c17_frid/core/Api/api_manager.dart';
import 'package:ecommerce_c17_frid/core/Api/endpoints.dart';
import 'package:ecommerce_c17_frid/features/main_layout/home/data/datasource/home_ds.dart';
import 'package:ecommerce_c17_frid/features/main_layout/home/data/models/CategoryReponse.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeDataSource)
class HomeDataSourceImpl implements HomeDataSource {
  ApiManager apiManager;

  HomeDataSourceImpl(this.apiManager);

  @override
  Future<CategoryResponse> getCategories() async {
    try {
      var data = await apiManager.get(endpoint: Endpoints.categories);

      return CategoryResponse.fromJson(data.data);
    } catch (e) {
      rethrow;
    }
  }
}
