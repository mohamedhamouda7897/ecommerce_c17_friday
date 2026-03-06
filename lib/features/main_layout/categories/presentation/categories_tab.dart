import 'package:ecommerce_c17_frid/core/resources/values_manager.dart';
import 'package:ecommerce_c17_frid/di.dart';
import 'package:ecommerce_c17_frid/features/main_layout/categories/presentation/bloc/category_bloc.dart';
import 'package:ecommerce_c17_frid/features/main_layout/categories/presentation/bloc/category_events.dart';
import 'package:ecommerce_c17_frid/features/main_layout/categories/presentation/bloc/category_state.dart';
import 'package:ecommerce_c17_frid/features/main_layout/categories/presentation/widgets/categories_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

import '../../../auth/presentation/bloc/auth_state.dart';
import 'widgets/sub_categories_list.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      child: BlocProvider(
        create: (context) => getIt<CategoryBloc>()
          ..add(GetCategoriesEvent())
          ..add(GetSubCategoriesEvent()),
        child: BlocConsumer<CategoryBloc, CategoryState>(
          listener: (context, state) {
            if (state.categoriesStatus == RequestStatus.loading ||
                state.subCategoriesStatus == RequestStatus.loading) {
              context.loaderOverlay.show();
            } else {
              context.loaderOverlay.hide();
            }
          },
          builder: (context, state) {
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p12,
                vertical: AppPadding.p12,
              ),
              child: Row(
                children: [
                  CategoriesList(),
                  SizedBox(width: AppSize.s16),
                  SubCategoriesList(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
