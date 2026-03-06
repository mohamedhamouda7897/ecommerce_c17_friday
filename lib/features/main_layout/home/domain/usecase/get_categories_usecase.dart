import 'package:ecommerce_c17_frid/features/main_layout/home/data/models/CategoryReponse.dart';
import 'package:ecommerce_c17_frid/features/main_layout/home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUsecase {
  HomeRepo repo;

  GetCategoriesUsecase(this.repo);

  Future<CategoryResponse> call() {
    return repo.getCategories();
  }
}
