part of 'phoneverification_bloc.dart';

abstract class PhoneverificationEvent extends Equatable {
  const PhoneverificationEvent();

  @override
  List<Object> get props => [];
}

class VerifyPhone extends PhoneverificationEvent {
  final String phoneNumber;
  final BuildContext context;
  final String routeName;

  VerifyPhone({
    required this.phoneNumber,
    required this.context,
    required this.routeName
  });
}

class SigninWithCredential extends PhoneverificationEvent {
  final PhoneAuthCredential credential;
  final BuildContext context;
  final String routeName;
  SigninWithCredential({
    required this.credential,
    required this.context,
    required this.routeName,
  });
}

class Signout extends PhoneverificationEvent {
  Signout();
}
