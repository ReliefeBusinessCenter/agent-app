import 'package:app/model/save_loan.dart';
import 'package:app/repository/save_loan_repository.dart';
import 'package:bloc/bloc.dart';

part 'saveloan_event.dart';
part 'saveloan_state.dart';

class SaveloanBloc extends Bloc<SaveloanEvent, SaveloanState> {
  final SaveLoanRepository saveLoanRepository;
  SaveloanBloc({required this.saveLoanRepository})
      : super(SaveloanLoading());

  @override
  Stream<SaveloanState> mapEventToState(SaveloanEvent event) async* {
    if (event is SaveLoanFetchEvent) {
      yield SaveloanLoading();
      try {
        final _responseList = await saveLoanRepository.getAllSaveLoans();
        if (_responseList is List<SaveLoan>) {
          yield SaveloanFetchSucces(_responseList);
        } else {
          yield SaveloanFailed("Error happended");
        }
      } catch (e) {
        yield SaveloanFailed(e.toString());
      }
    } else if (event is CreateSaveLoanEvent) {
      yield SaveloanLoading();
      try {
        SaveLoan _saveLoan = await saveLoanRepository.createSaveLoan(
            event.saveLoan,
            event.isProfileImageChanged,
            event.isIdImageChanged);
        if (_saveLoan is SaveLoan) {
          yield SaveloanCreateSuccess();
        } else {
          yield SaveloanFailed(_saveLoan.toString());
        }
      } catch (e) {
        yield SaveloanFailed(e.toString());
      }
    } else if (event is SaveLoanSuccessEvent) {
      yield SaveloanSuccess(SaveLoan());
    }
  }
}
