import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../core/config/injection/injection.dart';
import '../../domain/models/user.dart';
import '../../domain/repositories/user_repository.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get call => Get.find();

  final UserRepository _userRepository = locator<UserRepository>();

  final Rx<List<UserModel>> users = Rx<List<UserModel>>([]);
  final Rx<UserModel?> user = Rx<UserModel?>(null);
  late TextEditingController idController = TextEditingController();
  late TextEditingController titleController = TextEditingController();
  late TextEditingController userIdController = TextEditingController();

  RxBool get fetchUserLoading => _fetchUserLoading;
  final _fetchUserLoading = RxBool(false);

  RxBool get addUserLoading => _addUserLoading;
  final _addUserLoading = RxBool(false);

  RxBool get editUserLoading => _editUserLoading;
  final _editUserLoading = RxBool(false);

  RxBool get deleteUserLoading => _deleteUserLoading;
  final _deleteUserLoading = RxBool(false);

  // Reactive string for success message
  final RxString successMessage = RxString('');

  Future<Result<Exception, List<UserModel>>> fetchUsers() async {
    var result = await _userRepository.getUsers();
    fetchUserLoading.value = true;
    result.when((error) {
      fetchUserLoading.value = false;
      // change(null, status: RxStatus.error(error.toString()));
    }, (post) {
      users.value = post;
      fetchUserLoading.value = false;
      // change(null, status: RxStatus.loading());
      // change(students, status: RxStatus.success());
    });
    return result;
  }

  Future<Result<Exception, UserModel>> fetchUser(int id) async {
    var result = await _userRepository.getOneUser(id);
    fetchUserLoading.value = true;
    result.when((error) {
      fetchUserLoading.value = false;
      // change(null, status: RxStatus.error(error.toString()));
    }, (post) {
      user.value = post;
      fetchUserLoading.value = false;
      // change(null, status: RxStatus.loading());
      // change(students, status: RxStatus.success());
    });
    return result;
  }

  Future<Result<Exception, void>> signUpUser(String email, String password) async {
    var result = await _userRepository.signUpUser(email,password);
    fetchUserLoading.value = true;
    result.when((error) {
      print(error);
      // fetchUserLoading.value = false;
      // change(null, status: RxStatus.error(error.toString()));
    }, (_) {
      // user.value = post;
      // fetchUserLoading.value = false;
      // change(null, status: RxStatus.loading());
      // change(students, status: RxStatus.success());
    });
    return result;
  }

  Future<Result<Exception, void>> signInUser(String email, String password) async {
    var result = await _userRepository.signInUser(email,password);
    fetchUserLoading.value = true;
    result.when((error) {
      print(error);
      // fetchUserLoading.value = false;
      // change(null, status: RxStatus.error(error.toString()));
    }, (_) {
      // user.value = post;
      // fetchUserLoading.value = false;
      // change(null, status: RxStatus.loading());
      // change(students, status: RxStatus.success());
    });
    return result;
  }

  Future<Result<Exception, void>> resetPassword(String email) async {
    var result = await _userRepository.resetPassword(email);
    // fetchUserLoading.value = true;
    result.when((error) {
      print(error);
      // fetchUserLoading.value = false;
      // change(null, status: RxStatus.error(error.toString()));
    }, (_) {
      // user.value = post;
      // fetchUserLoading.value = false;
      // change(null, status: RxStatus.loading());
      // change(students, status: RxStatus.success());
    });
    return result;
  }

  Future<Result<Exception, void>> logOut() async {
    var result = await _userRepository.logOut();
    // fetchUserLoading.value = true;
    result.when((error) {
      print(error);
      // fetchUserLoading.value = false;
      // change(null, status: RxStatus.error(error.toString()));
    }, (_) {
      GetStorage().write('token', null);
      // user.value = post;
      // fetchUserLoading.value = false;
      // change(null, status: RxStatus.loading());
      // change(students, status: RxStatus.success());
    });
    return result;
  }

  Future<Result<Exception, void>> createPost(String title) async {
    var result = await _userRepository.createPost(title);
    // fetchUserLoading.value = true;
    result.when((error) {
      print(error);
      // fetchUserLoading.value = false;
      // change(null, status: RxStatus.error(error.toString()));
    }, (_) {
      print(title);
      // user.value = post;
      // fetchUserLoading.value = false;
      // change(null, status: RxStatus.loading());
      // change(students, status: RxStatus.success());
    });
    return result;
  }

  // Future<void> addUser(String title) async {
  //   _addUserLoading.value = true;
  //   try {
  //     await _userRepository.postUser(10, title);
  //     // Set success message
  //     successMessage.value = 'User added successfully';
  //   } catch (e) {
  //     // Set error message
  //     successMessage.value = 'Failed to add user: $e';
  //   }
  //   _addUserLoading.value = false;
  // }
  //
  // Future<void> editUser() async {
  //   _editUserLoading.value = true;
  //   try {
  //     final title = titleController.text.trim();
  //     final userId = int.parse(userIdController.text.trim());
  //     final id = int.parse(idController.text.trim());
  //     await _userRepository.editUser(userId, id, title);
  //     // Set success message
  //     successMessage.value = 'User edited successfully';
  //   } catch (e) {
  //     // Set error message
  //     successMessage.value = 'Failed to edit user: $e';
  //   }
  //   _editUserLoading.value = false;
  // }
  //
  // Future<void> deleteUser() async {
  //   _deleteUserLoading.value = true;
  //   try {
  //     final id = int.parse(idController.text.trim());
  //     await _userRepository.deleteUser(id);
  //     // Set success message
  //     successMessage.value = 'User deleted successfully';
  //   } catch (e) {
  //     // Set error message
  //     successMessage.value = 'Failed to delete user: $e';
  //   }
  //   _deleteUserLoading.value = false;
  // }
}