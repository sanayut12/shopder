import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopder/MainScreen/subScreen/Secondary/subChatScreen/chatBox/listimage/ChatBox_ListImageComponent.dart';
import 'package:shopder/function/dataManagement/dataShopInfo.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectChatCenter.dart';
import 'package:shopder/function/http/ClassObjects/httpObjectChatCenterImage.dart';
import 'package:shopder/function/http/httpChatCenter.dart';
import 'package:shopder/function/http/httpChatCenterImage.dart';
import 'package:shopder/module/imageProcressing.dart';
import 'package:shopder/module/uploadImage.dart';

class Chat_BottomComponent extends StatefulWidget {
  String chatmanager_id, user_id;
  Chat_BottomComponent({@required this.chatmanager_id, @required this.user_id});
  @override
  _Chat_BottomComponentState createState() => _Chat_BottomComponentState();
}

class _Chat_BottomComponentState extends State<Chat_BottomComponent> {
  String message = "";
  List<Uint8List> bufferImage = [];
  ScrollController controller = ScrollController();
  @override
  Widget build(BuildContext context) {
    // Widget SendButton
    Widget ShowListImage = bufferImage.length == 0
        ? Container()
        : ChatBox_ListImageComponent(
            bufferImage: bufferImage,
            controller: controller,
            fun: DeleteImage,
          );
    return Column(
      children: [
        ShowListImage,
        Container(
          // height: 55,
          width: double.infinity,
          color: Colors.white,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ButtonModel(
                icon: Icons.image,
                fun: GetImageFromGallery,
              ),
              ButtonModel(
                icon: Icons.more_vert_outlined,
                fun: null,
              ),
              Expanded(
                  child: bufferImage.length != 0
                      ? GestureDetector(
                          onTap: () {
                            setState(() {
                              bufferImage = [];
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text("ยกเลิก"),
                          ))
                      : InputMessage(
                          message: message,
                          SetMessage: SetMessage,
                        )),
              ButtonModel(
                icon: Icons.send,
                fun: OnpressSend,
              )
            ],
          ),
        ),
      ],
    );
  }

  Future<void> InitTrack() {}
  Future<void> SetMessage(String _message) {
    message = _message;
    // print(message);
  }

  Future<void> DeleteImage(int index) {
    bufferImage.removeAt(index);
    setState(() {
      bufferImage;
    });
  }

  Future<void> GetImageFromGallery() async {
    List<Uint8List> _bufferImage = await UploadMultipleImage();
    for (int i = 0; i < _bufferImage.length; i++) {
      if (bufferImage.length <= 9) {
        setState(() {
          bufferImage.add(_bufferImage[i]);
        });
      }
    }
    await Future.delayed(Duration(milliseconds: 50));
    controller.jumpTo(controller.position.maxScrollExtent);
  }

  Future<void> OnpressSend() async {
    String chatmanager_id = this.widget.chatmanager_id;

    String shop_id = ShopInfoMamagement().GetShop_id();
    String user_id = this.widget.user_id;
    String _message = message;

    //ส่งรูปภาพ
    if (bufferImage.isNotEmpty) {
      List<String> bufferImageString =
          await ChangeListByteToBase64(bufferImage);
      setState(() {
        bufferImage = [];
      });
      ChatCenterImageRequest bufferChatCenterImageRequest =
          ChatCenterImageRequest(
              chatmanager_id: chatmanager_id,
              user_id: user_id,
              shop_id: shop_id,
              sender_id: shop_id,
              message: bufferImageString,
              type_chat: "3");
      HttpChatCenterImage(
          bufferChatCenterImageRequest: bufferChatCenterImageRequest);
    } else {
      setState(() {
        message = "";
      });
      ChatCenterRequest dataSend = ChatCenterRequest(
          chatmanager_id: chatmanager_id,
          sender_id: shop_id,
          user_id: user_id,
          shop_id: shop_id,
          message: _message,
          type_chat: "1"); //type_chat ="1" ส่งข้อความ
      ChatCenterResponse bufferChatCenterResponse =
          await HttpChatCenter(bufferChatCenterRequest: dataSend);
    }
    // setState(() {
    //   message = "";
    // });
    // ChatCenterRequest dataSend = ChatCenterRequest(
    //     chatmanager_id: chatmanager_id,
    //     sender_id: shop_id,
    //     user_id: user_id,
    //     shop_id: shop_id,
    //     message: _message,
    //     type_chat: "1"); //type_chat ="1" ส่งข้อความ
    // ChatCenterResponse bufferChatCenterResponse =
    //     await HttpChatCenter(bufferChatCenterRequest: dataSend);
  }
}

class ButtonModel extends StatefulWidget {
  IconData icon;
  Function fun;
  ButtonModel({@required this.icon, @required this.fun});
  @override
  _ButtonModelState createState() => _ButtonModelState();
}

class _ButtonModelState extends State<ButtonModel> {
  Color color = Colors.white;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        setState(() {
          color = Colors.grey[300].withOpacity(0.5);
        });
        await Future.delayed(Duration(milliseconds: 50));
        setState(() {
          color = Colors.white;
        });

        this.widget.fun();
        // await Future.delayed(Duration(milliseconds: 50));
      },
      child: Container(
        height: 55,
        width: 55,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        alignment: Alignment.center,
        child: Icon(
          this.widget.icon,
          size: 40,
          color: Color(0xfffa897b),
        ),
      ),
    );
  }
}

class InputMessage extends StatefulWidget {
  String message;
  final Function SetMessage;
  InputMessage({@required this.message, @required this.SetMessage});
  @override
  _InputMessageState createState() => _InputMessageState();
}

class _InputMessageState extends State<InputMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: TextEditingController(text: this.widget.message),
        onChanged: (e) {
          this.widget.SetMessage(e);
        },
        cursorHeight: 20,
        maxLines: 5,
        minLines: 1,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(top: -10),
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: Colors.red,
                width: 2.0,
              )),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.purple,
              width: 2.0,
            ),
          ),
        ),
      ),
    );
  }
}
