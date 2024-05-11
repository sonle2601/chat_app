import 'dart:io';

import 'package:chat_app/common/enums/message_enum.dart';
import 'package:chat_app/common/utils/utils.dart';
import 'package:chat_app/features/chat/controller/chat_controller.dart';
import 'package:chat_app/models/message.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../colors.dart';

class BottomChatField extends ConsumerStatefulWidget {
  final String recieverUserId;
  const BottomChatField( {
    super.key,
    required this.recieverUserId,
  });

  @override
  ConsumerState<BottomChatField> createState() => _BottomChatFieldState();
}

class _BottomChatFieldState extends ConsumerState<BottomChatField> {
  bool isShowSendButton = false;
  final TextEditingController _messageController = TextEditingController();
  bool isShowEmojiContainer = false;


  void sendTextMessage() async{
    if(isShowSendButton){
      ref.read(chatControllerProvider)
          .sendTextMessage(
          context,
          _messageController.text,
          widget.recieverUserId
      );
      setState(() {
        _messageController.text = '';
      });
    }
  }

  void sendFileMessage(File file, MessageEnum messageEnum){
    ref.read(chatControllerProvider).sendFileMessage(
        context,
        file,
        widget.recieverUserId,
        messageEnum);
  }

  void selectImage() async{
    File? image = await pickImageFromGallery(context);
    if(image!= null){
      sendFileMessage(image, MessageEnum.image);
    }
  }

  void selectVideo() async{
    File? video = await pickVideoFromGallery(context);
    if(video!= null){
      sendFileMessage(video, MessageEnum.video);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _messageController,
                onChanged: (val){
                  if(val.isNotEmpty){
                    setState(() {
                      isShowSendButton = true;
                    });
                  }else{
                    setState(() {
                      isShowSendButton = false;
                    });
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: mobileChatBoxColor,
                  prefixIcon:  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: SizedBox(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {

                            },
                              icon: Icon(
                                Icons.emoji_emotions,
                                color: Colors.grey,)
                          ),
                          IconButton(
                              onPressed: (){

                              },
                              icon: Icon(
                                Icons.gif_box,
                                color: Colors.grey,)
                          ),
                        ],
                      ),
                    ),
                  ),
                  suffixIcon: SizedBox(
                    width: 130,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children:  [
                          IconButton(
                              icon: Icon(
                                Icons.camera_alt,
                                color: Colors.grey,
                              ), onPressed: () {
                                selectImage();
                              },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.attach_file,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              selectVideo();
                            },),
                        ],
                      ),
                    ),
                  ),
                  hintText: 'Type a message!',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 8,
                right: 2,
                left: 2
              ),
              child: CircleAvatar(
                backgroundColor: const Color(0xFF128c73),
                radius: 25,
                child: GestureDetector(
                  onTap: (){
                    sendTextMessage();
                  },
                  child: Icon(
                      isShowSendButton ? Icons.send : Icons.mic,
                      color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 310,
              child: EmojiPicker(
                onEmojiSelected: ((category, emoji){
                  _messageController.text = _messageController.text + emoji.emoji;
                }),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
