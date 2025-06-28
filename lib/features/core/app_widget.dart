import 'package:doos_doos/features/core/theme/app_theme.dart';
import 'package:doos_doos/features/providers/shared_prefs_provider.dart';
import 'package:doos_doos/l10n/app_localizations.dart';
import 'package:doos_doos/utils/router/router.dart';
import 'package:doos_doos/utils/router/routers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AppWidget extends ConsumerWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sharedpref = ref.watch(sharedPrefSettings);
    return ScreenUtilInit(
      designSize: MediaQuery.of(context).size,
      minTextAdapt: true, // to adapt text with phone size
      splitScreenMode: true,
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'DOOS DOOS',
        theme: AppTheme.inatance.lightTheme,
        locale: Locale(sharedpref.language),
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        initialRoute: Routers.splash,
        routes: AppRouter.routes,
      ),
    );
  }
}
