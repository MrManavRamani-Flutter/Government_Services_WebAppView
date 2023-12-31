import 'package:flutter/material.dart';
import 'package:gov_services_app/modules/provider/connectivity_provider.dart';
import 'package:gov_services_app/modules/provider/goverment_service_provider.dart';
import 'package:gov_services_app/modules/view/home_page/provider/web_provider.dart';
import 'package:gov_services_app/modules/view/home_page/screen/web_page.dart';
import 'package:gov_services_app/modules/view/home_page/screen/home_page.dart';
import 'package:gov_services_app/modules/view/home_page/welcome_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ConnectivityProvider()),
        ChangeNotifierProvider(create: (context) => GovermentServiceProvider()),
        ChangeNotifierProvider(create: (context) => WebProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: 'welcome',
        routes: {
          '/': (context) => const HomePage(),
          'welcome': (context) => const WelcomeScreen(),
          'webPage': (context) => const DetailPage(),
        },
      ),
    );
  }
}
