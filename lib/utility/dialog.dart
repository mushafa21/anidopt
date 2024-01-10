import 'package:anidopt/ui/color.dart';
import 'package:anidopt/ui/type.dart';
import 'package:anidopt/ui/type.dart';
import 'package:anidopt/ui/type.dart';
import 'package:anidopt/ui/type.dart';
import 'package:anidopt/ui/type.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../ui/dimen.dart';


class AnidoptDialog {
  final BuildContext context;
  bool isShowing = false;

  AnidoptDialog(this.context);

  Future<void> dismiss() async{
    if(isShowing){
      Navigator.of(context,rootNavigator: true).pop();
      isShowing = false;
    }
  }

  showLoading({bool dismissible = false}) {
    isShowing = true;
    showDialog(
        barrierDismissible: dismissible,
        context: context,
        builder: (BuildContext context) {
          return LoadingDialog();
        }).then((value) {
      isShowing = false;
    });
  }




  choice({required String message, bool exit = false, Function()? onExit,String? confirmButtonText,String? cancelButtonText, bool dismissible = true, Function()? onTap,Function()? onTapCancel,String? title,String? asset,bool showLoading = false}) async {
    isShowing = true;
    await showDialog(
        barrierDismissible: dismissible,
        context: context,
        builder: (BuildContext context) {
          return ChoiceDialog(message: message,onTap: onTap,confirmButtonText: confirmButtonText,cancelButtonText: cancelButtonText,onTapCancel: onTapCancel,title: title,asset: asset,);
        }).then((value) {
      isShowing = showLoading;
    });
    if (exit) {
      Navigator.pop(context);
    }
    if(onExit != null){
      onExit();
    }
  }

  success({required String message,String? title, bool exit = false, Function()? onExit,String? confirmButtonText, bool dismissible = true, Function()? onTap,String? asset} ) async {
    isShowing = true;
    await showDialog(
        barrierDismissible: dismissible,
        context: context,
        builder: (BuildContext context) {
          return SuccessDialog(message: message,onTap: onTap,buttonText: confirmButtonText,asset: asset,title: title,);
        }).then((value) {
      isShowing = false;
    });
    if (exit) {
      Navigator.pop(context);
    }
    if(onExit != null){
      onExit();
    }
  }

  message({required String message,String? title, bool exit = false, Function()? onExit,String? confirmButtonText, bool dismissible = true, Function()? onTap,String? asset} ) async {
    isShowing = true;
    await showDialog(
        barrierDismissible: dismissible,
        context: context,
        builder: (BuildContext context) {
          return MessageDialog(message: message,onTap: onTap,buttonText: confirmButtonText,asset: asset,title: title,);
        }).then((value) {
      isShowing = false;
    });
    if (exit) {
      Navigator.pop(context);
    }
    if(onExit != null){
      onExit();
    }
  }


  error({required String message,String? title, bool exit = false, Function()? onExit,String? confirmButtonText, bool dismissible = true, Function()? onTap,String? asset} ) async {
    isShowing = true;
    await showDialog(
        barrierDismissible: dismissible,
        context: context,
        builder: (BuildContext context) {
          return ErrorDialog(message: message,onTap: onTap,buttonText: confirmButtonText,asset: asset,title: title,);
        }).then((value) {
      isShowing = false;
    });
    if (exit) {
      Navigator.pop(context);
    }
    if(onExit != null){
      onExit();
    }
  }

  warning({required String message, bool exit = false, Function()? onExit,String? confirmButtonText,String? cancelButtonText, bool dismissible = true, Function()? onTap,Function()? onTapCancel,String? title,String? asset} ) async {
    isShowing = true;
    await showDialog(
        barrierDismissible: dismissible,
        context: context,
        builder: (BuildContext context) {
          return WarningDialog(message: message,onTap: onTap,confirmButtonText: confirmButtonText,cancelButtonText: cancelButtonText,onTapCancel: onTapCancel,title: title,asset: asset,);
        }).then((value) {
      isShowing = false;
    });
    if (exit) {
      Navigator.pop(context);
    }
    if(onExit != null){
      onExit();
    }
  }
}


class LoadingDialog extends StatelessWidget {
  const LoadingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(radiusM)), //this right here
      child: Container(
        height: 150,
        width: 150,
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Center(
            child: Lottie.asset('assets/animations/loading_lottie.json',width: 150,height: 150,fit: BoxFit.fitHeight),
          ),
        ),
      ),
    );
  }
}



class SuccessDialog extends StatelessWidget {
  final String? title;
  final String message;
  final String? asset;
  final String? buttonText;
  final Function()? onTap;
  const SuccessDialog({super.key, required this.message, this.onTap,  this.title,  this.asset,  this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(20)), //this right here
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(asset ?? "assets/images/img_dialog_success.png",height: 200,),
              SizedBox(height: 15,),
              Text(title ?? "Success",style: xsMedium,textAlign: TextAlign.center,),
              SizedBox(height: 10,),
              Text(message,style: sRegular,textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
                if(onTap != null){
                  onTap!();
                }

              }, child: Text(buttonText ?? "Ok"))
            ],
          ),
        ),
      ),
    );
  }
}

class MessageDialog extends StatelessWidget {
  final String? title;
  final String message;
  final String? asset;
  final String? buttonText;
  final Function()? onTap;
  const MessageDialog({super.key, required this.message, this.onTap,  this.title,  this.asset,  this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(20)), //this right here
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(asset ?? "assets/images/img_dialog_general.png",height: 200,),
              SizedBox(height: 15,),
              Text(title ?? "Success",style: xsMedium,textAlign: TextAlign.center,),
              SizedBox(height: 10,),
              Text(message,style: sRegular,textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                Navigator.pop(context);
                if(onTap != null){
                  onTap!();
                }

              }, child: Text(buttonText ?? "Ok"))
            ],
          ),
        ),
      ),
    );
  }
}



class ErrorDialog extends StatelessWidget {
  final String? title;
  final String message;
  final String? asset;
  final String? buttonText;
  final Function()? onTap;
  const ErrorDialog({super.key, required this.message, this.onTap,  this.title,  this.asset,  this.buttonText});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(20)), //this right here
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  FaIcon(FontAwesomeIcons.circleInfo,size: 16,),
                  SizedBox(width: 10,),
                  Text(title ?? "Oops! Something went wrong",style: xsMedium.copyWith(color: errorColor),textAlign: TextAlign.center,),
                ],
              ),
              SizedBox(height: 15,),
              Image.asset(asset ?? "assets/images/img_dialog_error.png",height: 200,),
              SizedBox(height: 10,),
              Text(message,style: sRegular,textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                  if(onTap != null){
                    onTap!();
                  }

                }, child: Text(buttonText ?? "Close")),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class WarningDialog extends StatelessWidget {
  final String? title;
  final String? asset;
  final String? confirmButtonText;
  final String? cancelButtonText;
  final String message;
  final Function()? onTap;
  final Function()? onTapCancel;
  const WarningDialog({super.key, required this.message, this.onTap,  this.title,  this.asset, this.confirmButtonText, this.cancelButtonText, this.onTapCancel});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(20)), //this right here
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  FaIcon(FontAwesomeIcons.circleInfo,size: 16,),
                  SizedBox(width: 10,),
                  Text(title ?? "Oops! Something went wrong",style: xsMedium.copyWith(color: errorColor),textAlign: TextAlign.center,),
                ],
              ),
              SizedBox(height: 15,),
              Image.asset(asset ?? "assets/images/img_dialog_warning.png",height: 200,),
              SizedBox(height: 10,),
              Text(message,style: sRegular,textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: (){
                        Navigator.pop(context);
                        if(onTapCancel != null){
                          onTapCancel!();
                        }

                      } ,
                      child: Text(cancelButtonText ?? "Cancel",style: sRegular.copyWith(color:errorColor),)),
                  SizedBox(width: 30,),
                  ElevatedButton(onPressed: (){
                    Navigator.pop(context);
                    if(onTap != null){
                      onTap!();
                    }

                  }, child: Text(confirmButtonText ?? "Ok"),),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChoiceDialog extends StatelessWidget {
  final String? title;
  final String? asset;
  final String? confirmButtonText;
  final String? cancelButtonText;
  final String message;
  final Function()? onTap;
  final Function()? onTapCancel;

  const ChoiceDialog({super.key, required this.message, this.onTap, this.confirmButtonText, this.cancelButtonText, this.title, this.asset, this.onTapCancel});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 10),
      shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(20)), //this right here
      child: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title ?? "Confirmation",style: xsMedium,textAlign: TextAlign.center,),
              SizedBox(height: 15,),
              Image.asset(asset ?? "assets/images/img_dialog_choice.png",height: 200,),
              SizedBox(height: 10,),
              Text(message,style: sRegular,textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: (){
                    Navigator.pop(context);
                    if(onTapCancel != null){
                      onTapCancel!();
                    }

                  }, child: Text(cancelButtonText ?? "Cancel",style: smMedium.copyWith(color: errorColor),)),
                  SizedBox(width: 20,),
                  ElevatedButton(onPressed: (){
                    Navigator.pop(context);
                    if(onTap != null){
                      onTap!();
                    }

                  }, child: Text(confirmButtonText ?? "Ok")),

                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
