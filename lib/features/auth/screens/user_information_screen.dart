import 'dart:developer';
import 'dart:io';

import 'package:chat_app/common/utils/utils.dart';
import 'package:chat_app/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInformationScreen extends ConsumerStatefulWidget {
  static const String routeName = '/user-information-screen';
  const UserInformationScreen({super.key});

  @override
  ConsumerState<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends ConsumerState<UserInformationScreen> {
  final TextEditingController nameController = TextEditingController();
  File? image;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    nameController.dispose();
  }

  void selectImage() async{
    image = await pickImageFromGallery(context);
    setState(() {
    });
  }

  void storeUserData() async{
    String name = nameController.text;

    if(name.isNotEmpty){
      ref.read(authControllerProvider).saveUserDataToFirebase(
          context,
          name,
          image
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Stack(
                children: [
                  image == null ? CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://www.kindpng.com/picc/m/78-786207_user-avatar-png-user-avatar-icon-png-transparent.png'
                    ),
                    radius: 64,
                  )
                  : CircleAvatar(
                    backgroundImage: FileImage(
                      image!
                    ),
                    radius: 64,
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                        onPressed: (){
                          selectImage();
                        },
                        icon: Icon(Icons.add_a_photo)
                        ),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    width: size.width*0.85,
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'Enter your name'
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: (){
                        storeUserData();
                      },
                      icon: Icon(Icons.done)
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
