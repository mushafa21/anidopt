import 'package:anidopt/ui/type.dart';
import 'package:flutter/material.dart';

import '../../../ui/color.dart';
import '../../../ui/dimen.dart';

class ItemChatBubble extends StatelessWidget {
  final String message;
  final bool isMine;
  const ItemChatBubble({
    Key? key,
    required this.isMine, required this.message,
    // required this.message,
    // required this.profile,
  }) : super(key: key);

  // final Message message;
  // final Profile? profile;

  @override
  Widget build(BuildContext context) {
    List<Widget> chatContents = [
      Flexible(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 12,
          ),
          decoration: BoxDecoration(
            color: isMine
                ? primaryContainerColor
                : secondaryColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: isMine
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Text(message),
              const SizedBox(
                height: spacing2,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("16:03",style: xsRegular,),
                  const SizedBox(
                    width: spacing2,
                  ),
                  if (isMine)
                    Icon(
                      Icons.check,
                      size: 12,
                    ),
                ],
              )
            ],
          ),
        ),
      ),
    ];

    if (isMine) {
      chatContents = chatContents.reversed.toList();
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 18),
      child: Row(
        mainAxisAlignment:
        isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: chatContents,
      ),
    );
  }
}