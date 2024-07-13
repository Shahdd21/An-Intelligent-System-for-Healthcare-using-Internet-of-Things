import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

import '../../RoomsPage/View/rooms_screen.dart';
import 'Widgets/formfield.dart';

class SignUp extends StatelessWidget {
  final Spreadsheet ss;
  const SignUp({super.key,required this.ss});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        backgroundColor: const Color(0xffcaf2f4),
      ),
      backgroundColor: const Color(0xffcaf2f4),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.19),
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff2e001c).withOpacity(0.18),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 20),
                    const SignFormField(
                      hint: 'User Name',
                      type: TextInputType.name,
                      icon1: Icon(
                        Icons.person,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const SignFormField(
                      hint: 'Phone Number',
                      type: TextInputType.phone,
                      icon1: Icon(
                        Icons.phone_android_outlined,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const SignFormField(
                      hint: 'E-Mail',
                      type: TextInputType.emailAddress,
                      icon1: Icon(
                        Icons.mail_outline_outlined,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const SignFormField(
                      hint: 'Password',
                      type: TextInputType.visiblePassword,
                      icon1: Icon(
                        Icons.lock_outline,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const SignFormField(
                      hint: 'Rewrite Password',
                      type: TextInputType.visiblePassword,
                      icon1: Icon(
                        Icons.lock_reset_outlined,
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  RoomScreen(ss: ss,)),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff2e001c), // Background color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(0xffcaf2f4), // Text color
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
