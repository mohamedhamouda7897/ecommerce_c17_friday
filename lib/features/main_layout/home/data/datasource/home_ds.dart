import 'package:ecommerce_c17_frid/features/main_layout/home/data/models/CategoryReponse.dart';

abstract class HomeDataSource {


  Future<CategoryResponse> getCategories();

}