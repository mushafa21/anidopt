import 'package:anidopt/config/locator.dart';
import 'package:anidopt/repository/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../firebase/firebase_phone_auth.dart';
import '../../../config/cache_store.dart';

part 'otp_verification_state.dart';

class OtpVerificationCubit extends Cubit<OtpVerificationState> {
  final UserRepository _userRepository = UserRepository();
  final FirebasePhoneAuth _firebasePhoneAuth = FirebasePhoneAuth();
  final CacheStore _cacheStore = locator.get();

  OtpVerificationCubit() : super(OtpVerificationStateInitial());

  verifyPhone(String phone) async {
    await _firebasePhoneAuth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (uid) {
        checkUser(uid);
      },
      verificationFailed: (message) {
        emit(OtpVerificationStateError(message));
        return;
      },
      codeSent: () {
        // nothing
      },
      onVerifying: () {
        emit(OtpVerificationStateLoading());
      },
    );
  }

  verifyCode(String phone, String code) async {
    emit(OtpVerificationStateLoading());
    try {
      String uid = await _firebasePhoneAuth.signInWithSmsCode(code);
      checkUser(uid);
    } catch (e) {
      emit(OtpVerificationStateError(e.toString()));
    }
  }

  checkUser(String uid) async {
    try {
      final user = await _userRepository.getUser(uid);
      if (user != null) {
        _cacheStore.user = user;
        _cacheStore.isLogin = true;
        emit(OtpVerificationStateRegistered());
      } else {
        emit(OtpVerificationStateNotRegistered(uid));
      }
    } catch (e) {
      emit(OtpVerificationStateError(e.toString()));
    }
  }
}
