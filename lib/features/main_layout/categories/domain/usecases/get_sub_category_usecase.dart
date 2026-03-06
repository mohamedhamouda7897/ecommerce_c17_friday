import 'package:ecommerce_c17_frid/features/main_layout/categories/data/models/SubCategoryResponse.dart';
import 'package:ecommerce_c17_frid/features/main_layout/categories/domain/repo/sub_category_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetSubCategoryUseCase {
  SubCategoryRepo repo;

  GetSubCategoryUseCase(this.repo);

  Future<SubCategoryResponse> call() => repo.getSubCategory();
}
