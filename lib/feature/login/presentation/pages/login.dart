import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg_flutter.dart';

import '../bloc/auth_bloc.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final list = [
    'assets/icons/facebook.svg',
    'assets/icons/google.svg',
    'assets/icons/apple.svg'
  ];
  final auth = FirebaseAuth.instance;
  Color colorBack = Colors.white;
  TextEditingController emailCon = TextEditingController();
  TextEditingController passCon = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: Scaffold(
        backgroundColor: Color(0xFF131524),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 67,
                ),
                Center(child: Image.asset("assets/images/logo.png")),
                SizedBox(
                  height: 44,
                ),
                TextField(
                  style: TextStyle(color: Color(0xFFFEFEFE).withOpacity(0.1)),
                  controller: emailCon,
                  decoration: InputDecoration(
                    hintText: "Email",
                    fillColor: Color(0xFF1C233A),
                    filled: true,
                    hintStyle:
                        TextStyle(color: Color(0xFFFEFEFE).withOpacity(0.1)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFF006EE9).withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(16)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFF006EE9).withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(16)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFF006EE9).withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(16)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFF006EE9).withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(16)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFF006EE9).withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(16)),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  style: TextStyle(color: Color(0xFFFEFEFE).withOpacity(0.1)),
                  controller: passCon,
                  decoration: InputDecoration(
                    hintText: "Password",
                    fillColor: Color(0xFF1C233A),
                    filled: true,
                    hintStyle:
                        TextStyle(color: Color(0xFFFEFEFE).withOpacity(0.1)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFF006EE9).withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(16)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFF006EE9).withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(16)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFF006EE9).withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(16)),
                    disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFF006EE9).withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(16)),
                    errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color(0xFF006EE9).withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(16)),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Forgot password?",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF4B7FD6)),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 26,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: backColor(),
                        borderRadius: BorderRadius.circular(8)),
                    height: 48,
                    width: double.infinity,
                    child: BlocBuilder<AuthBloc, AuthState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () {
                            // context.read<AuthBloc>().add(AuthEvent(
                            //     auth: auth,
                            //     email: emailCon.text,
                            //     password: passCon.text));
                          },
                          child: Text("Login"),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(backColor()),
                              elevation: MaterialStateProperty.all(0)),
                        );
                      },
                    )),
                SizedBox(
                  height: 69,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/line.svg",
                    ),
                    Text(
                      "OR",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFFFEFEFE)),
                    ),
                    SvgPicture.asset(
                      "assets/icons/line.svg",
                    ),
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...List.generate(
                        3,
                        (index) => Container(
                              width: 62,
                              height: 48,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Color(0xFF272C38)),
                              child: SvgPicture.asset(
                                list[index],
                                width: 10,
                              ),
                            ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  backColor() {
    if (emailCon.text.isEmpty && passCon.text.isEmpty) {
      return Color(0xFF4B7FD6);
    } else {
      return Color(0xFF006EE9);
    }
  }
}
