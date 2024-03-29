


import 'dart:io';

import 'package:anidopt/utility/extensions/build_context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map_location_picker/flutter_map_location_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../../../config/cache_store.dart';
import '../../../../config/enum/post_type.dart';
import '../../../../config/locator.dart';
import '../../../../model/post_model.dart';
import '../../../../ui/color.dart';
import '../../../../ui/dimen.dart';
import '../../../../ui/type.dart';
import '../../../../utility/location_util.dart';
import '../../../../utility/media_picker.dart';
import '../../../../utility/picker/location_picker.dart';
import '../../../widgets/circle_image_view.dart';
import '../../../widgets/image_type_sheet.dart';

class CreatePostFound extends StatefulWidget {
  final Function(PostModel, File) onCreateButtonClicked;

  const CreatePostFound({Key? key, required this.onCreateButtonClicked})
      : super(key: key);

  @override
  State<CreatePostFound> createState() => _CreatePostFoundState();
}

class _CreatePostFoundState extends State<CreatePostFound> {
  final _formKey = GlobalKey<FormState>();
  File? imageFile;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _captionController = TextEditingController();
  final TextEditingController _speciesController = TextEditingController();
  String? address;
  double? latitude;
  double? longitude;

  getInitialLocation() async {
    final location = await getCurrentLocation();
    latitude = location?.latitude;
    longitude = location?.longitude;
    if (latitude != null && longitude != null) {
      address = await getLocationName(latitude!, longitude!);
    }
    setState(() {});
  }

  pickLocation() async {
    print("PICK LOCATIOn");
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return MapLocationPicker(
              initialLocation: latitude != null && longitude != null
                  ? LatLng(latitude!, longitude!)
                  : LatLng(-6.200000, 106.816666),
              onPicked: (result) {
                Navigator.pop(context);
                address = result.address;
                latitude = result.latitude;
                longitude = result.longitude;
                setState(() {});
              });
        });
  }

  @override
  void initState() {
    super.initState();
    getInitialLocation();
  }

  @override
  void dispose() {
    super.dispose();
  }

  pickImage(bool camera) async {
    final File? pickedImage = await MediaPicker().pickImage(camera: camera);
    if(pickedImage != null){
      imageFile = pickedImage;
      setState(() {
      });
    }
  }

  showImageChoicesSheet(BuildContext context) {
    showMaterialModalBottomSheet(
        context: context,
        builder: (context) {
          return ImageTypeSheet(onSelectCamera: () {
            pickImage(true);
          }, onSelectGalery: () {
            pickImage(false);
          });
        });
  }

  @override
  Widget build(BuildContext context) {

    final user = locator.get<CacheStore>().user;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.getScreenMargin(),vertical: context.getScreenMargin()),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleImageView(url: "",radius: radiusXxl,),
                  SizedBox(width: spacing4,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.name ?? "-",style: smMedium,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: spacing3,vertical: spacing1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radiusXl),
                          color: secondaryColor,
                        ),
                        child: Text("Ditemukan",style: xsMedium.copyWith(color: whiteColor),),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: spacing5,),
              Center(
                child: GestureDetector(
                  onTap: (){
                    showImageChoicesSheet(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: gray6Color
                    ),
                    width: 220,
                    height: 220,
                    child: imageFile == null ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.camera,size: 50,color: whiteColor,),
                        SizedBox(height: spacing3,),
                        Text("Unggah Foto Disini",style: smSemiBold.copyWith(color: whiteColor),),

                      ],
                    ) : Image.file(imageFile!,width: 200,height: 200, fit: BoxFit.cover,) ,

                  ),
                ),
              ),
              SizedBox(height: spacing5,),
              Text("Nama Hewan",style: xsRegular,),
              SizedBox(height: spacing3,),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _nameController,
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return "Silahkan masukan nama hewan";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: "Bony, Kitty, Grey ...",
                    prefixIconConstraints: BoxConstraints()),
              ),

              SizedBox(height: spacing5,),
              Text("Spesies Hewan",style: xsRegular,),
              SizedBox(height: spacing3,),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _speciesController,
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return "Silahkan masukan nama spesies hewan";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: "Kucing Anggora, Beagle ...",
                    prefixIconConstraints: BoxConstraints()),
              ),

              SizedBox(height: spacing5,),
              Text("Keterangan",style: xsRegular,),
              SizedBox(height: spacing3,),
              TextFormField(
                minLines: 3,
                maxLines: 5,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: _captionController,
                validator: (value) {
                  if (value?.isEmpty == true) {
                    return "Silahkan masukan keterangan";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    hintText: "Ciri-ciri, Personality, Makanan kesukaan",
                    prefixIconConstraints: BoxConstraints()),
              ),

              SizedBox(height: spacing5,),
              Text("Lokasi Hewan Ditemukan",style: xsRegular,),
              SizedBox(height: spacing3,),
              GestureDetector(
                onTap: () {
                  pickLocation();
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: spacing5,
                    vertical: spacing5,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: gray9Color),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.locationDot,
                        size: 14,
                      ),
                      SizedBox(
                        width: spacing3,
                      ),
                      Expanded(
                          child: Text(
                            address ?? "Pilih lokasi anda",
                            style: sRegular,
                          ))
                    ],
                  ),
                ),
              ),


              SizedBox(height: spacing9,),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {
                      if (imageFile == null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Silahkan upload gambar hewan")));
                      } else if (latitude == null || longitude == null || address == null) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Silahkan pilih lokasi")));
                      } else if (_formKey.currentState?.validate() == false) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Silahkan lengkapi form")));
                      }  else {
                        widget.onCreateButtonClicked(
                            PostModel()
                              ..name = _nameController.text
                              ..species = _speciesController.text
                              ..caption = _captionController.text
                              ..latitude = latitude
                              ..longitude = longitude
                              ..address = address
                              ..type = PostType.found.value,
                            imageFile!);
                      }
                    },
                    child: Text("Unggah Postingan")),
              )
            ],
          ),
        ),
      ),
    );
  }
}