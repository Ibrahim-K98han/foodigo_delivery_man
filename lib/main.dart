import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodigo/widget/fetch_error_text.dart';

import 'dependency_injection.dart';
import 'presentation/core/routes/route_names.dart';
import 'utils/k_strings.dart';
import 'widget/custom_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await DInjector.initDB();
  runApp(const MyApp());
  // runApp(DevicePreview(enabled: !kReleaseMode, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: DInjector.repositoryProvider,
      child: MultiBlocProvider(
        providers: DInjector.blocProvider,
        child: ScreenUtilInit(
          designSize: const Size(375.0, 812.0),
          minTextAdapt: true,
          splitScreenMode: true,
          useInheritedMediaQuery: true,
          builder: (BuildContext context, child) {
            return MaterialApp(
              // useInheritedMediaQuery: true,
              // locale: DevicePreview.locale(context),
              // builder: DevicePreview.appBuilder,
              title: KStrings.appName,
              debugShowCheckedModeBanner: false,
              initialRoute: RouteNames.splashScreen,
              onGenerateRoute: RouteNames.generateRoutes,
              onUnknownRoute: (RouteSettings settings) {
                return MaterialPageRoute(
                  builder:
                      (_) => Scaffold(
                        body: FetchErrorText(
                          text: 'No route defined for ${settings.name}',
                          textColor: Colors.red,
                        ),
                      ),
                );
              },
              theme: MyTheme.theme,
            );
          },
        ),
      ),
    );
  }
}
