import '../../core/config/injection/injection.dart';
import '../../domain/models/user.dart';
import '../../domain/repositories/user_repository.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get call => Get.find();

  final UserRepository _userRepository = locator<UserRepository>();

  final Rx<User> user = Rx<User>(User(id: 0, title: ''));

  // Define a getter for isLoading
  RxBool get isLoading => _isLoading;
  final _isLoading = RxBool(false);

  Future<void> fetchUser(int id) async {
    _isLoading.value = true; // Set isLoading to true when fetching user
    final result = await _userRepository.getUserById(id);
    user.value = result;
    _isLoading.value = false; // Set isLoading to false after fetching user
  }
}
