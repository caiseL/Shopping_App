import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shopping_app_firebase/bloc/provider.dart';
import 'package:shopping_app_firebase/pages/account_page/account_page.dart';
import 'package:shopping_app_firebase/pages/account_page/add_products.dart';
import 'package:shopping_app_firebase/pages/account_page/change_profile_page.dart';
import 'package:shopping_app_firebase/pages/categories_page.dart';
import 'package:shopping_app_firebase/pages/home_page.dart';
import 'package:shopping_app_firebase/pages/login_page.dart';
import 'package:shopping_app_firebase/pages/product_details/product_details.dart';
import 'package:shopping_app_firebase/pages/register_page.dart';
import 'package:shopping_app_firebase/pages/settings_page.dart';
import 'package:shopping_app_firebase/user_preferences/preferences.dart';
import 'package:shopping_app_firebase/widgets/full_screen_dialog.dart';
import 'package:shopping_app_firebase/widgets/my_behavior.dart';

import 'theme/theme_dart.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = UserPreferences();
  await prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final prefs = UserPreferences();
    return Provider(
      child: MaterialApp(
        builder: (context, child) {
          return ScrollConfiguration(
            child: child,
            behavior: MyBehavior(),
          );
        },
        debugShowCheckedModeBanner: false,
        theme: getThemeData(),
        initialRoute: prefs.token == null ? "login-page" : "/",
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case 'login-page':
              return PageTransition(
                  child: LoginPage(), type: PageTransitionType.fade);
              break;
            case 'register-page':
              return PageTransition(
                  child: RegisterPage(), type: PageTransitionType.fade);
              break;
            case '/':
              return PageTransition(
                  child: HomePage(), type: PageTransitionType.fade);
              break;
            case 'details':
              return PageTransition(
                  child: ProductDetails(),
                  type: PageTransitionType.fade,
                  settings: settings);
              break;
            case 'categories':
              return PageTransition(
                  child: CategoriesPage(), type: PageTransitionType.fade);
              break;
            case 'account':
              return PageTransition(
                  child: AccountPage(), type: PageTransitionType.fade);
              break;
            case 'account/change_profile':
              return PageTransition(
                  child: ChangeProfilePage(), type: PageTransitionType.fade);
              break;
            case 'settings_page':
              return PageTransition(
                  child: SettingsPage(), type: PageTransitionType.fade);
              break;
            case 'full_screen_dialog':
              return PageTransition(
                child: FullScreenDialog(),
                type: PageTransitionType.bottomToTop,
                curve: Curves.fastLinearToSlowEaseIn,
              );
              break;
            case 'add_products_page':
              return PageTransition(
                  child: AddProductPage(), type: PageTransitionType.fade);
              break;
            default:
              return null;
              break;
          }
        },
      ),
    );
  }
}
