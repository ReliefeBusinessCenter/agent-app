part of 'saveloan_bloc.dart';

abstract class SaveloanEvent {
  const SaveloanEvent();
}

class CreateSaveLoanEvent extends SaveloanEvent {
  final SaveLoan saveLoan;
  bool isProfileImageChanged;
  bool isIdImageChanged;
  CreateSaveLoanEvent({
    required this.saveLoan,
    required this.isProfileImageChanged,
    required this.isIdImageChanged,
  });
}

class SaveLoanSuccessEvent extends SaveloanEvent {}

class SaveLoanFetchEvent extends SaveloanEvent {}

