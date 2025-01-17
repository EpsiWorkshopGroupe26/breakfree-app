import 'package:breakfree/configs/routes/routes.dart';
import 'package:breakfree/configs/themes/dark_theme.dart';
import 'package:breakfree/configs/themes/light_theme.dart';
import 'package:breakfree/pages/auth/setup/setup_view.dart';
import 'package:breakfree/pages/onboarding.dart';
import 'package:breakfree/pages/tabs/tab_screen.dart';
import 'package:breakfree/utils/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: Color(0xFFF9EBDF),
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  final savedThemeMode = await AdaptiveTheme.getThemeMode();

  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatefulWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const MyApp({super.key, this.savedThemeMode});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Routes.defineRoutes();
  }

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: lightTheme,
      dark: darkTheme,
      initial: widget.savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        title: 'BreakFree',
        theme: theme,
        initialRoute: '/',
        onGenerateRoute: Routes.router.generator,
        debugShowCheckedModeBanner: false,
        // home: FutureBuilder<AuthStatus>(
        //   future: AuthService().isAuthenticated(),
        //   builder: (context, snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting ||
        //         !snapshot.hasData) {
        //       return const Scaffold(
        //         body: Center(
        //           child: CircularProgressIndicator(),
        //         ),
        //       );
        //     }

        //     if (snapshot.data == AuthStatus.setup) {
        //       return const TabScreen();
        //     } else if (snapshot.data == AuthStatus.authenticated) {
        //       return const SetupView();
        //     } else {
        //       return const OnboardingView();
        //     }
        //   },
        // ),
        home: const OnboardingView(),
      ),
    );
  }
}
