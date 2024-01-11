import 'package:firebase_auth/firebase_auth.dart';

class FirebasePhoneAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String? _verificationId;
  // ignore: unused_field
  int? _resendToken;

  Future<void> verifyPhoneNumber({
    required String phoneNumber,
    required Function(String uid) verificationCompleted,
    required Function(String message) verificationFailed,
    required Function() codeSent,
    required Function() onVerifying,

  }) async {
    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // in android
        onVerifying();
        UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);
        String uid = userCredential.user?.uid ?? '';
        if (uid.isEmpty) {
          verificationFailed('User id is empty');
        } else {
          verificationCompleted(uid);
        }
      },
      verificationFailed: (error) {
        verificationFailed(error.message ?? 'Unknown error');
      },
      codeSent: (String verificationId, int? resendToken) {
        _verificationId = verificationId;
        _resendToken = resendToken;
        codeSent();
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        _verificationId = verificationId;
      },
      timeout: const Duration(seconds: 120),
    );
  }

  // return uid
  Future<String> signInWithSmsCode(String smsCode) async {
    AuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _verificationId ?? '',
      smsCode: smsCode,
    );

    UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);

    return userCredential.user?.uid ?? '';
  }
}