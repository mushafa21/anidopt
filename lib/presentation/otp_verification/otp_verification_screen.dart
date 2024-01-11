import 'dart:async';

import 'package:anidopt/config/router/app_router.dart';
import 'package:anidopt/ui/color.dart';
import 'package:anidopt/ui/type.dart';
import 'package:anidopt/ui/type.dart';
import 'package:anidopt/ui/type.dart';
import 'package:anidopt/ui/type.dart';
import 'package:anidopt/ui/type.dart';
import 'package:anidopt/utility/dialog.dart';
import 'package:anidopt/utility/extensions/int_extensions.dart';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


import '../../config/constant/int_constant.dart';
import '../../ui/dimen.dart';
import 'cubit/otp_verification_cubit.dart';


@RoutePage()
class OtpVerificationScreen extends StatelessWidget {
  final String phoneNumber;
  OtpVerificationScreen({Key? key, required this.phoneNumber}) : super(key: key);


  late OtpVerificationCubit _cubit;
  late AnidoptDialog _dialog;

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => OtpVerificationCubit(),
      child: Builder(
          builder: (context) {
            _cubit = context.read<OtpVerificationCubit>();
            _dialog = AnidoptDialog(context);
            _cubit.verifyPhone(phoneNumber);
            return _buildMainView(context);
          }
      ),
    );
  }


  Widget _buildMainView(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verifikasi OTP",style: smMedium.copyWith(color: textColor),),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            _blocListener(),
            RichText(
              text: TextSpan(
                  text:
                  "Kode verifikasi sudah dikirimkan ke nomor ",
                  style: sRegular.copyWith(color: textColor),
                  children: [
                    TextSpan(
                        text: phoneNumber,
                        style: sMedium.copyWith(color: primaryColor))
                  ]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: spacing4,),
            _buildOtpView(context),
            SizedBox(height: spacing4,),
            OtpVerificationCountDown(onResend: () {
              _cubit.verifyPhone(phoneNumber);
            },)
          ],
        ),
      ),
    );
  }

  Widget _blocListener() {
    return BlocListener<OtpVerificationCubit, OtpVerificationState>(
      listener: (context, state) {
        if(state is OtpVerificationStateLoading){
          _dialog.showLoading();
        }else if (state is OtpVerificationStateError) {
          _dialog.dismiss();
          _dialog.error(message: state.message);
        } else if (state is OtpVerificationStateRegistered) {
          _dialog.dismiss();
          context.router.replaceAll([HomeNavigationRoute()]);

        } else if(state is OtpVerificationStateNotRegistered){
          _dialog.dismiss();
          context.router.replaceAll([RegisterFormRoute(uid: state.uid, phoneNumber: phoneNumber)]);
        }
      },
      child: Container(),
    );
  }


  Widget _buildOtpView(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        child: PinCodeTextField(
          textStyle: smMedium.copyWith(color: whiteColor),
          appContext: context,
          length: 6,
          blinkWhenObscuring: true,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
              fieldOuterPadding: EdgeInsets.only(right: spacing3),
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(radiusS),
              fieldHeight: 60,
              fieldWidth: 40,
              selectedColor: primaryColor,
              selectedFillColor: primaryColor,
              inactiveColor: gray5Color,
              inactiveFillColor: gray5Color,
              activeColor: primaryColor,
              activeFillColor: primaryColor),
          cursorColor: Colors.white,
          animationDuration: Duration(milliseconds: 300),
          enableActiveFill: true,
          keyboardType: TextInputType.number,

          onCompleted: (pin) async {
            _cubit.verifyCode(phoneNumber, pin);
          },

          onChanged: (value) {

          },
          beforeTextPaste: (text) {
            //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
            //but you can show anything you want here, like your pop up saying wrong paste format or etc
            return true;
          },
        ),
      ),
    );
  }

}

class OtpVerificationCountDown extends StatefulWidget {
  final Function() onResend;

  const OtpVerificationCountDown({super.key, required this.onResend});

  @override
  State<OtpVerificationCountDown> createState() =>
      _OtpVerificationCountDownState();
}

class _OtpVerificationCountDownState extends State<OtpVerificationCountDown> {
  bool _resend = false;
  Timer? _countdownTimer;
  Duration _duration = Duration(seconds: otpVerificationDurationInSeconds);

  /// Timer related methods ///
  void startTimer() {
    _countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void stopTimer() {
    _countdownTimer!.cancel();
    setState(() {});
  }

  void resetTimer() {
    stopTimer();
    _resend = false;
    _duration = Duration(seconds: otpVerificationDurationInSeconds);
    startTimer();
    setState(() {});
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    final secondsA = _duration.inSeconds - reduceSecondsBy;
    if (secondsA < 0) {
      _countdownTimer!.cancel();
      _resend = true;
    } else {
      _duration = Duration(seconds: secondsA);
    }

    setState(() {});
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return _resend
        ? Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Waktu kamu habis ",
          style: sRegular,
        ),
        InkWell(
            onTap: () {
              widget.onResend();
              resetTimer();
            },
            child: Text(
              "Kirim ulang kode",
              style: sRegular.copyWith(color: primaryColor),
            )),
      ],
    )
        : Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Waktu kamu tinggal ",
          style: sRegular,
        ),
        Text(
          _duration.inSeconds.secondsToMmSsFormat(),
          style: sRegular.copyWith(color: primaryColor),
        ),
        Text(
          " detik lagi",
          style: sRegular,
        ),
      ],
    );
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    super.dispose();
  }
}
