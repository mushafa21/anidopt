part of 'otp_verification_cubit.dart';

sealed class OtpVerificationState {
  const OtpVerificationState();
}

class OtpVerificationStateInitial extends OtpVerificationState {

}

class OtpVerificationStateLoading extends OtpVerificationState {

}

class OtpVerificationStateError extends OtpVerificationState {
  final String message;
  const OtpVerificationStateError(this.message);

}



class OtpVerificationStateRegistered extends OtpVerificationState {

}

class OtpVerificationStateNotRegistered extends OtpVerificationState {
  final String uid;
  OtpVerificationStateNotRegistered(this.uid);
}

