part of 'saveloan_bloc.dart';

abstract class SaveloanState {
  const SaveloanState();
}

class SaveloanLoading extends SaveloanState {}

class SaveloanSuccess extends SaveloanState {
  final SaveLoan saveLoan;
  SaveloanSuccess(this.saveLoan);
}

class SaveloanFailed extends SaveloanState {
  final String message;
  SaveloanFailed(this.message);
}

class SaveloanFetchSucces extends SaveloanState {
  final List<SaveLoan> saveloan;
  SaveloanFetchSucces(this.saveloan);
}

