import 'package:ecommerce_c17_frid/core/routes_manager/routes.dart';
import 'package:ecommerce_c17_frid/di.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/cache_helper/cache_helper.dart';
import 'core/routes_manager/route_generator.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await configureDependencies();

  runApp( MainApp());
}

class MainApp extends StatelessWidget {
   MainApp({super.key});
  String? token = getIt<LocalStorageService>().get<String>("Token");

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: child,
        onGenerateRoute: RouteGenerator.getRoute,
        initialRoute: token != null ? Routes.mainRoute : Routes.signInRoute,
      ),
    );
  }
}
