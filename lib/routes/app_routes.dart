import 'package:flutter/material.dart';
import '../screens/screens.dart';

class AppRoutes {
  static const initialRoute = 'login';
  static Map<String, Widget Function(BuildContext)> routes = {
    'add_user': (BuildContext context) => const SignupScreen(),
    'login': (BuildContext context) => const LoginScreen(),
    'home': (BuildContext context) => const HomeScreen(),
    'products': (BuildContext context) => const ListProductScreen(),
    'products/create': (BuildContext context) => const CreateProductScreen(),
    'categories': (BuildContext context) => const ListCategoryScreen(),
    'categories/create': (BuildContext context) => const CreateCategoryScreen(),
    'providers': (BuildContext context) => const ListProviderScreen(),
    'providers/create': (BuildContext context) => const CreateProviderScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const ErrorScreen(),
    );
  }
}