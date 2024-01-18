import 'package:anidopt/presentation/widgets/circle_image_view.dart';
import 'package:anidopt/ui/color.dart';
import 'package:anidopt/ui/dimen.dart';
import 'package:anidopt/ui/type.dart';
import 'package:anidopt/utility/dialog.dart';
import 'package:anidopt/utility/extensions/build_context_extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SelectNewOwnerScreen extends StatefulWidget {
  const SelectNewOwnerScreen({super.key});

  @override
  State<SelectNewOwnerScreen> createState() => _SelectNewOwnerScreenState();
}

class _SelectNewOwnerScreenState extends State<SelectNewOwnerScreen> {
  int? selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Selesaikan Adopsi",
          style: mMedium.copyWith(color: textColor),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: context.getScreenMargin(),
            vertical: context.getScreenMargin()),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  Text(
                    "Pilih user yang menjadi pemilik baru hewan",
                    style: smMedium,
                  ),
                  SizedBox(height: spacing4,),
                  _userItem(
                      avatar:
                          "https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/prince_valerie_damatha_jr.jpeg",
                      index: 0,
                      name: "Prince Valerie Da'matha Jr"),
                  _userItem(
                      avatar:
                          "https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/rajendra_nohan.jpeg",
                      index: 1,
                      name: "Rajendra Nohan"),
                  _userItem(
                      avatar:
                          "https://res.cloudinary.com/startup-grind/image/upload/c_fill,w_250,h_250,g_center/c_fill,dpr_2.0,f_auto,g_center,q_auto:good/v1/gcs/platform-data-dsc/avatars/yohanes_adi_purwaka_LVCO539.jpg",
                      index: 2,
                      name: "YOHANES ADI PURWAKA"),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                  onPressed: () {
                    AnidoptDialog(context)
                        .success(message: "Berhasil menyelesaikan proses adopsi");
                  },
                  child: Text("Selesaikan")),
            )
          ],
        ),
      ),
    );
  }

  Widget _userItem(
      {required String avatar, required int index, required String name}) {
    return GestureDetector(
      onTap: () {
        selected = index;
        setState(() {});
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: spacing3),
        decoration: BoxDecoration(
          border: index == selected ? Border.all(color: successColor) : null,
          color: primaryContainerColor,
        ),
        padding: EdgeInsets.all(spacing2),
        child: ListTile(
            leading: CircleImageView(
              url: avatar,
              radius: 30,
            ),
            title: Text(name)),
      ),
    );
  }
}
