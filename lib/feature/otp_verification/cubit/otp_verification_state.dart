part of 'otp_verification_cubit.dart';

sealed class OtpVerificationState {}

class OtpVerificationStateInitial extends OtpVerificationState {}

class OtpVerificationStateLoading extends OtpVerificationState {}

class OtpVerificationStateError extends OtpVerificationState {
  final String message;
  OtpVerificationStateError(this.message);
}


