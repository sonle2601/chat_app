import 'dart:io';

import 'package:chat_app/common/utils/utils.dart';
import 'package:flutter/material.dart';

class UserInformationScreen extends StatefulWidget {
  static const String routeName = '/user-information-screen';
  const UserInformationScreen({super.key});

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
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
                      onPressed: (){},
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
