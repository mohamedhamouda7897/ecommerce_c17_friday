import 'package:ecommerce_c17_frid/core/resources/assets_manager.dart';
import 'package:ecommerce_c17_frid/core/resources/color_manager.dart';
import 'package:ecommerce_c17_frid/core/resources/font_manager.dart';
import 'package:ecommerce_c17_frid/core/resources/styles_manager.dart';
import 'package:ecommerce_c17_frid/core/resources/values_manager.dart';
import 'package:ecommerce_c17_frid/features/main_layout/categories/presentation/widgets/category_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/category_bloc.dart';
import '../bloc/category_state.dart';
import 'sub_category_item.dart';

class SubCategoriesList extends StatelessWidget {
  const SubCategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: BlocConsumer<CategoryBloc, CategoryState>(
        listener: (context, state) {},
        builder: (context, state) {
          return CustomScrollView(
            slivers: <Widget>[
              // category title
              SliverToBoxAdapter(
                child: Text(
                  'Laptops & Electronics',
                  style: getBoldStyle(
                    color: ColorManager.primary,
                    fontSize: FontSize.s14,
                  ),
                ),
              ),
              // the category card
              SliverToBoxAdapter(
                child: CategoryCardItem(
                  "Laptops & Electronics",
                  ImageAssets.categoryCardImage,
                  goToCategoryProductsListScreen,
                ),
              ),
              // the grid view of the subcategories
              SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  childCount: state.subCategoryResponse?.data?.length??0,
                  (context, index) => SubCategoryItem(
                    state.subCategoryResponse?.data?[index].name??"",
                    ImageAssets.subcategoryCardImage,
                    goToCategoryProductsListScreen,
                    state.categoryResponse?.data?[state.selectedIndex??0].id??""
                  ),
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: AppSize.s8,
                  crossAxisSpacing: AppSize.s8,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  goToCategoryProductsListScreen() {
    // todo implement this function
  }
}
