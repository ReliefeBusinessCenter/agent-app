part of 'phoneverification_bloc.dart';

abstract class PhoneverificationState extends Equatable {
  const PhoneverificationState();

  @override
  List<Object> get props => [];
}

class PhoneVerificationLoading extends PhoneverificationState {}

class PhoneverificationInitial extends PhoneverificationState {}

class PhoneVerificationSuccess extends PhoneverificationState{
  final String verificationId;
  final PhoneVerificationStatus status;

  PhoneVerificationSuccess({
    required this.status,
    required this.verificationId,
  });
}

class PhoneVerificationError extends PhoneverificationState {
  final String message;
  PhoneVerificationError({
    required this.message,
  });
}
