import 'dart:io';

import 'package:anidopt/config/enum/post_type.dart';

import 'package:anidopt/presentation/post/create_post/cubit/create_post_cubit.dart';
import 'package:anidopt/presentation/post/create_post/widget/create_post_found.dart';
import 'package:anidopt/presentation/post/create_post/widget/create_post_missing.dart';
import 'package:anidopt/presentation/post/create_post/widget/create_post_open_adopt.dart';

import 'package:anidopt/ui/color.dart';
import 'package:anidopt/ui/type.dart';
import 'package:anidopt/utility/dialog.dart';
import 'package:anidopt/utility/extensions/build_context_extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../ui/dimen.dart';
import '../../../utility/media_picker.dart';



@RoutePage()
class CreateReportScreen extends StatelessWidget {

  CreateReportScreen({Key? key,}) : super(key: key);

  late AnidoptDialog _dialog;

  @override
  Widget build(BuildContext context) {
    _dialog = AnidoptDialog(context);
    return _buildMainView(context);

  }

  Widget _buildMainView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Buat Laporan",
          style: smMedium.copyWith(color: textColor),
        ),
      ),
      body: SafeArea(
          child: CreateReportForm(onCreateButtonClicked: (){
            _dialog.success(message: "Berhasil membuat laporan",exit: true);
          })),
    );
  }
}


class CreateReportForm extends StatefulWidget {
  final Function() onCreateButtonClicked;

  const CreateReportForm({Key? key, required this.onCreateButtonClicked})
      : super(key: key);

  @override
  State<CreateReportForm> createState() => _CreateReportFormState();
}

class _CreateReportFormState extends State<CreateReportForm> {
  final _formKey = GlobalKey<FormState>();
  File? imageFile;
  final TextEditingController _captionController = TextEditingController();



  @override
  void dispose() {
    super.dispose();
  }

  pickImage() async {
    final File? pickedImage = await MediaPicker().pickImage(camera: true);
    if(pickedImage != null){
      imageFile = pickedImage;
      setState(() {
      });
    }
  }



  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.getScreenMargin(),vertical: context.getScreenMargin()),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: GestureDetector(
                  onTap: (){
                    pickImage();
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
              Text("Caption",style: xsRegular,),
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
                    hintText: "Kondisi hewan saat ini",
                    prefixIconConstraints: BoxConstraints()),
              ),




              SizedBox(height: spacing9,),
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                    onPressed: () {
                      widget.onCreateButtonClicked();
                    },
                    child: Text("Unggah Laporan")),
              )
            ],
          ),
        ),
      ),
    );
  }
}

