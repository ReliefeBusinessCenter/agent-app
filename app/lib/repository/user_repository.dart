import 'package:app/data_provider/user_data_provider.dart';
import 'package:app/model/broker/user.dart';
import 'package:app/model/login_info.dart';

class UserRepository {
  final UserDataProvider userDataProvider;
  UserRepository({
    required this.userDataProvider,
  });

  Future<LoggedUserInfo> login(LoginInfo user) async {
    return await userDataProvider.login(user);
  }

  Future<void> updatepassword(String password, confirmedPassword) async {
    await userDataProvider.updatePassword(password, confirmedPassword);
  }

  Future<void> sendOtp(String email) async {
    await userDataProvider.sendOtp(email);
  }

  Future<void> changePassword(
      String email, otp, password, confirmed_password) async {
    await userDataProvider.changePassword(
        email, otp, password, confirmed_password);
  }

   Future<User?> getUserByPhone(String phone) async {
    final UserData = await userDataProvider.getUserByPhone(phone);
  
    return UserData;
  }

  Future<bool> updateUser(User user) async {
    return await userDataProvider.updateUser(user);
  }
}
