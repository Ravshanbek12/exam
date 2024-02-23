import 'package:exam/feature/splash/splash_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices services = SplashServices();

@override
  void initState() {
    services.isLogin(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF131524),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 229,),
            Center(
              child: Image.asset("assets/images/logo.png"),
            ),
            SizedBox(height: 12,),
            Text("Productive",style: TextStyle(fontSize: 40,fontWeight: FontWeight.w700,color: Colors.white),),
          ],
        ),
      ),
    );
  }
}




