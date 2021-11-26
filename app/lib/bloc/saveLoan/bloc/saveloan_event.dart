part of 'saveloan_bloc.dart';

abstract class SaveloanEvent {
  const SaveloanEvent();
}

class CreateSaveLoanEvent extends SaveloanEvent {
  final SaveLoan saveLoan;
  CreateSaveLoanEvent(this.saveLoan);
}

class SaveLoanSuccessEvent extends SaveloanEvent {}
