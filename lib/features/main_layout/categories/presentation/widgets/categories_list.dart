import 'package:ecommerce_c17_frid/core/resources/color_manager.dart';
import 'package:ecommerce_c17_frid/core/resources/values_manager.dart';
import 'package:ecommerce_c17_frid/features/main_layout/categories/presentation/bloc/category_bloc.dart';
import 'package:ecommerce_c17_frid/features/main_layout/categories/presentation/bloc/category_events.dart';
import 'package:ecommerce_c17_frid/features/main_layout/categories/presentation/bloc/category_state.dart';
import 'package:ecommerce_c17_frid/features/main_layout/categories/presentation/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CategoriesList extends StatelessWidget {
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocConsumer<CategoryBloc, CategoryState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            decoration: BoxDecoration(
              color: ColorManager.containerGray,
              border: Border(
                // set the border for only 3 sides
                top: BorderSide(
                  width: AppSize.s2,
                  color: ColorManager.primary.withOpacity(0.3),
                ),
                left: BorderSide(
                  width: AppSize.s2,
                  color: ColorManager.primary.withOpacity(0.3),
                ),
                bottom: BorderSide(
                  width: AppSize.s2,
                  color: ColorManager.primary.withOpacity(0.3),
                ),
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSize.s12),
                bottomLeft: Radius.circular(AppSize.s12),
              ),
            ),

            // the categories items list
            child: ClipRRect(
              // clip the corners of the container that hold the list view
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(AppSize.s12),
                bottomLeft: Radius.circular(AppSize.s12),
              ),
              child: ListView.builder(
                itemCount: state.categoryResponse?.results ?? 0,
                itemBuilder: (context, index) => CategoryItem(
                  index,
                  state.categoryResponse?.data?[index].name ?? "",
                  state.selectedIndex == index,
                  (num) {
                    BlocProvider.of<CategoryBloc>(
                      context,
                    ).add(ChangeSelectedCategory(num));
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
