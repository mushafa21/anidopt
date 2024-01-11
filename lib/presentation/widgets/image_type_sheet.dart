import 'package:anidopt/utility/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../ui/dimen.dart';
import '../../ui/type.dart';
import '../../utility/permision_handler.dart';

class ImageTypeSheet extends StatelessWidget {
  final Function() onSelectCamera;
  final Function() onSelectGalery;
  const ImageTypeSheet({Key? key, required this.onSelectCamera, required this.onSelectGalery}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.getScreenMargin(),
        vertical: context.getScreenMargin(),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pop(context);

                },
                child: FaIcon(FontAwesomeIcons.xmark),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "Ambil Gambar",
                    style: smMedium,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: spacing7,
          ),
          GestureDetector(
            onTap: () async {
              final permission = await PermissionHandler()
                  .askPermission(permissions: [PermissionType.camera]);
              if (permission[PermissionType.camera] ?? false) {
                Navigator.pop(context);
                onSelectCamera();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Silahkan beri akses kamera untuk mengambil gambar",
                  ),
                ));
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: spacing5, vertical: spacing3),
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.camera,size: 16,),
                  SizedBox(
                    width: spacing3,
                  ),
                  Text(
                    "Camera",
                    style: sRegular,
                  )
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () async {
              final permission = await PermissionHandler()
                  .askPermission(permissions: [PermissionType.image]);
              if (permission[PermissionType.image] ?? false) {
                Navigator.pop(context);
                onSelectGalery();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Silahkan beri akses galeri untuk memilih gambar"),
                  ),
                );
              }
            },
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: spacing5, vertical: spacing3),
              child: Row(
                children: [
                  FaIcon(FontAwesomeIcons.solidFile,size: 16,),
                  SizedBox(
                    width: spacing3,
                  ),
                  Text(
                    "Galery",
                    style: sRegular,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );

  }
}
