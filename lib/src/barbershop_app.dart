import 'package:dw11_barbershop/src/core/ui/barbershop_theme.dart';
import 'package:dw11_barbershop/src/core/ui/widgets/barbershop_loader.dart';
import 'package:dw11_barbershop/src/features/auth/login/login_page.dart';
import 'package:dw11_barbershop/src/features/splash/splash_page.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:asyncstate/asyncstate.dart';

class BarbershopApp extends StatelessWidget {
  const BarbershopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AsyncStateBuilder(
      customLoader: const BarbershopLoader(),
      builder: (asyncNavigatorObbserver) {
        return MaterialApp(
          title: 'DW Barbershop',
          theme: BarbershopTheme.themeData,
          navigatorObservers: [asyncNavigatorObbserver],
          routes: {
            '/': (_) => const SplashPage(),
            '/auth/login': (_) => const LoginPage(),
            '/home/adm': (_) => const Text('ADM'),
            '/home/employee': (_) => const Text('Employee'),
          },
        );
      },
    );
  }
}
