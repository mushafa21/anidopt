import 'package:anidopt/ui/color.dart';
import 'package:anidopt/ui/type.dart';
import 'package:anidopt/utility/extensions/build_context_extensions.dart';
import 'package:anidopt/utility/permision_handler.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import '../../config/cache_store.dart';
import '../../config/locator.dart';
import '../../config/router/app_router.dart';
import '../../ui/dimen.dart';

@RoutePage()
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);


  askLocationPermission(BuildContext context) async{
    final permission = await PermissionHandler().askPermission(permissions: [
      PermissionType.location
    ]);
    if(permission[PermissionType.location] == false || permission[PermissionType.location] == null){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Silahkan berikan izin aplikasi untuk melanjutkan")));
      askLocationPermission(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnBoardingSlider(
        controllerColor: primaryColor,
        headerBackgroundColor: whiteColor,
        finishButtonText: 'Mulai',
        finishButtonTextStyle: smMedium.copyWith(color: whiteColor),
        finishButtonStyle: FinishButtonStyle(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusXl))
        ),
        onFinish: (){
          locator.get<CacheStore>().first = false;
          context.router.replaceAll([LoginRoute()]);
        },

        background: [
          Container(),
          Container(),
          Container(),
          Container(),


        ],
        totalPage: 4,
        speed: 1.8,
        pageBodies: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: context.getScreenMargin()),
            child: Column(
              children: <Widget>[
                Image.asset('assets/images/img_onboarding1.jpg'),

                SizedBox(
                  height: spacing5,
                ),
                Text("Selamat Datang di Anidopt: Temukan Kasih Sayang bersama Hewan!",style: smBold,textAlign: TextAlign.center,),
                SizedBox(height: spacing5,),
                Text("Selamat datang di Anidopt, aplikasi yang dirancang khusus untuk memudahkan Anda dalam mengadopsi hewan peliharaan dan menjaga keamanan mereka. Mari bersama-sama menjalani perjalanan penuh kasih sayang dengan hewan kesayangan kita!",textAlign: TextAlign.center,),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: context.getScreenMargin()),
            child: Column(
              children: <Widget>[
                Image.asset('assets/images/img_onboarding2.jpg'),

                SizedBox(
                  height: spacing5,
                ),
                Text("Mudahnya Mengadopsi dan Memberikan Cinta Melalui Anidopt!",style: smBold,textAlign: TextAlign.center,),
                SizedBox(height: spacing5,),
                Text("Anidopt mempersembahkan pengalaman mengadopsi hewan yang tak terlupakan. Temukan teman sejati Anda di antara ribuan hewan yang mencari rumah baru. Nikmati kemudahan mencari hewan yang hilang dan berbagi kasih sayang melalui platform kami. Ayo, mari kita mulai petualangan bersama Anidopt!",textAlign: TextAlign.center,),
              ],
            ),
          ),

          Builder(
            builder: (context) {
              askLocationPermission(context);
              return Container(
                padding: EdgeInsets.symmetric(horizontal: context.getScreenMargin()),
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/images/img_onboarding3.jpg'),

                    SizedBox(
                      height: spacing5,
                    ),
                    Text("Berikan Izin Lokasi untuk Pengalaman Terbaik dengan Anidopt!",style: smBold,textAlign: TextAlign.center,),
                    SizedBox(height: spacing5,),
                    Text(" Berikan izin lokasi untuk pengalaman terbaik! Ini membantu kami menyesuaikan pencarian hewan di sekitar Anda, memberikan pengalaman adopsi yang lebih lokal dan personal.",textAlign: TextAlign.center,),
                  ],
                ),
              );
            }
          ),

          Container(
            padding: EdgeInsets.symmetric(horizontal: context.getScreenMargin()),
            child: Column(
              children: <Widget>[
                Image.asset('assets/images/img_onboarding4.jpg'),

                SizedBox(
                  height: spacing5,
                ),
                Text("Temukan Lebih Banyak tentang Hewan Kesayangan Anda di Anidopt!",style: smBold,textAlign: TextAlign.center,),
                SizedBox(height: spacing5,),
                Text("Temukan lebih banyak tentang hewan peliharaan Anda di Anidopt. Akses informasi pet shelter dan dokter hewan terdekat untuk memastikan kesejahteraan dan kebahagiaan teman empat kaki Anda.",textAlign: TextAlign.center,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
