import 'package:ecommerce_c17_frid/features/main_layout/categories/data/models/SubCategoryResponse.dart';

abstract class SubCategoryRepo {
  Future<SubCategoryResponse> getSubCategory();
}
