import 'package:app/model/save_loan.dart';
import 'package:app/repository/save_loan_repository.dart';
import 'package:bloc/bloc.dart';

part 'saveloan_event.dart';
part 'saveloan_state.dart';

class SaveloanBloc extends Bloc<SaveloanEvent, SaveloanState> {
  final SaveLoanRepository saveLoanRepository;
  SaveloanBloc({required this.saveLoanRepository})
      : super(SaveloanSuccess(SaveLoan()));

  @override
  Stream<SaveloanState> mapEventToState(SaveloanEvent event) async* {
    if (event is CreateSaveLoanEvent) {
      yield SaveloanLoading();
      try {
        SaveLoan _saveLoan =
            await saveLoanRepository.createSaveLoan(event.saveLoan, event.isProfileImageChanged, event.isIdImageChanged);
        if (_saveLoan is SaveLoan) {
          yield SaveloanSuccess(_saveLoan);
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
