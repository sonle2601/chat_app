import 'package:chat_app/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../colors.dart';

class OtpScreen extends ConsumerWidget {
  static const String routeName = '/otp-screen';
  final String verificationId;

  const OtpScreen({super.key, required this.verificationId});

  void verifyOTP(WidgetRef ref, BuildContext context, String userOTP){
    ref.read(authControllerProvider).verifyOTP(
        context,
        verificationId,
        userOTP);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: Text(
            'Verifying your number'
        ),

      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            const Text('We have sent an SMS with a code'),
            SizedBox(
              width: size.width*0.5,
              child: TextField(
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  hintText: '_ _ _ _ _ _',
                  hintStyle: TextStyle(
                    fontSize: 30
                  )
                ),
                keyboardType: TextInputType.number,
                onChanged: (val){
                  if(val.length == 6){
                    print('verifying otp');
                    verifyOTP(ref, context, val.trim());
                  }
                  print('this function was otp');

                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
