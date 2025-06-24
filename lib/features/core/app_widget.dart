import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test1/features/core/theme/app_theme.dart';
import 'package:flutter_test1/utils/router/router.dart';
import 'package:flutter_test1/utils/router/routers.dart';

class AppWidget extends ConsumerWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ScreenUtilInit(
      designSize: MediaQuery.of(context).size,
      minTextAdapt: true, // to adapt text with phone size
      splitScreenMode: true,
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Car Rent',
        theme: AppTheme.inatance.lightTheme,
        locale: Locale('en'),
        initialRoute: Routers.splash,
        routes: AppRouter.routes,
      ),
    );
  }
}
