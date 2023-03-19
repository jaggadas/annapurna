import 'dart:convert';

import 'package:annapurna/utils/apiresponse.dart';
import 'package:annapurna/utils/colors.dart';
import 'package:flutter/material.dart';

import '../utils/random.dart';


class CustomerSupport extends StatefulWidget {
  CustomerSupport({Key? key}) : super(key: key);

  @override
  State<CustomerSupport> createState() => _CustomerSupportState();
}

class _CustomerSupportState extends State<CustomerSupport> {
  List<MessageBubble> messageList = [];

  var messageTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: kRed  ,title: Text('AivaChat Support'),),
      backgroundColor: kGrey,
      body:StatefulBuilder(builder: (BuildContext context, StateSetter setStatee){ return SingleChildScrollView(
        child: Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(height: MediaQuery.of(context).size.height/1.25,
            child: ListView.builder(reverse: true,shrinkWrap: true,
                itemCount:messageList.length,itemBuilder: (BuildContext context, int index){return messageList[messageList.length-1-index];}
            ),
          ),
          Container(
          decoration: kMessageContainerDecoration,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: TextField(style: TextStyle(color: Colors.white),
                  controller: messageTextController,
                  onChanged: (value) {
                    //Do something with the user input.

                  },
                  decoration: kMessageTextFieldDecoration,
                ),
              ),
              TextButton(
                onPressed: () async {
                  if(messageTextController.text!="") {
                    setState(() {});

                    setState(() {
                      messageList.add(MessageBubble(
                        messageText: messageTextController.text,
                        messageSender: "You",
                        isMe: true,));
                    });
                    setStatee((){});
                    setState(() {
                      print(messageList.length);
                    });
                    var output = await ApiResponse().apiCall(messageTextController.text);
                    print(output);
                    Map<String, dynamic> jsonMap = jsonDecode(output);
                    messageList.add(MessageBubble(messageText:jsonMap["res"],messageSender: 'AivaChat',isMe: false,));
                  }
                  setState(() {

                  });
                  setStatee(() {

                  });
                  messageTextController.clear();

                },
                child: Text(
                  'Send',
                  style: kSendButtonTextStyle,
                ),
              ),
            ],
          ),
        ),],
    ),
      );},));
  }
}
class MessageBubble extends StatelessWidget {
  final messageText;
  final messageSender;
  final isMe;
  MessageBubble({this.messageText, this.messageSender, this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: isMe?CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Text(
            messageSender,
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
          Material(
              color: isMe?kRed:kGreyAccent,
              borderRadius: BorderRadius.only(
                  topLeft: isMe?Radius.circular(30):Radius.circular(0),
                  topRight: isMe?Radius.circular(0):Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              elevation: 5,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  '$messageText',
                  style: TextStyle(color: isMe?Colors.white:Colors.white, fontSize: 15),
                ),
              )),
        ],
      ),
    );
  }
}
