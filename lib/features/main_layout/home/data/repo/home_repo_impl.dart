import 'package:ecommerce_c17_frid/core/Api/error_handling.dart';
import 'package:ecommerce_c17_frid/features/main_layout/home/data/datasource/home_ds.dart';
import 'package:ecommerce_c17_frid/features/main_layout/home/data/models/CategoryReponse.dart';
import 'package:ecommerce_c17_frid/features/main_layout/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: HomeRepo )
class HomeRepoImpl implements HomeRepo {
  HomeDataSource dataSource;

  HomeRepoImpl(this.dataSource);

  @override
  Future<CategoryResponse> getCategories() async {
    try {
      var response = await dataSource.getCategories();
      return response;
    } catch (e) {
      throw GeneralException("Something went wrong");
    }
  }
}
