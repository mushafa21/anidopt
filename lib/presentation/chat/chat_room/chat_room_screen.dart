import 'package:anidopt/utility/extensions/build_context_extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../ui/color.dart';
import '../../../ui/dimen.dart';
import '../../../ui/type.dart';
import '../../widgets/circle_image_view.dart';
import '../widget/item_chat_bubble.dart';



@RoutePage()
class ChatRoomScreen extends StatelessWidget {
  ChatRoomScreen({Key? key}) : super(key: key);
  bool isMine = true;

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
    return ListView.builder(
      reverse: true,
      itemCount: 100,
      itemBuilder: (context, index) {
        isMine = !isMine;
        return             ItemChatBubble(isMine: isMine, message: 'halo gan',);
      },
      physics: AlwaysScrollableScrollPhysics(),
    );
  }

  Widget _messageBar() {
    return TextField(
      onSubmitted: (value) {},
      decoration: InputDecoration(
        fillColor: primaryContainerColor,
        filled: true,
        suffixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing4),
          child: IconButton(
            onPressed: null,
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
