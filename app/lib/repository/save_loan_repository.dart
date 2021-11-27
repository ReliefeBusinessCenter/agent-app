import 'package:app/data_provider/save_and_loan_data_provider.dart';
import 'package:app/model/save_loan.dart';

class SaveLoanRepository {
  final SaveLoanDataProvider saveLoanDataProvider;
  SaveLoanRepository({required this.saveLoanDataProvider});

  // create save and loan
  Future<SaveLoan> createSaveLoan(SaveLoan saveLoan) async {
    return await saveLoanDataProvider.createSaveLoan(saveLoan);
  }
}
