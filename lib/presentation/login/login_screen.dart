import 'package:anidopt/config/router/app_router.dart';
import 'package:anidopt/ui/color.dart';
import 'package:anidopt/ui/dimen.dart';
import 'package:anidopt/ui/type.dart';
import 'package:anidopt/utility/extensions/build_context_extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


@RoutePage()
class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);


  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return _buildMainView(context);
  }


  Widget _buildMainView(BuildContext context){
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Image.asset("assets/images/img_bg_login.png",fit: BoxFit.cover,)),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: context.getScreenMargin(),horizontal: context.getScreenMargin()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Selamat Datang di\nAnidopt",style: lBold,),
                  SizedBox(height: spacing2,),
                  Text("Masukkan nomor telepon anda untuk dapat login",style: xsRegular,),
                  SizedBox(height: spacing9,),
                  Text("Nomor Telepon",style: smBold,),
                  SizedBox(height: spacing3,),
                  TextField(
                    controller: _phoneNumberController,
                    style: smBold,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: spacing3),
                        child: Text("+62",style: mlBold,),
                      ),
                      prefixIconConstraints: BoxConstraints(),
                      hintText: "8xxxxxxxxxxx",
                      filled: true,
                        border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      fillColor: primaryContainerColor
                    ),
                  ),
                  SizedBox(height: spacing9,),
                  SizedBox(
                    width: double.infinity,
                      child: OutlinedButton(onPressed: (){
                        if(_phoneNumberController.text.length < 8){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Silahkan masukan nomor telepon yang valid")));
                        } else{
                          context.router.push(OtpVerificationRoute(phoneNumber: "+62${_phoneNumberController.text}"));
                        }
                      }, child: Text("Login"))),
                  SizedBox(height: spacing5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Tidak memiliki akun? ",style: xsRegular,),
                      TextButton(onPressed: (){
                        context.router.push(RegisterRoute());
                      }, child: Text("Daftar Sekarang"))
                    ],
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
