import 'package:detection_app/config/routes/router.dart';
import 'package:detection_app/config/routes/routes_path.dart';
import 'package:detection_app/config/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DetectionApp extends StatelessWidget {
  final AppRouter appRouter;
  final String initRoute;
  const DetectionApp(
      {super.key, required this.appRouter, required this.initRoute});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: Style.lightTheme,
        initialRoute: RoutePath.home,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
