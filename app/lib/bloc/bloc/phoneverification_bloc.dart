import 'package:app/data_provider/firebase_phone_verifcation_data_provider.dart';
import 'package:app/repository/firbase_phone_verification_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

part 'phoneverification_event.dart';
part 'phoneverification_state.dart';

class PhoneverificationBloc
    extends Bloc<PhoneverificationEvent, PhoneverificationState> {
  final PhoneVerificationRepository verificationRepository;
  PhoneverificationBloc({required this.verificationRepository})
      : super(PhoneverificationInitial());

  @override
  Stream<PhoneverificationState> mapEventToState(
      PhoneverificationEvent event) async* {
    if (event is VerifyPhone) {
      yield* _verifyPhone(event.context, event.phoneNumber, event.routeName, event.verificationType);
    } else if (event is SigninWithCredential) {
      yield* _signinWithCredential(event.credential, event.context, event.routeName);
    } else if (event is Signout) {
      yield* _signOut();
    }
   
  }

  Stream<PhoneverificationState> _verifyPhone(
      BuildContext context, String phoneNumber, String routeName, VerificationType verificationType) async* {
    yield PhoneVerificationLoading();
    try {
      final response =
          await verificationRepository.verifyPhone(phoneNumber, context, routeName,verificationType );
      if (response is String) {
        yield PhoneVerificationSuccess(
            status: PhoneVerificationStatus.unverified,
            verificationId: response);
      } else {
        yield PhoneVerificationError(message: "verification failed");
      }
    } catch (e) {
      yield PhoneVerificationError(message: e.toString());
    }
  }

  Stream<PhoneverificationState> _signinWithCredential(
      PhoneAuthCredential credential, BuildContext context, String routeName) async* {
    yield PhoneVerificationLoading();
    try {
      final response =
          await verificationRepository.siginInWithCredential(credential, context, routeName);
      if (response is PhoneVerificationStatus) {
        yield PhoneVerificationSuccess(
            status: response, verificationId: "null");
      } else {
        yield PhoneVerificationError(message: "Signin failed");
      }
    } catch (e) {
      yield PhoneVerificationError(message: e.toString());
    }
  }

  Stream<PhoneverificationState> _signOut() async* {
    yield PhoneVerificationLoading();
    try {
      await verificationRepository.signout();
      yield PhoneVerificationSuccess(
          status: PhoneVerificationStatus.unverified, verificationId: '');
    } catch (e) {
      yield PhoneVerificationError(message: e.toString());
    }
  }
}
