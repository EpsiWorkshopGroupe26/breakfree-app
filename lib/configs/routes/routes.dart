import 'package:fluro/fluro.dart';
import 'package:breakfree/pages/auth/login_view.dart';
import 'package:breakfree/pages/auth/register_view.dart';
import 'package:breakfree/pages/auth/welcome_view.dart';

class Routes {
  static final FluroRouter router = FluroRouter();

  // --------------------------------------------
  // Definitions des routes pour l'arriver sur l'application
  // --------------------------------------------

  // --------------------------------------------
  // Definitions des route pour l'authentification
  // --------------------------------------------

  final Handler _welcomeHandler = Handler(
    handlerFunc: (context, params) {
      return const WelcomeView();
    },
  );

  final Handler _loginHandler = Handler(
    handlerFunc: (context, params) {
      return const LoginView();
    },
  );

  final Handler _registerHandler = Handler(
    handlerFunc: (context, params) {
      return const RegisterView();
    },
  );

  // --------------------------------------------
  // Definitions des routes pour les parametres
  // --------------------------------------------

  // --------------------------------------------
  // Definitions des routes pour les pages Tabs
  // --------------------------------------------

  // --------------------------------------------
  // Definitions des routes pour les autres pages
  // --------------------------------------------

  static dynamic defineRoutes() {
    // --------------------------------------------
    // Definitions des routes pour l'authentification
    // --------------------------------------------

    Routes.router.define(
      '/auth/welcome',
      handler: Routes()._welcomeHandler,
      transitionType: TransitionType.inFromRight,
    );

    Routes.router.define(
      '/auth/login',
      handler: Routes()._loginHandler,
      transitionType: TransitionType.inFromBottom,
    );

    Routes.router.define(
      '/auth/register',
      handler: Routes()._registerHandler,
      transitionType: TransitionType.inFromBottom,
    );

    // --------------------------------------------
    // Definitions des routes pour les parametres
    // --------------------------------------------

    // --------------------------------------------
    // Definitions des routes pour les pages Tabs
    // --------------------------------------------

    // --------------------------------------------
    // Definitions des routes pour les autres pages
    // --------------------------------------------
  }
}
