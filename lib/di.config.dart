// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import 'core/Api/api_manager.dart' as _i795;
import 'core/cache_helper/cache_helper.dart' as _i891;
import 'features/auth/data/data_source/auth_data_source.dart' as _i697;
import 'features/auth/data/data_source/auth_ds_impl.dart' as _i524;
import 'features/auth/data/repository/auth_repo_impl.dart' as _i674;
import 'features/auth/domain/repository/auth_repositroy.dart' as _i890;
import 'features/auth/domain/usecases/login_usecase.dart' as _i206;
import 'features/auth/domain/usecases/signup_usecase.dart' as _i100;
import 'features/auth/presentation/bloc/auth_bloc.dart' as _i363;
import 'features/main_layout/categories/data/datasource/sub_category_Ds.dart'
    as _i125;
import 'features/main_layout/categories/data/repo/sub_category_repo_impl.dart'
    as _i544;
import 'features/main_layout/categories/domain/repo/sub_category_repo.dart'
    as _i399;
import 'features/main_layout/categories/domain/usecases/get_sub_category_usecase.dart'
    as _i92;
import 'features/main_layout/categories/presentation/bloc/category_bloc.dart'
    as _i916;
import 'features/main_layout/home/data/datasource/home_ds.dart' as _i269;
import 'features/main_layout/home/data/datasource/home_ds_impl.dart' as _i1070;
import 'features/main_layout/home/data/repo/home_repo_impl.dart' as _i573;
import 'features/main_layout/home/domain/repo/home_repo.dart' as _i347;
import 'features/main_layout/home/domain/usecase/get_categories_usecase.dart'
    as _i726;
import 'features/main_layout/home/presentation/bloc/home_bloc.dart' as _i123;
import 'features/products_screen/data/data_source/product_ds.dart' as _i0;
import 'features/products_screen/data/repo/product_repo_impl.dart' as _i845;
import 'features/products_screen/domain/repo/product_repo.dart' as _i1030;
import 'features/products_screen/domain/usecases/get_products.dart' as _i737;
import 'features/products_screen/presentation/bloc/product_bloc.dart' as _i477;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i795.ApiManager>(() => _i795.ApiManager());
    gh.factory<_i125.SubCategoryDs>(
      () => _i125.SubCategoryDsImpl(gh<_i795.ApiManager>()),
    );
    gh.factory<_i0.ProductDs>(() => _i0.ProductDsImpl(gh<_i795.ApiManager>()));
    gh.factory<_i269.HomeDataSource>(
      () => _i1070.HomeDataSourceImpl(gh<_i795.ApiManager>()),
    );
    gh.lazySingleton<_i891.LocalStorageService>(
      () => _i891.LocalStorageService(gh<_i460.SharedPreferences>()),
    );
    gh.factory<_i697.AuthDataSource>(
      () => _i524.AuthDataSourceImpl(
        gh<_i795.ApiManager>(),
        gh<_i891.LocalStorageService>(),
      ),
    );
    gh.factory<_i399.SubCategoryRepo>(
      () => _i544.SubCategoryRepoImpl(gh<_i125.SubCategoryDs>()),
    );
    gh.factory<_i890.AuthRepository>(
      () => _i674.AuthRepoImpl(gh<_i697.AuthDataSource>()),
    );
    gh.factory<_i1030.ProductRepo>(
      () => _i845.ProductRepoImpl(gh<_i0.ProductDs>()),
    );
    gh.factory<_i737.GetProductsUseCase>(
      () => _i737.GetProductsUseCase(gh<_i1030.ProductRepo>()),
    );
    gh.factory<_i347.HomeRepo>(
      () => _i573.HomeRepoImpl(gh<_i269.HomeDataSource>()),
    );
    gh.factory<_i206.LoginUseCase>(
      () => _i206.LoginUseCase(gh<_i890.AuthRepository>()),
    );
    gh.factory<_i100.SignupUsecase>(
      () => _i100.SignupUsecase(gh<_i890.AuthRepository>()),
    );
    gh.factory<_i477.ProductBloc>(
      () => _i477.ProductBloc(gh<_i737.GetProductsUseCase>()),
    );
    gh.factory<_i92.GetSubCategoryUseCase>(
      () => _i92.GetSubCategoryUseCase(gh<_i399.SubCategoryRepo>()),
    );
    gh.factory<_i363.AuthBloc>(
      () => _i363.AuthBloc(gh<_i206.LoginUseCase>(), gh<_i100.SignupUsecase>()),
    );
    gh.factory<_i726.GetCategoriesUsecase>(
      () => _i726.GetCategoriesUsecase(gh<_i347.HomeRepo>()),
    );
    gh.factory<_i123.HomeBloc>(
      () => _i123.HomeBloc(gh<_i726.GetCategoriesUsecase>()),
    );
    gh.factory<_i916.CategoryBloc>(
      () => _i916.CategoryBloc(
        gh<_i726.GetCategoriesUsecase>(),
        gh<_i92.GetSubCategoryUseCase>(),
      ),
    );
    return this;
  }
}

class _$RegisterModule extends _i891.RegisterModule {}
