import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/Models/AppConstants.dart';
import 'package:hotel_app/Models/messagingObjects.dart';
import 'package:hotel_app/Views/listWidgets.dart';
import 'package:hotel_app/Views/textWidgets.dart';

class ConversationPage extends StatefulWidget {
  static final String routeName = '/ConversationPageRoute';

  final Conversation conversation;

  ConversationPage({this.conversation, Key key}) : super(key: key);

  @override
  _ConversationPageState createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {

  Conversation _conversation;

  @override
  void initState() {
    this._conversation = widget.conversation;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppBarText(text: _conversation.otherContact.getFullName())),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: _conversation.messages.length,
              itemBuilder: (context, index) {
                Message currentMessage = _conversation.messages[index];
                return MessageListTile(message: currentMessage,);
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(
              color: Colors.black,
            )),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 5 / 6,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Escribe tu mensaje',
                      contentPadding: EdgeInsets.all(20.0),
                      border: InputBorder.none,
                    ),
                    minLines: 1,
                    maxLines: 5,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ),
                Expanded(
                  child: MaterialButton(
                    onPressed: () {},
                    child: Text('Enviar'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
