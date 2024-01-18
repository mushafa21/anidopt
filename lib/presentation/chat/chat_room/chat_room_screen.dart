import 'dart:async';

import 'package:anidopt/utility/extensions/build_context_extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';

import '../../../ui/color.dart';
import '../../../ui/dimen.dart';
import '../../../ui/type.dart';
import '../../widgets/circle_image_view.dart';
import '../widget/item_chat_bubble.dart';



@RoutePage()
class ChatRoomScreen extends StatefulWidget {
  ChatRoomScreen({Key? key}) : super(key: key);

  @override
  State<ChatRoomScreen> createState() => _ChatRoomScreenState();
}

class _ChatRoomScreenState extends State<ChatRoomScreen> {
  bool isMine = true;
  late Timer timer;
  final TextEditingController _chatController = TextEditingController();
  List<Widget> chats = [];

  addChat(Widget widget){
    chats.add(widget);
    _chatController.clear();
    setState(() {
    });
    timer = Timer(Duration(seconds: 2), () {
      chats.add(ItemChatBubble(isMine: false, message: "kondisinya sehat kak"));
      setState(() {
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children:  [
            CircleImageView(
              radius: 12,
              url: "",
            ),
            SizedBox(
              width: spacing3,
            ),
            Text("Mushafa Fadzan Andira",style: smMedium.copyWith(color: textColor),),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.getScreenMargin(),
          vertical: context.getScreenMargin(),
        ),
        child: Column(
          children: [
            Expanded(child: _itemChatByDate(context)),
            Padding(
              padding: const EdgeInsets.only(top: spacing3),
              child: _messageBar(),
            ),

            // const _MessageBar(),
          ],
        ),
      ),
    );
  }

  Widget _itemDateChat(BuildContext context) {
    return Container(
      padding:
      const EdgeInsets.symmetric(horizontal: spacing3, vertical: spacing2),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radiusXl),
          color: gray11Color,
          border: Border.all(color: gray10Color, width: 1)),
      child: Text(
        "Status",
        style: xxsRegular,
      ),
    );
  }

  Widget _itemChatByDate(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: chats,
      ),
    );
  }

  Widget _messageBar() {
    return TextField(
      textInputAction: TextInputAction.newline,
      controller: _chatController,
      minLines: 1,
      maxLines: 5,
      decoration: InputDecoration(
        fillColor: primaryContainerColor,
        filled: true,
        suffixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing4),
          child: IconButton(
            onPressed: (){
              addChat(ItemChatBubble(isMine: true, message: _chatController.text));
            },
            icon: SvgPicture.asset(
              "assets/images/ic_send_comment.svg",
              width: 16,
              height: 16,
            ),
          ),
        ),
        suffixIconConstraints: const BoxConstraints(),
        hintText: "Tulis Pesan..",
        hintStyle: sRegular.copyWith(color: gray7Color),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: gray9Color),
        ),
      ),
    );
  }
}
