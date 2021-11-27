import 'package:app/data_provider/save_and_loan_data_provider.dart';
import 'package:app/model/save_loan.dart';

class SaveLoanRepository {
  final SaveLoanDataProvider saveLoanDataProvider;
  SaveLoanRepository({required this.saveLoanDataProvider});

  // save loan
  Future<List<SaveLoan>> getAllSaveLoans() async {
    return await saveLoanDataProvider.getAllSaveLoans();
  }

  // create save and loan
  Future<SaveLoan> createSaveLoan(SaveLoan saveLoan, bool isProfileImageChanged,
      bool isIdImageChanged) async {
    return await saveLoanDataProvider.createSaveLoan(
        saveLoan, isProfileImageChanged, isIdImageChanged);
  }
}
