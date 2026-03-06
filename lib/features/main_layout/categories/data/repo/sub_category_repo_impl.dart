import 'package:ecommerce_c17_frid/core/Api/error_handling.dart';
import 'package:ecommerce_c17_frid/features/main_layout/categories/data/datasource/sub_category_Ds.dart';
import 'package:ecommerce_c17_frid/features/main_layout/categories/data/models/SubCategoryResponse.dart';
import 'package:ecommerce_c17_frid/features/main_layout/categories/domain/repo/sub_category_repo.dart';
import 'package:injectable/injectable.dart';
@Injectable(as: SubCategoryRepo)
class SubCategoryRepoImpl implements SubCategoryRepo {
  SubCategoryDs subCategoryDs;

  SubCategoryRepoImpl(this.subCategoryDs);

  @override
  Future<SubCategoryResponse> getSubCategory() async {
    try {
      var result = await subCategoryDs.getSubCategories();
      return result;
    } catch (e) {
      throw GeneralException("Something went wrong");
    }
  }
}
