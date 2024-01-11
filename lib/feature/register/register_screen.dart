import 'package:anidopt/utility/extensions/build_context_extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../config/router/app_router.dart';
import '../../ui/color.dart';
import '../../ui/dimen.dart';
import '../../ui/type.dart';


@RoutePage()
class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final TextEditingController _phoneNumberController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return _buildMainView(context);
  }

  Widget _buildMainView(BuildContext context){
    return Scaffold(
      appBar: AppBar(
      ),
      body: SafeArea(
        child: Stack(
          children: [
            // Positioned(
            //     left: 0,
            //     right: 0,
            //     bottom: 0,
            //     child: Image.asset("assets/images/img_bg_login.png",fit: BoxFit.cover,)),
            Padding(
              padding:  EdgeInsets.symmetric(vertical: context.getScreenMargin(),horizontal: context.getScreenMargin()),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Daftar",style: lBold,),
                  SizedBox(height: spacing2,),
                  Text("Masukkan nomor telepon anda untuk mendaftarkan akun anda",style: xsRegular,),
                  SizedBox(height: spacing4,),
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
                      Text("Sudah memiliki akun? ",style: xsRegular,),
                      TextButton(onPressed: (){
                        context.router.pop();
                      }, child: Text("Login"))
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
