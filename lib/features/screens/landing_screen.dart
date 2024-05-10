import 'package:chat_app/colors.dart';
import 'package:chat_app/common/widgets/custom_button.dart';
import 'package:chat_app/features/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  void navigateToLoginScreen(BuildContext context){
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50,),
              const Text(
                  'Welcome to AppChat',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 33
                  ),
              ),
              SizedBox(
                height: size.height/9,
              ),
              Image.asset(
                  'assets/bg.png',
                  height: 340,
                  width: 340,
              ),
              SizedBox(
                height: size.height/9,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                    'Read our Privacy Policy. Tap "Agree and continue" to acess',
                  style: TextStyle(
                    color: greyColor
                  ),
                ),
              ),
              SizedBox(height: 10,),
              SizedBox(
                width: size.width*0.75,
                child: CustomButoon(text: 'AGREE AND CONTINUE', 
                onPressed: () => navigateToLoginScreen(context)
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
