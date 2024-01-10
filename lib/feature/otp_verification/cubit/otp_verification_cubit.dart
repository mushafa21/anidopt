import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'otp_verification_state.dart';

class OtpVerificationCubit extends Cubit<OtpVerificationState> {
  OtpVerificationCubit() : super(OtpVerificationStateInitial());
}
