import 'package:ecommerce_c17_frid/core/resources/values_manager.dart';
import 'package:ecommerce_c17_frid/di.dart';
import 'package:ecommerce_c17_frid/features/products_screen/presentation/bloc/product_bloc.dart';
import 'package:ecommerce_c17_frid/features/products_screen/presentation/bloc/product_events.dart';
import 'package:ecommerce_c17_frid/features/products_screen/presentation/bloc/product_state.dart';
import 'package:ecommerce_c17_frid/features/products_screen/presentation/widgets/custom_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/resources/assets_manager.dart';
import '../../../../core/widget/home_screen_app_bar.dart';

class ProductsScreen extends StatelessWidget {
  String catId;

  ProductsScreen({super.key, required this.catId});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (context) => getIt<ProductBloc>()..add(GetProductsEvent(catId)),
      child: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: const HomeScreenAppBar(automaticallyImplyLeading: true),
            body: Padding(
              padding: const EdgeInsets.all(AppPadding.p16),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      itemCount: state.response?.data?.length ?? 0,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            childAspectRatio: 7 /10,
                          ),
                      itemBuilder: (context, index) {
                        return CustomProductWidget(
                          product: state.response!.data![index],
                          image: state.response?.data?[index].imageCover ?? "",
                          title: state.response?.data?[index].title ?? "",
                          price:
                              state.response?.data?[index].price?.toDouble() ??
                              0.0,
                          rating:
                              state.response?.data?[index].ratingsAverage
                                  ?.toDouble() ??
                              0.0,
                          discountPercentage: 10,
                          height: height,
                          width: width,
                          description:
                              state.response?.data?[index].description ?? "",
                        );
                      },
                      scrollDirection: Axis.vertical,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
