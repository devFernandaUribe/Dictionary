import 'package:dictionary/utils/configs/app_routes.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Center(
            child: Column(
              children: [
                Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                      SizedBox(
                        child: Image.asset(
                          scale: 0.4,
                          width: double.infinity,
                          'assets/images/logo.jpeg',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Text('Dictionary',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          )),
                    ])),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100))),
                            backgroundColor:
                                MaterialStateProperty.resolveWith((states) {
                              return Colors.red;
                            }),
                          ),
                          child: const Text(
                            'Create Account',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, AppRoutes.singUp);
                          },
                        ),
                      ),
                      GestureDetector(
                        child: const Text(
                          'Log In',
                        ),
                        onTap: () async {
                          Navigator.pushNamed(context, AppRoutes.login);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
