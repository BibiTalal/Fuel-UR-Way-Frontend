import 'package:flutter/material.dart';
import 'package:fuel_ur_way_frontend/screens/siginup.dart';
import 'package:fuel_ur_way_frontend/screens/signin.dart';
import 'package:fuel_ur_way_frontend/screens/mainscreen.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:fuel_ur_way_frontend/providers/auth.dart';
import 'package:fuel_ur_way_frontend/screens/map.dart';
import 'package:fuel_ur_way_frontend/providers/nav_provider.dart';
import 'package:fuel_ur_way_frontend/screens/request.dart';
import 'package:fuel_ur_way_frontend/screens/requestdetails.dart';
import 'package:fuel_ur_way_frontend/providers/order_provider.dart';
import 'package:fuel_ur_way_frontend/screens/lastpage.dart';
import 'package:fuel_ur_way_frontend/screens/payment.dart';
import 'package:fuel_ur_way_frontend/screens/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var auth_Provider = AuthProvider();
  var isAuth = await auth_Provider.hasToken();

  runApp(MyApp(
    authProvider: auth_Provider,
  ));
}

final router = GoRouter(
  initialLocation: '/welcomscreen',
  routes: [
    GoRoute(
      path: '/welcomscreen',
      builder: (context, state) => WelcomeScreen(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => SignupScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => SigninScreen(),
    ),
    GoRoute(
      path: '/mainscreen',
      builder: (context, state) => MainScreen(),
    ),
    GoRoute(
      path: '/requestscreen',
      builder: (context, state) => RequestScreen(),
    ),
    GoRoute(
      path: '/requestscreen',
      builder: (context, state) => RequestScreen(),
    ),
    GoRoute(
      path: '/mapscreen',
      builder: (context, state) => MapScreen(),
    ),
    GoRoute(
      path: '/payment',
      builder: (context, state) => PaymentScreen(),
    ),
    GoRoute(
      path: '/requestdetails',
      builder: (context, state) => RequestDetails(),
    ),
    GoRoute(
      path: '/lastscreen',
      builder: (context, state) => LastScreen(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  final AuthProvider authProvider;

  MyApp({
    required this.authProvider,
  });
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => authProvider,
          ),
          ChangeNotifierProvider(
            create: (context) => OrderProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => NavigationProvider(),
          ),
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Fuel UR Way',
          routerConfig: router,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
        ));
  }
}
