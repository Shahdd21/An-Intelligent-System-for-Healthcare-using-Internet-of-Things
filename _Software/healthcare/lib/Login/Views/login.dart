import 'package:flutter/material.dart';
import 'package:gsheets/src/gsheets.dart';

import '../../RoomsPage/View/rooms_screen.dart';
import '../../signup/View/sign_up.dart';
import 'Widgets/authText.dart';

class LoginScreen extends StatelessWidget {
  final Spreadsheet ss;
  const LoginScreen({super.key, required this.ss});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final isPortrait = screenSize.height > screenSize.width;

    return Scaffold(
      backgroundColor: const Color(0xff2e001c),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: isPortrait ? 30 : 10),
                  child: Center(
                    child: Text(
                      'Welcome Back',
                      style: TextStyle(
                        color: Color(0xff6df1fd),
                        fontSize: isPortrait ? 32 : 24,
                        fontWeight: FontWeight.w800,
                        height: 1.2,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: isPortrait ? 250 : 150,
                  width: isPortrait ? 200 : 120,
                  child: Image.asset(
                    'assets/image/logo 2.png',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: AuthTextFormField(
                      hint: 'UserName', type: TextInputType.name),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: AuthTextFormField(
                      hint: 'Password', type: TextInputType.visiblePassword),
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forget Password?',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                        color: Color(0xffcaf2f4),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  RoomScreen(ss: ss,)),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffcaf2f4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Flexible(
                      child: FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Text(
                          "Don't have an account?",
                          style: TextStyle(
                              color: Color.fromARGB(255, 118, 119, 120),
                              fontSize: 16),
                        ),
                      ),
                    ),
                    Flexible(
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  SignUp(ss: ss,)),
                          );
                        },
                        child: const FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            "Sign up",
                            style: TextStyle(
                              color: Color(0xffcaf2f4),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
