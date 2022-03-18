import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shamo/pages/sign_in_page.dart';
import 'package:shamo/pages/splash_page.dart';
import 'package:shamo/providers/auth_provider.dart';

import 'pages/home/main_page.dart';
import 'pages/sign_up_page.dart';

void main() => runApp(Shamo());

class Shamo extends StatefulWidget {
  const Shamo({Key? key}) : super(key: key);

  @override
  State<Shamo> createState() => _ShamoState();
}

class _ShamoState extends State<Shamo> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(Duration(seconds: 3), () => Get.toNamed('/sign-in'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => AuthProvider())],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
        },
      ),
    );
  }
}
