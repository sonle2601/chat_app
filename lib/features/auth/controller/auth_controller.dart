import 'package:chat_app/features/auth/repository/auth_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = Provider((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthCotroller(authRepository: authRepository);
});

class AuthCotroller {
  final AuthRepository authRepository;

  AuthCotroller({
    required this.authRepository
  });

  void signInWithPhone(BuildContext context, String phoneNumber){
    authRepository.signInWithPhone(context, phoneNumber);
  }
  void verifyOTP(BuildContext context, String verificationId, String userOTP){
    authRepository.verifyOTP(
        context: context,
        verificationId: verificationId,
        userOTP: userOTP);
  }

  void saveUserDataToFirebase(BuildContext context, String name, File? profilePic){

  }
}