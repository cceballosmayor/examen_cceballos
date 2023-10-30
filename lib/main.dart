import 'package:flutter/material.dart';
import 'package:examen_cceballos/theme/my_theme.dart';
import 'package:provider/provider.dart';
import 'routes/app_routes.dart';
import 'services/auth_service.dart';
import 'services/product_service.dart';
import 'services/category_service.dart';
import 'services/provider_service.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => ProductService()),
        ChangeNotifierProvider(create: (_) => ProviderService()),
        ChangeNotifierProvider(create: (_) => CategoryService()),
      ],
      child: const ExamenApp(),
    );
  }
}

class ExamenApp extends StatelessWidget {
  const ExamenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Módulos',
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.routes,
      onGenerateRoute: AppRoutes.onGenerateRoute,
      theme: MyTheme.myTheme,
    );
  }
}
